/*
 * IO_Flow_NS3_Based.cpp
 *
 *  Created on: Mar 23, 2021
 *      Author: kkant
 */

#include "ns3/IO_Flow_NS3_Based.h"
#include "ns3/IO_Flow_Base.h"
#include "ns3/Engine.h"
#include "ns3/StringTools.h"
#include "ASCII_Trace_Definition.h"
#include "ns3/DistributionTypes.h"
#include "ns3/Host_IO_Request.h"
#include "ns3/SimInterface.h"

using namespace ns3;
using namespace std;

namespace ns3
{
	namespace Host_Components
	{
	IO_Flow_NS3_Based*** IO_Flow_NS3_Based::_instance = NULL;
	int IO_Flow_NS3_Based::count = 0;

	IO_Flow_NS3_Based::IO_Flow_NS3_Based(const sim_object_id_type &name, uint16_t flow_id, LHA_type start_lsa_on_device, LHA_type end_lsa_on_device, uint16_t io_queue_id, uint16_t nvme_submission_queue_size, uint16_t nvme_completion_queue_size, IO_Flow_Priority_Class::Priority priority_class, HostInterface_Types SSD_device_type, PCIe_Root_Complex *pcie_root_complex, SATA_HBA *sata_hba,
											 bool enabled_logging, sim_time_type logging_period, std::string logging_file_path) : IO_Flow_Base(name, flow_id, start_lsa_on_device, end_lsa_on_device, io_queue_id, nvme_submission_queue_size, nvme_completion_queue_size, priority_class,0,0,0, SSD_device_type, pcie_root_complex, sata_hba, enabled_logging, logging_period, logging_file_path)
	{
		/*if (percentage_to_be_simulated > 100)
		{
			percentage_to_be_simulated = 100;
			PRINT_MESSAGE("Bad value for percentage of trace file! It is set to 100 % ");
		}*/
		NS_LOG_UNCOND("ID:"<<this->ID());
		if(std::isdigit(this->ID()[5])==0)
		        device_id = this->ID()[4] - '0';
		    else
		        device_id = std::stoi(this->ID().substr(4,2));

		if (IO_Flow_NS3_Based::_instance == NULL) {
		            _instance = new IO_Flow_NS3_Based**[DEVICES];
		            for(int i = 0; i < DEVICES; ++i){
		                _instance[i] = new IO_Flow_NS3_Based*[1];

		                /*for(int j = 0; j < 1; ++j){
		                    _instance[i][j] = new IO_Flow_NS3_Based();
		                }*/
		            }
		            //_instance = new Engine[DEVICES];
		        }
		IO_Flow_NS3_Based::_instance[device_id][flow_id] = this;

		NS_LOG_UNCOND("DEVICE_ID:"<<device_id);


		flow_ended = false;
	}

	IO_Flow_NS3_Based::~IO_Flow_NS3_Based()
	{
	}

	IO_Flow_NS3_Based ***IO_Flow_NS3_Based::Instance()
	{
		return IO_Flow_NS3_Based::_instance;
	}

    std::unordered_map<sim_time_type,SimInterfaceRequest*> IO_Flow_NS3_Based::GetResponseTracker()
	{
    	return response_tracker;
	}

