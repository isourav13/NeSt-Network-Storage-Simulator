#include "../sim/Sim_Defs.h"
#include "../sim/Engine.h"
#include "PCIe_Link.h"
#include "PCIe_Message.h"

namespace Host_Components
{
	PCIe_Link::PCIe_Link(const sim_object_id_type& id, PCIe_Root_Complex* root_complex, PCIe_Switch* pcie_switch,
		double lane_bandwidth_GBPs, int lane_count, int tlp_header_size,
		int tlp_max_payload_size, int dllp_ovehread, int ph_overhead) :
		Sim_Object(id), root_complex(root_complex), pcie_switch(pcie_switch),
		lane_bandwidth_GBPs(lane_bandwidth_GBPs), lane_count(lane_count),
		tlp_header_size(tlp_header_size), tlp_max_payload_size(tlp_max_payload_size), dllp_ovehread(dllp_ovehread), ph_overhead(ph_overhead)
	{
		packet_overhead = ph_overhead + dllp_ovehread + tlp_header_size;
        for(int i=0;i<IO_Flow_Priority_Class::NUMBER_OF_PRIORITY_LEVELS;i++)
        {
            weight_before_scheduling[i] = 0;
            weight_after_scheduling[i] = 0;
        }
        ios=0;
        robin_count = 0;
	}

	void PCIe_Link::Set_root_complex(PCIe_Root_Complex* root_complex)
	{
		this->root_complex = root_complex;
	}

	void PCIe_Link::Set_pcie_switch(PCIe_Switch* pcie_switch) 
	{
		this->pcie_switch = pcie_switch;
	}

	void PCIe_Link::Deliver(PCIe_Message* message)
	{
        int priority = -1;
        int count= 0;
        switch (message->Destination) {
			case PCIe_Destination_Type::HOST://Message from SSD device to the host
				Message_buffer_toward_root_complex.push(message);
				if (Message_buffer_toward_root_complex.size() > 1) {//There are active transfers
					return;
				}
				Simulator->Register_sim_event(Simulator->Time() + estimate_transfer_time(message), this, (void*)(intptr_t)PCIe_Destination_Type::HOST, static_cast<int>(PCIe_Link_Event_Type::DELIVER));
				break;

			case PCIe_Destination_Type::DEVICE_RW://Message from Host to the SSD device
                if(message->Address == SUBMISSION_QUEUE_REGISTER_1 || message->Address == SUBMISSION_QUEUE_REGISTER_5) {
                    priority = 0;
                }
                else if(message->Address == SUBMISSION_QUEUE_REGISTER_2 || message->Address == SUBMISSION_QUEUE_REGISTER_6) {
                    priority = 1;
                }
                else if(message->Address == SUBMISSION_QUEUE_REGISTER_3 || message->Address == SUBMISSION_QUEUE_REGISTER_7) {
                    priority = 2;
                }
                else if(message->Address == SUBMISSION_QUEUE_REGISTER_4 || message->Address == SUBMISSION_QUEUE_REGISTER_8) {
                    priority = 3;
                }

				Message_buffer_toward_ssd_device_b[priority].push(message);

                if (Message_buffer_toward_ssd_device_a.size()> 1) {
                    /*if(priority==2)
                        PRINT_MESSAGE("HERE");*/
					    return;//count++;
				}
                //if(count>3)
                    //return;
                Message_buffer_toward_ssd_device_a.push(message);
                Message_buffer_toward_ssd_device_b[priority].pop();
                if(priority>0)
                    weight_before_scheduling[priority]++;
                /*if(priority<4){
                    PRINT_MESSAGE("IOCOUNT "<<ios);
                    ios++;
                }*/
				Simulator->Register_sim_event(Simulator->Time() + estimate_transfer_time(message), this, (void*)(intptr_t)PCIe_Destination_Type::DEVICE_RW, static_cast<int>(PCIe_Link_Event_Type::DELIVER));
				break;
            case PCIe_Destination_Type::DEVICE://Message from Host to the SSD device
                Message_buffer_toward_ssd_device.push(message);
                if (Message_buffer_toward_ssd_device.size()> 1) {
                    return;
                }
                Simulator->Register_sim_event(Simulator->Time() + estimate_transfer_time(message), this, (void*)(intptr_t)PCIe_Destination_Type::DEVICE, static_cast<int>(PCIe_Link_Event_Type::DELIVER));
                break;

			default:
				break;
		}
	}

	void PCIe_Link::Start_simulation() {}

	void PCIe_Link::Validate_simulation_config() {}

