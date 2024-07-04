#include "PLMSpecs.h"
using namespace ns3;
namespace ns3{
namespace PLMSpecs{

    DTNDT* DTNDT::_instance = NULL;

    DTNDT* DTNDT::Instance() {

        if (_instance == 0) {
            _instance = new DTNDT;
        }
        return _instance;
    }
    void DTNDT::Init(){
        active_dev=1;
        global_device_no=1;
        global_devices=2;
        global_DT_ID =0;
        for(int i=0;i<global_devices;i++)
        {
            is_in_DT.push_back(true);
            DT_start.push_back(0);
            NDT_start.push_back(0);
            global_allocation.push_back(0);
            initial_alloc.push_back(0);
            additional_alloc.push_back(0);
        }
        for (int io_flow_def = 0; io_flow_def <HOSTS; io_flow_def++) {
            rho.push_back(0.0);
            alpha.push_back(0.0);
            used_alloc.push_back(0.0);
            host_counter.push_back(0);
            IA_j.push_back(0);
            AA_j.push_back(0);
            C_j.push_back(0);
            allocated.push_back(false);
            returning.push_back(false);
            flag.push_back(false);
            NDT_req.push_back(false);
            host_device.push_back(1);
            target_latency.push_back(0.0);
            allocated_read_count.push_back(0);
            additional_allocation.push_back(0);
            DT_min.push_back(0);
            deficiency.push_back(0.0);
            alloc_hosts.push_back(false);
        }
    }