    SimInterfaceRequest *IO_Flow_NS3_Based::debugmap(std::unordered_map<sim_time_type,SimInterfaceRequest*> map, sim_time_type time)
    {
    	return map[time];
    }
	Host_IO_Request *IO_Flow_NS3_Based::Generate_next_request()
	{
		/*if (current_trace_line.size() == 0 || STAT_generated_request_count >= total_requests_to_be_generated)
		{
			return NULL;
		}*/

		Host_IO_Request *request = new Host_IO_Request;
                SimInterfaceRequest *simReq;
                //cout<<"MQSim Time"<<MQsim_Simulator->Time()<<"\n";
		if(!MQsim_Simulator[device_id]->queued_requests[flow_id].empty()){
                  simReq = MQsim_Simulator[device_id]->queued_requests[flow_id].front ();

                  //SimInterfaceRequest *simRes = new SimInterfaceRequest(simReq->flow_id,Simulator::Now().GetNanoSeconds(),simReq->Start_LBA,simReq->LBA_count,simReq->Type, simReq->request_id);
                  //simRes->request_id = simReq->request_id;
                  simReq->Arrival_time = Simulator::Now().GetNanoSeconds();
                  simReq->device = this->device_id;
                  /*if(simReq->Arrival_time==3038040694)
                	  NS_LOG_UNCOND("HEE");*/
                  //MQsim_Simulator->queued_response[flow_id].push_front(simRes);
                  while(response_tracker.find(simReq->Arrival_time)!=response_tracker.end())
                	  simReq->Arrival_time+=1;

                  if(simReq->Arrival_time==783134)
                        NS_LOG_UNCOND("sifr id: "<<simReq->request_id);

                  response_tracker[simReq->Arrival_time]=simReq;
                  if(response_tracker.find(simReq->Arrival_time)==response_tracker.end())
                	  NS_FATAL_ERROR("NULL");

                  MQsim_Simulator[device_id]->queued_requests[flow_id].pop ();
                    /*if(simReq->Start_LBA==0)
                    {
                      flow_ended = true;
                      return NULL;
                    }*/
                    //else
                      //{
                        if (simReq->Type == Request_Type::WRITE)
                        {
                          request->Type = Host_IO_Request_Type::WRITE;
                          STAT_generated_write_request_count++;
                        }
                        else
                        {
                          request->Type = Host_IO_Request_Type::READ;
                          STAT_generated_read_request_count++;
                        }
                       /* if(simReq->flow_id==0)
                        {
                            request->LBA_count = 1;
                        }
                        else
                        {*/
                        	request->LBA_count = 5 + rand()%10;//simReq->LBA_count;
                        //}
                        request->Start_LBA = simReq->Start_LBA;
                        request->Arrival_time = simReq->Arrival_time;//Simulator::Now().GetNanoSeconds();
                      //}
                    //cout<<"\n Request ID: "<<simRes->request_id<<" for flow "<<simRes->flow_id;
                    //NS_LOG_UNCOND("Generated for device: "<<device_id);
                   // delete simReq;


                    //NS_LOG_UNCOND("sifr id: "<<simReq->request_id);

		}
                else{
                  // printf("\n ******* No request********");
                    return NULL;
                }

		/*if(request->Type == Host_IO_Request_Type::READ){
			STAT_generated_read_request_count++;
		}
		else{
			STAT_generated_write_request_count++;
		}*/


		/*if (current_trace_line[ASCIITraceTypeColumn].compare(ASCIITraceWriteCode) == 0)
		{
			request->Type = Host_IO_Request_Type::WRITE;
			STAT_generated_write_request_count++;
		}
		else
		{
			request->Type = Host_IO_Request_Type::READ;
			STAT_generated_read_request_count++;
		}


		char *pEnd;
		request->LBA_count = std::strtoul(current_trace_line[ASCIITraceSizeColumn].c_str(), &pEnd, 0);

		request->Start_LBA = std::strtoull(current_trace_line[ASCIITraceAddressColumn].c_str(), &pEnd, 0);
		if (request->Start_LBA <= (end_lsa_on_device - start_lsa_on_device))
		{
			request->Start_LBA += start_lsa_on_device;
		}
		else
		{
			request->Start_LBA = start_lsa_on_device + request->Start_LBA % (end_lsa_on_device - start_lsa_on_device);
		}

		request->Arrival_time = time_offset + MQsim_Simulator->Time();*/

		STAT_generated_request_count++;

		return request;
	}

	void IO_Flow_NS3_Based::NVMe_consume_io_request(Completion_Queue_Entry *io_request)
	{
		IO_Flow_Base::NVMe_consume_io_request(io_request);
		IO_Flow_Base::NVMe_update_and_submit_completion_queue_tail();
		//if(device_id==0)
			//NS_LOG_UNCOND("Request went to device: "<<device_id);
		//SimInterfaceRequest *simRes = MQsim_Simulator->queued_response[flow_id].front();
		//simRes->response = true;
		//MQsim_Simulator->queued_response[flow_id].pop_front();
		//MQsim_Simulator->queued_response[flow_id].push_back(simRes);

	}

	void IO_Flow_NS3_Based::SATA_consume_io_request(Host_IO_Request *io_request)
	{
		IO_Flow_Base::SATA_consume_io_request(io_request);
	}

