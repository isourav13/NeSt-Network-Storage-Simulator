//
// Created by joyanta on 3/22/21.
//

#ifndef PLMSPECS_H
#define PLMSPECS_H

#include "IO_Flow_Base.h"
#define DT_Count_limit 1500
#define DT_Count_minimum 1050
#define HOSTS 3
#define DT_Period 100000000
#define NDT_Period 100000

//#define ALPHA 0.5
//#define BETA 0.5
#define GAMMA 0.5
#define SIGMA 0.5
#define LAMBDA1 0.5
#define LAMBDA2 0.5
#define WINDOWSIZE 10
namespace ns3{
namespace PLMSpecs{
    class DTNDT{
    public:
        int active_dev;
        int global_device_no;
        int global_devices;
        int global_DT_ID;

        std::vector<bool> is_in_DT;
        std::vector<sim_time_type> DT_start;
        std::vector<sim_time_type> NDT_start;
        std::vector<int> global_allocation;
        std::vector<int> initial_alloc;
        std::vector<int> additional_alloc;

        std::vector<float> rho;
        std::vector<float> alpha;
        std::vector<float> used_alloc;
        std::vector<int> host_counter;
        std::vector<int> IA_j;
        std::vector<int> AA_j;
        std::vector<int> C_j;
        std::vector<bool> allocated;
        std::vector<bool> returning;
        std::vector<bool> flag;
        std::vector<bool> NDT_req;
        std::vector<int> host_device;
        std::vector<float> target_latency;
        std::vector<int> allocated_read_count;
        std::vector<int> additional_allocation;
        std::vector <int> DT_min;
        std::vector<float> deficiency;
        std::vector<bool> alloc_hosts;

        std::vector<Host_Components::IO_Flow_Base*> IO_flows_global;
        std::queue <sim_time_type> tail_begin[3];
        std::queue <sim_time_type> tail_end[3];
        std::queue <sim_time_type> trace_time[3];

        void DT_Coordinator(std::vector<Host_Components::IO_Flow_Base*> IO_flows,int device_no, int reallocation=0);
        void Init();
        static DTNDT* Instance();
    private:
        static DTNDT* _instance;
    };



}
}
#define PLMObject PLMSpecs::DTNDT::Instance()
#endif