    void DTNDT::DT_Coordinator(std::vector<Host_Components::IO_Flow_Base*> IO_flows,int device_no, int reallocation)
    {
        //PRINT_MESSAGE("DT_Coordinator");
        // PRINT_MESSAGE("Reallocation "<<reallocation);
        if(reallocation==0)
        {
            int temp=DT_Count_limit;
            for(int i=0;i<IO_flows_global.size();i++) {
                if(IO_flows_global[i]->Priority_class()==1)
                    allocated_read_count[IO_flows_global[i]->get_flow_id()]=DT_min[0];
                else if(IO_flows_global[i]->Priority_class()==2)
                    allocated_read_count[IO_flows_global[i]->get_flow_id()]=DT_min[1];
                else if(IO_flows_global[i]->Priority_class()==3)
                    allocated_read_count[IO_flows_global[i]->get_flow_id()]=DT_min[2];
                //PRINT_MESSAGE("Flow id "<<IO_flows[i]->get_flow_id());
                PRINT_MESSAGE("Allocated " << allocated_read_count[IO_flows_global[i]->get_flow_id()]);
                global_allocation[device_no-1]+=allocated_read_count[IO_flows_global[i]->get_flow_id()];
                host_device[device_no]=(device_no);
                //IO_flows[i]->current_read_count=allocated_read_count[IO_flows_global[i]->get_flow_id()];
                //IO_flows[i]->set_temp_current_read_count(0);
                IA_j[i]=allocated_read_count[IO_flows_global[i]->get_flow_id()];
                flag[i]=false;
                alloc_hosts[i]=true;
                C_j[i]=DT_Count_limit/3;
                IO_flows_global[i]->sync=false;
                //IO_flows[i]->tail_latency=new int[IO_flows[i]->allocated_read_count];
            }
            allocated[device_no-1]=true;
            host_counter[device_no-1]=HOSTS;
            is_in_DT[device_no-1]=true;
            DT_start[device_no-1]=500075220000;
            //PRINT_ERROR(MQsim_Simulator->Time());
            initial_alloc[device_no-1]=(1-GAMMA)*DT_Count_limit;
            additional_alloc[device_no-1]=GAMMA*DT_Count_limit;
            //host_device
            /*else
            {
              for(int i=0;i<(*is_in_DT).size();i++)
              {
                if((*is_in_DT)[i])
                {

                  return;
                }
              }
            }*/
            //global_allocation=DT_Count_limit;

        }
        else if(reallocation==1)
        {
            uint16_t local_flow_id = IO_flows[0]->get_flow_id();
            int local_device;
            PRINT_MESSAGE(IO_flows[0]->get_flow_id()<<" entering")
            // PRINT_MESSAGE(IO_flows[0]->get_device());
            if(IO_flows[0]->sync)
            {
                local_device = active_dev-1;
                flag[local_flow_id]=false;
                NDT_req[local_flow_id]=false;
                IO_flows[0]->sync=false;
            }
            else if(is_in_DT[host_device[local_flow_id]-1] &&(MQsim_Simulator->Time() - DT_start[host_device[local_flow_id]-1])>=DT_Period && DT_start[host_device[local_flow_id]-1]!=0)
            {
                PRINT_MESSAGE("DT expired at: "<<MQsim_Simulator->Time() <<" for "<<(host_device[local_flow_id] - 1));
                is_in_DT[host_device[local_flow_id] - 1] = false;
                NDT_start[host_device[local_flow_id] - 1] = MQsim_Simulator->Time();
                DT_start[host_device[local_flow_id] - 1] = 0;
                host_counter[host_device[local_flow_id] - 1] = 0;
                allocated[host_device[local_flow_id] - 1] = false;
                global_allocation[host_device[local_flow_id] - 1] = 0;
                //global_DT_ID++;
                PRINT_MESSAGE("DT time period over hence sent to NDT");
                for(int i = 0; i < IO_flows_global.size(); i++)
                {
                    if(NDT_req[i])
                        NDT_req[i]=false;
                    flag[i]=true;
                    if(!alloc_hosts[i])
                        IO_flows_global[i]->sync=true;
                    PRINT_MESSAGE("Bringing back to switch");
                }
                flag[local_flow_id]= false;
                local_device = DEVICE_FLIP(host_device[local_flow_id] - 1);
            }
            else if(global_allocation[host_device[local_flow_id] - 1]>0 && allocated_read_count[local_flow_id]==IA_j[local_flow_id] && alloc_hosts[local_flow_id]) {
                if (!returning[local_flow_id]) {
                    //PRINT_MESSAGE("Returning");
                    PRINT_MESSAGE("Global allocation before subtracting: "<<global_allocation[host_device[local_flow_id] - 1]);
                    global_allocation[host_device[local_flow_id] - 1] =
                            global_allocation[host_device[local_flow_id]- 1] -
                            allocated_read_count[local_flow_id];
                    PRINT_MESSAGE("Global allocation after subtracting: "<<global_allocation[host_device[local_flow_id] - 1]);
                    if (global_allocation[host_device[local_flow_id] - 1] == 0 &&
                        host_counter[host_device[local_flow_id] - 1] == HOSTS) {
                        is_in_DT[host_device[local_flow_id] - 1] = false;
                        DT_start[host_device[local_flow_id] - 1] = 0;
                        NDT_start[host_device[local_flow_id] - 1] = MQsim_Simulator->Time();
                        host_counter[host_device[local_flow_id] - 1] = 0;
                        allocated[host_device[local_flow_id] - 1] = false;
                        //global_DT_ID++;
                        //PRINT_MESSAGE("Sent to NDT");
                        for(int i = 0; i < IO_flows_global.size(); i++)
                        {
                            if(NDT_req[i])
                                NDT_req[i]=false;
                            flag[i]=true;
                            PRINT_MESSAGE("Bringing back from NDT");
                        }
                        flag[local_flow_id]=false;
                        initial_alloc[host_device[local_flow_id] - 1]=0;
                        additional_alloc[host_device[local_flow_id] - 1]=0;
                        // IO_flows[0]->DT_ID = global_DT_ID;
                        local_device = DEVICE_FLIP(host_device[local_flow_id] - 1);
                    }
                    else
                    {
                        local_device = host_device[local_flow_id] - 1;
                        NDT_req[local_flow_id]=true;
                        //  IO_flows[0]->deficiency_read_count=0;
                        //allocated_read_count[local_flow_id]=0;
                        //PRINT_MESSAGE("Local device: "<<local_device);
                        //PRINT_MESSAGE("Same device NDT");
                        //PRINT_MESSAGE(local_flow_id<<" came back");
                        return;

                    }
                    //local_device = DEVICE_FLIP(IO_flows_global[local_flow_id]->get_device() - 1);
                    // IO_flows[0]->set_device(local_device+1);
                }
                else {
                    local_device = host_device[local_flow_id] - 1;
                    PRINT_MESSAGE("Same device");
                    NDT_req[local_flow_id]=true;
                    //  IO_flows[0]->deficiency_read_count=0;
                    //  IO_flows[0]->set_device(local_device+1);
                }
            }
            else if(!allocated[host_device[local_flow_id]-1] && allocated[DEVICE_FLIP(host_device[local_flow_id]-1)])  {
                local_device =
                        DEVICE_FLIP(host_device[local_flow_id] - 1);
                PRINT_MESSAGE("Flipped device");
                //  IO_flows[0]->deficiency_read_count=0;
                flag[local_flow_id]=false;
                NDT_req[local_flow_id]=false;
            }
            else {
                if(is_in_DT[host_device[local_flow_id]-1] &&
                   allocated[host_device[local_flow_id]-1] && host_counter[host_device[local_flow_id] - 1] !=HOSTS
                   && allocated_read_count[local_flow_id]!=IA_j[local_flow_id])
                {
                    local_device = active_dev-1;
                    flag[local_flow_id]=false;
                    NDT_req[local_flow_id]=false;
                }
                else if(!is_in_DT[host_device[local_flow_id]-1] && ((MQsim_Simulator->Time() - NDT_start[host_device[local_flow_id]-1])>=NDT_Period && NDT_start[host_device[local_flow_id]-1]!=0)) {
                    local_device = host_device[local_flow_id] - 1;
                    host_counter[host_device[local_flow_id]- 1] = 0;
                    allocated[host_device[local_flow_id] - 1] = false;
                    global_allocation[host_device[local_flow_id] - 1] = 0;
                    PRINT_MESSAGE("Same device 2");
                    // IO_flows[0]->set_device(local_device+1);
                }
                else {
                    local_device =
                            DEVICE_FLIP(host_device[local_flow_id] - 1);
                    // PRINT_MESSAGE("Flipped device");
                    flag[local_flow_id]=false;
                    NDT_req[local_flow_id]=false;
                    // IO_flows[0]->set_device(local_device+1);
                }
            }

            if(!is_in_DT[local_device] && ((MQsim_Simulator->Time() - NDT_start[local_device])>=NDT_Period) && NDT_start[local_device]!=0) {
                PRINT_MESSAGE("Sending to DT");
                NDT_start[local_device]=0;
                for(int i = 0; i < IO_flows_global.size(); i++) {
                    NDT_req[local_flow_id]=false;
                    flag[local_flow_id]=false;
                }
                is_in_DT[local_device] = true;
            }
            //PRINT_MESSAGE(IO_flows[0]->get_device());
            //PRINT_MESSAGE(flag[local_flow_id])
            if(is_in_DT[local_device] && !flag[local_flow_id]) {
                //PRINT_MESSAGE("Device was: "<<host_device[local_flow_id]);
                host_device[local_flow_id]=(local_device+1);
                //PRINT_MESSAGE("Device is: "<<host_device[local_flow_id]);
                //PRINT_MESSAGE(global_allocation[local_device]);
                //PRINT_MESSAGE(host_counter[local_device]);
                //PRINT_MESSAGE(allocated[local_device]);
                PRINT_MESSAGE("Allocating for: "<<local_flow_id);
                global_device_no = local_device+1;
                float sum=0;
                if(global_allocation[local_device]==0 && !allocated[local_device])
                {

                    PRINT_MESSAGE("Starting to allocate");
                    for(int i=0;i<IO_flows_global.size();i++)
                    {


                        //PRINT_MESSAGE("Priority for flow "<<IO_flows_global[i]->get_flow_id()<<" is "<<IO_flows_global[i]->Priority_class());
                        int t=(IO_flows_global[i]->current_read_count+IO_flows_global[i]->deficiency_read_count);
                        alloc_hosts[i]=false;
                        if(IO_flows_global[i]->deficiency_read_count==0)
                            deficiency[i]=0.0;
                        else
                            deficiency[i]=(t-allocated_read_count[i])*1.0/(t*1.0);
                        flag[local_flow_id]=false;
                        if(IA_j[i]<=0)
                        {

                            PRINT_MESSAGE("SOMETHING IS WRONG");
                            PRINT_MESSAGE("Utilization: "<<rho[i]);
                            PRINT_MESSAGE("Sum: "<<sum);
                            PRINT_MESSAGE("Predicted: "<<C_j[i]);
                            PRINT_MESSAGE("Current Read Count: "<<IO_flows[0]->current_read_count);
                            PRINT_MESSAGE("Temp allocated: "<<IA_j[i]);
                            PRINT_MESSAGE("Error fraction: "<<alpha[local_flow_id]);
                            PRINT_MESSAGE("Target "<<target_latency[local_flow_id]);
                            PRINT_MESSAGE("Experienced "<<IO_flows[0]->tail_latency_experienced);
                            // PRINT_MESSAGE("Experienced: "<<IO_flows[0]->tail_latency_experienced);
                            //PRINT_ERROR("HI");
                        }
                        rho[i] = IO_flows_global[i]->current_read_count*1.0/(IA_j[i]+AA_j[i]);
                        C_j[i] = SIGMA*(IO_flows_global[i]->current_read_count+IO_flows_global[i]->deficiency_read_count) + (1-SIGMA)*C_j[i];
                        //C_j[i]= IO_flows_global[i]->req_count(MQsim_Simulator->Time());
                        /*  if(rho[i]==0)
                          {
                            PRINT_ERROR("Utilization is 0");
                          }
                          else if(rho[i]>1)
                            rho[i]=1;*/
                        float temp=(IO_flows_global[i]->tail_latency_experienced -
                                    target_latency[i]) /
                                   target_latency[i];

                        if(temp>0)
                            alpha[i]=temp;
                        else
                            alpha[i]=0.0;
                        sum=sum+C_j[i];
                        //if(C_j[i]<0)
                        //{

                        //PRINT_MESSAGE("SOMETHING IS WRONG");
                        PRINT_MESSAGE("Utilization: "<<rho[i]);
                        PRINT_MESSAGE("Sum: "<<sum);
                        PRINT_MESSAGE("Predicted: "<<C_j[i]);
                        PRINT_MESSAGE("Current Read Count: "<<IO_flows_global[i]->current_read_count);
                        PRINT_MESSAGE("Temp allocated: "<<IA_j[i]);
                        PRINT_MESSAGE("Error fraction: "<<alpha[i]);
                        PRINT_MESSAGE("Target "<<target_latency[i]);
                        //PRINT_MESSAGE("Experienced "<<IO_flows[0]->tail_latency_experienced);
                        PRINT_MESSAGE("Experienced: "<<IO_flows_global[i]->tail_latency_experienced);
                        // PRINT_ERROR("HI");
                        //}
                        /*else{
                          PRINT_MESSAGE("Utilization: "<<rho[i]);
                          PRINT_MESSAGE("Sum: "<<sum);
                          PRINT_MESSAGE("Predicted: "<<C_j[i]);
                          PRINT_MESSAGE("Current Read Count: "<<IO_flows[0]->current_read_count);
                          PRINT_MESSAGE("Temp allocated: "<<IA_j[i]);
                          PRINT_MESSAGE("Error fraction: "<<alpha[local_flow_id]);
                          PRINT_MESSAGE("Target "<<IO_flows[0]->target_tail_latency);
                          PRINT_MESSAGE("Experienced: "<<IO_flows[0]->tail_latency_experienced);
                        }*/
                    }
                    float IA_sum=0;
                    if(sum<DT_Count_limit) {
                        for (int i = 0; i < IO_flows_global.size(); i++) {
                            // if(alpha[i]>0) {
                            // IA_j[i] = alpha[i] * C_j[i] * DT_Count_limit / sum;
                            //}
                            // else
                            //if (sum < DT_Count_limit)
                            IA_j[i] = C_j[i];
                            /* else {
                               int temp = C_j[i] * DT_Count_minimum / sum;
                               if (IA_sum < DT_Count_limit) {
                                 int rem = (DT_Count_limit - DT_Count_minimum)(C_j[i] - temp);
                                 IA_j[i] = temp + ()
                               }
                             }*/
                            // LAMBDA1*C_j[i] + LAMBDA2*rho[i];
                            /*  std::ofstream outfile;
                              outfile.open("DTBinPack.csv",
                                           std::ios_base::app); // append instead of overwrite
                              outfile << IO_flows_global[i]->get_flow_id() << "\t" << global_DT_ID
                                      << "\t" << IO_flows_global[i]->tail_latency_experienced
                                      << "\t" << IA_j[i] <<"\t"<<(IO_flows_global[i]->current_read_count+IO_flows_global[i]->deficiency_read_count)<<"\t"
                                      <<IO_flows_global[i]->current_read_count<<"\t"<<IO_flows_global[i]->deficiency_read_count
                                      <<"\t" <<deficiency[i]<<"\t"<< rho[i]<< "\t"<<MQsim_Simulator->Time()<<"\n";
                              outfile.close();*/

                            PRINT_MESSAGE(IA_j[i])
                            IA_sum += IA_j[i];
                            if (IA_j[i] < 0) {

                                PRINT_MESSAGE("SOMETHING IS WRONG");
                                PRINT_MESSAGE("Utilization: " << rho[i]);
                                PRINT_MESSAGE("Sum: " << sum);
                                PRINT_MESSAGE("Predicted: " << C_j[i]);
                                PRINT_MESSAGE(
                                        "Current Read Count: " << IO_flows[0]->current_read_count);
                                PRINT_MESSAGE("Temp allocated: " << IA_j[i]);
                                PRINT_MESSAGE("Error fraction: " << alpha[local_flow_id]);
                                PRINT_MESSAGE("Target " << target_latency[local_flow_id]);
                                PRINT_MESSAGE(
                                        "Experienced: " << IO_flows[0]->tail_latency_experienced);
                                PRINT_ERROR("HI");
                            }
                            global_allocation[local_device]=global_allocation[local_device]+IA_j[i];
                            IO_flows_global[i]->current_read_count=0;
                            IO_flows_global[i]->deficiency_read_count=0;
                        }
                    }
                    else {
                        for (int i = 0; i < IO_flows_global.size(); i++) {
                            IA_j[i] = DT_min[i];
                            IA_sum += IA_j[i];
                        }
                        for (int i = 0; i < IO_flows_global.size(); i++) {
                            int rem_DT = (DT_Count_limit - IA_sum);
                            int rem_pred = C_j[i] - IA_j[i];
                            // strict priority
                            if (IA_sum < DT_Count_limit) {

                                int temp = 0;
                                if ((rem_DT - rem_pred) >= 0) {
                                    temp = rem_pred;
                                } else {
                                    temp = rem_DT;
                                }
                                IA_j[i] += temp;
                                IA_sum += IA_j[i];
                            }

                            // LAMBDA1*C_j[i] + LAMBDA2*rho[i];
                            std::ofstream outfile;
                            /*  outfile.open("DTBinPack.csv",
                                           std::ios_base::app); // append instead of overwrite
                              outfile << IO_flows_global[i]->get_flow_id() << "\t" << global_DT_ID
                                      << "\t" << IO_flows_global[i]->tail_latency_experienced
                                      << "\t" << IA_j[i] <<"\t"<<(IO_flows_global[i]->current_read_count+IO_flows_global[i]->deficiency_read_count)<<"\t"
                                      <<IO_flows_global[i]->current_read_count<<"\t"<<IO_flows_global[i]->deficiency_read_count
                                      <<"\t" <<deficiency[i]<<"\t"<< rho[i]<< "\t"<<MQsim_Simulator->Time()<<"\n";
                              outfile.close();*/


                            //strict ratio
                            /*if(IO_flows_global[i]->Priority_class()==1)
                              IA_j[i] += ( rem_DT*4/7);
                            else if(IO_flows_global[i]->Priority_class()==2)
                              IA_j[i] += ( rem_DT*2/7);
                            else if(IO_flows_global[i]->Priority_class()==3)
                              IA_j[i] += ( rem_DT*1/7);
                            IA_sum += IA_j[i];
                          // LAMBDA1*C_j[i] + LAMBDA2*rho[i];
                          std::ofstream outfile;
                          outfile.open("DTStrictRatio.csv",
                                       std::ios_base::app); // append instead of overwrite
                          outfile << IO_flows_global[i]->get_flow_id() << "\t" << global_DT_ID
                                  << "\t" << IO_flows_global[i]->tail_latency_experienced
                                  << "\t" << IA_j[i] << "\n";
                          outfile.close();
                          */

                            PRINT_MESSAGE(IA_j[i])
                            // IA_sum += IA_j[i];
                            if (IA_j[i] < 0) {

                                PRINT_MESSAGE("SOMETHING IS WRONG");
                                PRINT_MESSAGE("Utilization: " << rho[i]);
                                PRINT_MESSAGE("Sum: " << sum);
                                PRINT_MESSAGE("Predicted: " << C_j[i]);
                                PRINT_MESSAGE(
                                        "Current Read Count: " << IO_flows[0]->current_read_count);
                                PRINT_MESSAGE("Temp allocated: " << IA_j[i]);
                                PRINT_MESSAGE("Error fraction: " << alpha[local_flow_id]);
                                PRINT_MESSAGE("Target " << target_latency[local_flow_id]);
                                PRINT_MESSAGE(
                                        "Experienced: " << IO_flows[0]->tail_latency_experienced);
                                PRINT_ERROR("HI");
                            }
                            global_allocation[local_device]=global_allocation[local_device]+IA_j[i];
                            IO_flows_global[i]->current_read_count=0;
                            IO_flows_global[i]->deficiency_read_count=0;
                        }
                    }
                    allocated[local_device]=true;
                    PRINT_MESSAGE("DT Start was: "<<DT_start[local_device] <<" for "<<local_device);
                    DT_start[local_device]=MQsim_Simulator->Time();
                    PRINT_MESSAGE("DT Start is: "<<DT_start[local_device]<<" for "<<local_device);
                    global_DT_ID++;
                    active_dev=local_device+1;
                }
                //for (int i = 0; i < IO_flows_global.size(); i++) {
                /* if(error_fraction[i]<=0)
                   error_fraction[i] = ((IO_flows_global[i]->tail_latency_experienced -
                                                   IO_flows_global[i]->target_tail_latency) /
                                                  IO_flows_global[i]->target_tail_latency);
                 if(utilization[i]<=0)
                   utilization[i] = IO_flows_global[i]->current_read_count/IO_flows[0]->get_allocated_read_count();
                 if(error_fraction[i]<0 && IO_flows_global[i]->Priority_class()==3)
                 {
                   continue;
                 }
                 else
                 {
                   error_fraction[i] = abs(error_fraction[i]);
                 }
                 sum = sum + ((ALPHA*utilization[i]) + (BETA*error_fraction[i]));*/
                //used_alloc[i]=IO_flows_global[i]->current_read_count*ALPHA + (1-ALPHA)*used_alloc[i];
                //sum=sum+used_alloc[i];
                //}
                // int temp1 = initial_alloc*used_alloc[local_flow_id]/sum;
                // int temp2 = additional_alloc*used_alloc[local_flow_id]/sum;
                //IO_flows[0]->DT_ID=global_DT_ID;
                allocated_read_count[local_flow_id]=(IA_j[local_flow_id]);
                PRINT_MESSAGE("Allocated for "<<local_flow_id<<", "<<allocated_read_count[local_flow_id])
                returning[local_flow_id]=false;
                alloc_hosts[local_flow_id]=true;
                //IA_j[local_flow_id]=0;
                initial_alloc[local_device]=initial_alloc[local_device]+IA_j[local_flow_id];
                //PRINT_MESSAGE("allocation before adding: "<<global_allocation[local_device]);
                //global_allocation[local_device]=global_allocation[local_device]+IA_j[local_flow_id];
                //PRINT_MESSAGE("allocation after adding: "<<global_allocation[local_device]);
                host_counter[local_device] = host_counter[local_device]+1;
                IO_flows[0]->sync=false;
                //if(host_counter[local_device]==HOSTS)

                //IO_flows[0]->set_additional_allocated_read_count(temp2);
                //int temp = (((ALPHA*utilization[local_flow_id]) + (BETA*error_fraction[local_flow_id]))/sum)*DT_Count_limit;
                /* if(error_fraction[local_flow_id]<0 && IO_flows[0]->Priority_class()==3)
                 {
                   temp=10;
                 }*/

                /*if(temp1 == 0)
                {

                  PRINT_MESSAGE("SOMETHING IS WRONG");
                  PRINT_MESSAGE("Utilization: "<<rho[local_flow_id]);
                  PRINT_MESSAGE("Current Read Count: "<<IO_flows[0]->current_read_count);
                  //PRINT_MESSAGE("Temp allocated: "<<temp);
                  PRINT_MESSAGE("Error fraction: "<<alpha[local_flow_id]);
                  PRINT_MESSAGE("Target "<<IO_flows[0]->target_tail_latency);
                  PRINT_MESSAGE("Experienced: "<<IO_flows[0]->tail_latency_experienced);
                  PRINT_ERROR("HI");
                }*/
                /*if(temp==0)
                  PRINT_MESSAGE("Temp itself is 0")*/

                // utilization[local_flow_id] = IO_flows[0]->current_read_count/IO_flows[0]->get_allocated_read_count();
                // error_fraction[local_flow_id] = abs((IO_flows[0]->tail_latency_experienced -
                //  IO_flows[0]->target_tail_latency) /
                //  IO_flows[0]->target_tail_latency);
                // IO_flows[0]->set_allocated_read_count(temp);
                // IO_flows[0]->current_read_count=0;
                // global_allocation[local_device] = global_allocation[local_device] + IO_flows[0]->get_allocated_read_count();
                // host_counter[local_device]+=1;
                //if(host_counter[local_device]==HOSTS)
                //allocated[local_device]=true;
                // PRINT_MESSAGE("Error:"<<IO_flows[0]->error_fraction);
                /*if(IO_flows[0]->target_tail_latency<0)
                {
                  IO_flows[0]->set_allocated_read_count(0);
                }*/
                // PRINT_MESSAGE("Allocated:"<<IO_flows[0]->allocated_read_count);


                // IO_flows[0]->current_read_count = 0;
                /*if(IO_flows[0]->get_allocated_read_count()<0)
                {
                  PRINT_MESSAGE("Slack so going to 0");
                  IO_flows[0]->set_device(local_device+1);
                  global_device_no = local_device;
                  IO_flows[0]->set_allocated_read_count(0);
                  IO_flows[0]->current_read_count = 0;
                }*/
                if(allocated_read_count[local_flow_id]==0)
                {
                    PRINT_MESSAGE("Coordinator allcoated 0");
                    // IO_flows[0]->set_allocated_read_count(1);
                    NDT_req[local_flow_id]=true;
                    flag[local_flow_id]=false;
                }
            }
            else
            {
                PRINT_MESSAGE("Went to NDT");
                // PRINT_MESSAGE(IO_flows[0]->get_device());
                host_device[local_flow_id]=(local_device+1);
                PRINT_MESSAGE(host_device[local_flow_id]);
                PRINT_MESSAGE(IO_flows[0]->Priority_class());
                global_device_no = local_device;
                //PRINT_MESSAGE("dt or not"<<is_in_DT[local_device]);
                //PRINT_MESSAGE("flag "<<flag[local_flow_id]);
                //IO_flows[0]->set_allocated_read_count(0);
                // IO_flows[0]->current_read_count = 0;
                flag[local_flow_id]=false;
                NDT_req[local_flow_id]=false;
                // PRINT_ERROR("NDT Err");
            }
            //  IO_flows[0]->allocation=
            //is_in_DT[0]=false;

            /*else if(IO_flows[0]->get_device()==2)
            {
              if(!is_in_DT[0] && (MQsim_Simulator->Time() - NDT_start[0])>=NDT_Period)
                is_in_DT[0] = true;

              if(is_in_DT[0]) {
                IO_flows[0]->set_device(1);
                global_device_no = 1;
                IO_flows[0]->error_fraction = ((IO_flows[0]->tail_latency_experienced -
                                               IO_flows[0]->target_tail_latency) /
                                              IO_flows[0]->target_tail_latency);
                if(IO_flows[0]->error_fraction>1)
                  IO_flows[0]->error_fraction = 1;

                int temp = IO_flows[0]->allocated_read_count;
                IO_flows[0]->allocated_read_count =
                    (ALPHA * IO_flows[0]->utilization +
                     BETA * IO_flows[0]->error_fraction) *
                    DT_Count_limit;
               // PRINT_MESSAGE("Error:"<<IO_flows[0]->error_fraction);
                if(IO_flows[0]->target_tail_latency<0)
                {
                  IO_flows[0]->allocated_read_count = 0;
                }
               // PRINT_MESSAGE("Allocated:"<<IO_flows[0]->allocated_read_count);
                if(IO_flows[0]->allocated_read_count > DT_Count_limit)
                {
                  PRINT_MESSAGE("SOMETHING IS WRONG");
                  PRINT_MESSAGE("Utilization: "<<IO_flows[0]->utilization);
                  PRINT_MESSAGE("Current Read Count: "<<IO_flows[0]->current_read_count);
                  PRINT_MESSAGE("Temp allocated: "<<temp);
                  PRINT_MESSAGE("Error fraction: "<<IO_flows[0]->error_fraction);
                  PRINT_MESSAGE("Target "<<IO_flows[0]->target_tail_latency);
                  PRINT_MESSAGE("Experienced: "<<IO_flows[0]->tail_latency_experienced);
                  PRINT_ERROR("HI");
                }
                IO_flows[0]->current_read_count = 0;

              }
              else
              {
                PRINT_MESSAGE("Going to NDT");
                IO_flows[0]->set_device(1);
                global_device_no = 1;
                IO_flows[0]->allocated_read_count = 0;
                IO_flows[0]->current_read_count = 0;
              }
             // is_in_DT[1]=false;
            }*/


            // IO_flows[0]->allocated_read_count=DT_Count_limit/global_device_no;
            /* if(global_allocation[host_device[local_flow_id] - 1]==0 && is_in_DT[host_device[local_flow_id] - 1])
               DT_start[host_device[local_flow_id] - 1] = MQsim_Simulator->Time();*/
            //global_allocation[IO_flows[0]->get_device() - 1]+=IO_flows[0]->get_allocated_read_count();


        }


    }
}
}