	void IO_Flow_NS3_Based::Start_simulation()
	{
		IO_Flow_Base::Start_simulation();

		//std::string trace_line;
		//char *pEnd;

		//trace_file.open(trace_file_path, std::ios::in);
		/*if (!trace_file.is_open())
		{
			PRINT_ERROR("Error while opening input trace file: " << trace_file_path)
		}
		PRINT_MESSAGE("Investigating input trace file: " << trace_file_path);*/

		/*sim_time_type last_request_arrival_time = 0;
		while (std::getline(trace_file, trace_line))
		{
			Utils::Helper_Functions::Remove_cr(trace_line);
			current_trace_line.clear();
			Utils::Helper_Functions::Tokenize(trace_line, ASCIILineDelimiter, current_trace_line);
			if (current_trace_line.size() != ASCIIItemsPerLine)
			{
				break;
			}
			total_requests_in_file++;
			sim_time_type prev_time = last_request_arrival_time;
			last_request_arrival_time = std::strtoll(current_trace_line[ASCIITraceTimeColumn].c_str(), &pEnd, 10);
			if (last_request_arrival_time < prev_time)
			{
				PRINT_ERROR("Unexpected request arrival time: " << last_request_arrival_time << "\nMQSim expects request arrival times to be monotonically increasing in the input trace!")
			}
		}

		trace_file.close();
		PRINT_MESSAGE("Trace file: " << trace_file_path << " seems healthy");
		*/
		/*
		if (total_replay_no == 1)
		{
			total_requests_to_be_generated = (int)(((double)percentage_to_be_simulated / 100) * total_requests_in_file);
		}
		else
		{
			total_requests_to_be_generated = total_requests_in_file * total_replay_no;
		}*/

		//trace_file.open(trace_file_path);
		//current_trace_line.clear();
		//std::getline(trace_file, trace_line);
		//Utils::Helper_Functions::Remove_cr(trace_line);
		//Utils::Helper_Functions::Tokenize(trace_line, ASCIILineDelimiter, current_trace_line);

          //Host_IO_Request *request = new Host_IO_Request;
		//MQsim_Simulator[device_id]->req_counts=0;
			//NS_ABORT_IF(device_id==1);
          if(!MQsim_Simulator[device_id]->queued_requests[flow_id].empty()){
            SimInterfaceRequest *simReq = MQsim_Simulator[device_id]->queued_requests[flow_id].front ();
            //MQsim_Simulator->queued_requests[flow_id].pop ();
            MQsim_Simulator[device_id]->Register_sim_event(device_id, simReq->Arrival_time, this);

          }
        /*  else{
            MQsim_Simulator[device_id]->Register_sim_event(device_id, 0, this);

          }*/

		//MQsim_Simulator->Register_sim_event(std::strtoll(current_trace_line[ASCIITraceTimeColumn].c_str(), &pEnd, 10), this);
		//MQsim_Simulator->Register_sim_event(request->Enqueue_time, this);
	}

	void IO_Flow_NS3_Based::Validate_simulation_config()
	{
	}

	void IO_Flow_NS3_Based::Execute_simulator_event(MQSimEngine::Sim_Event *)
	{
		//NS_LOG_UNCOND("Arrival time: " <<Simulator::Now().GetNanoSeconds()<<" device "<<device_id<<" index "<<flow_id);
		Host_IO_Request *request = Generate_next_request();
		if (request != NULL)
		{
			//NS_LOG_UNCOND("Request received");
		//IO_Flow_NS3_Based::count++;

			Submit_io_request(request);
		}
		else
		{
			NS_FATAL_ERROR("Request is null");
		}
              /*if(!MQsim_Simulator[device_id]->queued_requests[flow_id].empty()){
                SimInterfaceRequest *simReq = MQsim_Simulator[device_id]->queued_requests[flow_id].front ();
                //MQsim_Simulator->queued_requests[flow_id].pop ();
               if(simReq->Arrival_time<MQsim_Simulator[device_id]->Time())
            	   simReq->Arrival_time=MQsim_Simulator[device_id]->Time();

                MQsim_Simulator[device_id]->Register_sim_event(device_id, simReq->Arrival_time, this);

              }
              else{
                MQsim_Simulator[device_id]->Register_sim_event(device_id, MQsim_Simulator[device_id]->Time()+1000, this);
                MQsim_Simulator[device_id]->skip_c++;

                uint32_t x = ns3::Simulator::GetUID();
                ns3::Simulator::uid[x] = true;
                x=0;


              }*/
		/*if (STAT_generated_request_count < total_requests_to_be_generated)
		{
			std::string trace_line;
			if (std::getline(trace_file, trace_line))
			{
				Utils::Helper_Functions::Remove_cr(trace_line);
				current_trace_line.clear();
				Utils::Helper_Functions::Tokenize(trace_line, ASCIILineDelimiter, current_trace_line);
			}
			else
			{
				trace_file.close();
				trace_file.open(trace_file_path);
				replay_counter++;
				time_offset = MQsim_Simulator->Time();
				std::getline(trace_file, trace_line);
				Utils::Helper_Functions::Remove_cr(trace_line);
				current_trace_line.clear();
				Utils::Helper_Functions::Tokenize(trace_line, ASCIILineDelimiter, current_trace_line);
				PRINT_MESSAGE("* Replay round " << replay_counter << "of " << total_replay_no << " started  for" << ID())
			}
			char *pEnd;
			MQsim_Simulator->Register_sim_event(time_offset + std::strtoll(current_trace_line[ASCIITraceTimeColumn].c_str(), &pEnd, 10), this);
		}*/
	}