	void PCIe_Link::Execute_simulator_event(MQSimEngine::Sim_Event* event)
	{
		PCIe_Message* message = NULL;
		PCIe_Destination_Type destination = (PCIe_Destination_Type)(intptr_t)event->Parameters;
		switch (destination) {
			case PCIe_Destination_Type::HOST:
				message = Message_buffer_toward_root_complex.front();
				Message_buffer_toward_root_complex.pop();
				root_complex->Consume_pcie_message(message);
				if (Message_buffer_toward_root_complex.size() > 0) {//There are active transfers
					Simulator->Register_sim_event(Simulator->Time() + estimate_transfer_time(Message_buffer_toward_root_complex.front()),
						this, (void*)(intptr_t)PCIe_Destination_Type::HOST, static_cast<int>(PCIe_Link_Event_Type::DELIVER));
				}
				break;
            case PCIe_Destination_Type::DEVICE:
                message = Message_buffer_toward_ssd_device.front();
                Message_buffer_toward_ssd_device.pop();
                if(message->Destination != PCIe_Destination_Type::DEVICE)
                    throw std::invalid_argument("Incorrect device type!");
                pcie_switch->Deliver_to_device(message);
                if (Message_buffer_toward_ssd_device.size() > 0) {
                    Simulator->Register_sim_event(Simulator->Time() + estimate_transfer_time(Message_buffer_toward_ssd_device.front()),
                                                  this, (void*)(intptr_t)PCIe_Destination_Type::DEVICE, static_cast<int>(PCIe_Link_Event_Type::DELIVER));
                }
                break;
			case PCIe_Destination_Type::DEVICE_RW:

                /*if(Message_buffer_toward_ssd_device_a[4].size()>0) {
                    message = Message_buffer_toward_ssd_device_a[4].front();
                    Message_buffer_toward_ssd_device_a[4].pop();
                }
                else if(Message_buffer_toward_ssd_device_a[0].size()>0) {
                    message = Message_buffer_toward_ssd_device_a[0].front();
                    Message_buffer_toward_ssd_device_a[0].pop();
                }
                else if(weight_before_scheduling[1]!=0 && weight_before_scheduling[1]!=weight_after_scheduling[1])
                {
                    message = Message_buffer_toward_ssd_device_a[1].front();
                    Message_buffer_toward_ssd_device_a[1].pop();
                    weight_after_scheduling[1]++;
                    if(weight_after_scheduling[1] == weight_before_scheduling[1] && weight_after_scheduling[1] == HIGH_WRR)
                        weight_before_scheduling[1] = weight_before_scheduling[1] = 0;
                }
                else if(weight_before_scheduling[2]!=0 && weight_before_scheduling[1]!=weight_after_scheduling[2])
                {
                    message = Message_buffer_toward_ssd_device_a[2].front();
                    Message_buffer_toward_ssd_device_a[2].pop();
                    weight_after_scheduling[2]++;
                    if(weight_after_scheduling[2] == weight_before_scheduling[2] && weight_after_scheduling[2] == MED_WRR)
                        weight_before_scheduling[2] = weight_before_scheduling[2] = 0;
                }
                else if(weight_before_scheduling[3]!=0 && weight_before_scheduling[1]!=weight_after_scheduling[3])
                {
                    message = Message_buffer_toward_ssd_device_a[3].front();
                    Message_buffer_toward_ssd_device_a[3].pop();
                    weight_after_scheduling[3]++;
                    if(weight_after_scheduling[3] == weight_before_scheduling[3] && weight_after_scheduling[3] == LOW_WRR)
                        weight_before_scheduling[3] = weight_before_scheduling[3] = 0;
                }*/
                message = Message_buffer_toward_ssd_device_a.front();
                if(message->Destination != PCIe_Destination_Type::DEVICE_RW)
                    throw std::invalid_argument("Incorrect device type!");
                Message_buffer_toward_ssd_device_a.pop();
				pcie_switch->Deliver_to_device(message);

                int priority = 1;
                if (Message_buffer_toward_ssd_device_b[0].size() > 0) {
                    Message_buffer_toward_ssd_device_a.push(Message_buffer_toward_ssd_device_b[0].front());
                    Message_buffer_toward_ssd_device_b[0].pop();
                    if(Message_buffer_toward_ssd_device_a.front()->Destination != PCIe_Destination_Type::DEVICE_RW)
                        throw std::invalid_argument("Incorrect device type!");
                    Simulator->Register_sim_event(Simulator->Time() + estimate_transfer_time(Message_buffer_toward_ssd_device_a.front()),
                                                  this, (void*)(intptr_t)PCIe_Destination_Type::DEVICE_RW, static_cast<int>(PCIe_Link_Event_Type::DELIVER));
                }
                else
                {
                    if(robin_count >= (HIGH_WRR+MED_WRR+LOW_WRR)) {

                        robin_count = 0;
                        for(int i=0;i<4;i++)
                        {
                            weight_before_scheduling[i] = 0;

                        }
                    }
                    if(Message_buffer_toward_ssd_device_b[1].size()>0 && weight_before_scheduling[1]<HIGH_WRR)
                    {
                        Message_buffer_toward_ssd_device_a.push(Message_buffer_toward_ssd_device_b[1].front());
                        Message_buffer_toward_ssd_device_b[1].pop();
                        if(Message_buffer_toward_ssd_device_a.front()->Destination != PCIe_Destination_Type::DEVICE_RW)
                            throw std::invalid_argument("Incorrect device type!");
                        Simulator->Register_sim_event(Simulator->Time() + estimate_transfer_time(Message_buffer_toward_ssd_device_a.front()),
                                                      this, (void*)(intptr_t)PCIe_Destination_Type::DEVICE_RW, static_cast<int>(PCIe_Link_Event_Type::DELIVER));
                        weight_before_scheduling[1]++;
                        if(weight_before_scheduling[1] == HIGH_WRR)
                            robin_count += HIGH_WRR;
                    }
                    else if(Message_buffer_toward_ssd_device_b[2].size()>0 && weight_before_scheduling[2]<MED_WRR)
                    {
                        robin_count+=HIGH_WRR;
                        weight_before_scheduling[1]=HIGH_WRR;
                        if(Message_buffer_toward_ssd_device_b[2].front()->Destination != PCIe_Destination_Type::DEVICE_RW)
                            throw std::invalid_argument("Incorrect device type!");
                        Message_buffer_toward_ssd_device_a.push(Message_buffer_toward_ssd_device_b[2].front());
                        Message_buffer_toward_ssd_device_b[2].pop();

                        Simulator->Register_sim_event(Simulator->Time() + estimate_transfer_time(Message_buffer_toward_ssd_device_a.front()),
                                                      this, (void*)(intptr_t)PCIe_Destination_Type::DEVICE_RW, static_cast<int>(PCIe_Link_Event_Type::DELIVER));
                        weight_before_scheduling[2]++;
                        if(weight_before_scheduling[2] == MED_WRR)
                            robin_count += MED_WRR;
                    }
                    else if(Message_buffer_toward_ssd_device_b[3].size()>0 && weight_before_scheduling[3]<=LOW_WRR)
                    {
                        robin_count+=MED_WRR+HIGH_WRR;
                        weight_before_scheduling[2]=MED_WRR;
                        Message_buffer_toward_ssd_device_a.push(Message_buffer_toward_ssd_device_b[3].front());
                        Message_buffer_toward_ssd_device_b[3].pop();
                        if(Message_buffer_toward_ssd_device_a.front()->Destination != PCIe_Destination_Type::DEVICE_RW)
                            throw std::invalid_argument("Incorrect device type!");
                        Simulator->Register_sim_event(Simulator->Time() + estimate_transfer_time(Message_buffer_toward_ssd_device_a.front()),
                                                      this, (void*)(intptr_t)PCIe_Destination_Type::DEVICE_RW, static_cast<int>(PCIe_Link_Event_Type::DELIVER));
                        weight_before_scheduling[3]++;
                        if(weight_before_scheduling[3] == LOW_WRR)
                            robin_count += LOW_WRR;
                    }
                    else
                    {
                        /*for(int i=0;i<4;i++)
                        {
                            weight_before_scheduling[i] = 0;

                        }*/
                        for(int i=0;i<4;i++)
                        {
                            if(Message_buffer_toward_ssd_device_b[i].size()>0)
                            {
                                Message_buffer_toward_ssd_device_a.push(Message_buffer_toward_ssd_device_b[i].front());
                                Message_buffer_toward_ssd_device_b[i].pop();
                                if(Message_buffer_toward_ssd_device_a.front()->Destination != PCIe_Destination_Type::DEVICE_RW)
                                    throw std::invalid_argument("Incorrect device type!");
                                Simulator->Register_sim_event(Simulator->Time() + estimate_transfer_time(Message_buffer_toward_ssd_device_a.front()),
                                                              this, (void*)(intptr_t)PCIe_Destination_Type::DEVICE_RW, static_cast<int>(PCIe_Link_Event_Type::DELIVER));

                                break;
                            }
                        }
                        //robin_count+=LOW_WRR+MED_WRR+HIGH_WRR;
                    }
                }
				break;
		}
	}
}