	void IO_Flow_NS3_Based::Get_statistics(Utils::Workload_Statistics &stats, LPA_type (*Convert_host_logical_address_to_device_address)(int id, LHA_type lha),
											 page_status_type (*Find_NVM_subunit_access_bitmap)(int id, LHA_type lha))
	{
		stats.Type = Utils::Workload_Type::TRACE_BASED;
		stats.Stream_id = io_queue_id - 1; //In MQSim, there is a simple relation between stream id and the io_queue_id of NVMe
		stats.Min_LHA = start_lsa_on_device;
		stats.Max_LHA = end_lsa_on_device;
		for (int i = 0; i < MAX_ARRIVAL_TIME_HISTOGRAM + 1; i++)
		{
			stats.Write_arrival_time.push_back(0);
			stats.Read_arrival_time.push_back(0);
		}
		for (int i = 0; i < MAX_REQSIZE_HISTOGRAM_ITEMS + 1; i++)
		{
			stats.Write_size_histogram.push_back(0);
			stats.Read_size_histogram.push_back(0);
		}
		stats.Total_generated_requests = 0;
		stats.Total_accessed_lbas = 0;


		//Commenting as involved trace read
		/*
		std::ifstream trace_file_temp;
		trace_file_temp.open(trace_file_path, std::ios::in);
		if (!trace_file_temp.is_open())
		{
			PRINT_ERROR("Error while opening the input trace file!")
		}

		std::string trace_line;
		char *pEnd;
		sim_time_type last_request_arrival_time = 0;
		sim_time_type sum_inter_arrival = 0;
		uint64_t sum_request_size = 0;
		std::vector<std::string> line_splitted;
		while (std::getline(trace_file_temp, trace_line))
		{
			Utils::Helper_Functions::Remove_cr(trace_line);
			line_splitted.clear();
			Utils::Helper_Functions::Tokenize(trace_line, ASCIILineDelimiter, line_splitted);
			if (line_splitted.size() != ASCIIItemsPerLine)
			{
				break;
			}
			sim_time_type prev_time = last_request_arrival_time;
			last_request_arrival_time = std::strtoull(line_splitted[ASCIITraceTimeColumn].c_str(), &pEnd, 10);
			if (last_request_arrival_time < prev_time)
			{
				PRINT_ERROR("Unexpected request arrival time: " << last_request_arrival_time << "\nMQSim expects request arrival times to be monotonic increasing in the input trace!")
			}
			sim_time_type diff = (last_request_arrival_time - prev_time) / 1000; //The arrival rate histogram is stored in the microsecond unit
			sum_inter_arrival += last_request_arrival_time - prev_time;

			unsigned int LBA_count = std::strtoul(line_splitted[ASCIITraceSizeColumn].c_str(), &pEnd, 0);
			sum_request_size += LBA_count;
			LHA_type start_LBA = std::strtoull(line_splitted[ASCIITraceAddressColumn].c_str(), &pEnd, 0);
			if (start_LBA <= (end_lsa_on_device - start_lsa_on_device))
			{
				start_LBA += start_lsa_on_device;
			}
			else
			{
				start_LBA = start_lsa_on_device + start_LBA % (end_lsa_on_device - start_lsa_on_device);
			}
			LHA_type end_LBA = start_LBA + LBA_count - 1;
			if (end_LBA > end_lsa_on_device)
			{
				end_LBA = start_lsa_on_device + (end_LBA - end_lsa_on_device) - 1;
			}*/

			//Address access pattern statistics
			/*while (start_LBA <= end_LBA)
			{
				LPA_type device_address = Convert_host_logical_address_to_device_address(start_LBA);
				page_status_type access_status_bitmap = Find_NVM_subunit_access_bitmap(start_LBA);
				if (line_splitted[ASCIITraceTypeColumn].compare(ASCIITraceWriteCode) == 0)
				{
					if (stats.Write_address_access_pattern.find(device_address) == stats.Write_address_access_pattern.end())
					{
						Utils::Address_Histogram_Unit hist;
						hist.Access_count = 1;
						hist.Accessed_sub_units = access_status_bitmap;
						stats.Write_address_access_pattern[device_address] = hist;
					}
					else
					{
						stats.Write_address_access_pattern[device_address].Access_count = stats.Write_address_access_pattern[device_address].Access_count + 1;
						stats.Write_address_access_pattern[device_address].Accessed_sub_units = stats.Write_address_access_pattern[device_address].Accessed_sub_units | access_status_bitmap;
					}

					if (stats.Read_address_access_pattern.find(device_address) != stats.Read_address_access_pattern.end())
					{
						stats.Write_read_shared_addresses.insert(device_address);
					}
				}
				else
				{
					if (stats.Read_address_access_pattern.find(device_address) == stats.Read_address_access_pattern.end())
					{
						Utils::Address_Histogram_Unit hist;
						hist.Access_count = 1;
						hist.Accessed_sub_units = access_status_bitmap;
						stats.Read_address_access_pattern[device_address] = hist;
					}
					else
					{
						stats.Read_address_access_pattern[device_address].Access_count = stats.Read_address_access_pattern[device_address].Access_count + 1;
						stats.Read_address_access_pattern[device_address].Accessed_sub_units = stats.Read_address_access_pattern[device_address].Accessed_sub_units | access_status_bitmap;
					}

					if (stats.Write_address_access_pattern.find(device_address) != stats.Write_address_access_pattern.end())
					{
						stats.Write_read_shared_addresses.insert(device_address);
					}
				}
				stats.Total_accessed_lbas++;
				start_LBA++;
				if (start_LBA > end_lsa_on_device)
				{
					start_LBA = start_lsa_on_device;
				}
			}

			//Request size statistics
			if (line_splitted[ASCIITraceTypeColumn].compare(ASCIITraceWriteCode) == 0)
			{
				if (diff < MAX_ARRIVAL_TIME_HISTOGRAM)
				{
					stats.Write_arrival_time[diff]++;
				}
				else
				{
					stats.Write_arrival_time[MAX_ARRIVAL_TIME_HISTOGRAM]++;
				}

				if (LBA_count < MAX_REQSIZE_HISTOGRAM_ITEMS)
				{
					stats.Write_size_histogram[LBA_count]++;
				}
				else
				{
					stats.Write_size_histogram[MAX_REQSIZE_HISTOGRAM_ITEMS]++;
				}
			}
			else
			{
				if (diff < MAX_ARRIVAL_TIME_HISTOGRAM)
				{
					stats.Read_arrival_time[diff]++;
				}
				else
				{
					stats.Read_arrival_time[MAX_ARRIVAL_TIME_HISTOGRAM]++;
				}

				if (LBA_count < MAX_REQSIZE_HISTOGRAM_ITEMS)
				{
					stats.Read_size_histogram[LBA_count]++;
				}
				else
				{
					stats.Read_size_histogram[(unsigned int)MAX_REQSIZE_HISTOGRAM_ITEMS]++;
				}
			}
			stats.Total_generated_requests++;
		}
		trace_file_temp.close();
		stats.Average_request_size_sector = (unsigned int)(sum_request_size / stats.Total_generated_requests);
		stats.Average_inter_arrival_time_nano_sec = sum_inter_arrival / stats.Total_generated_requests;

		stats.Initial_occupancy_ratio = initial_occupancy_ratio;
		stats.Replay_no = total_replay_no;*/
	}
	} // namespace Host_Components
}



