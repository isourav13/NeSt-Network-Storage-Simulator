#include "ns3/NVM_Firmware.h"
using namespace ns3;
namespace ns3{
namespace SSD_Components
{
	NVM_Firmware::NVM_Firmware(const sim_object_id_type& id, Data_Cache_Manager_Base* data_cache_manager)
		: MQSimEngine::Sim_Object(id), Data_cache_manager(data_cache_manager)
	{
        if(std::isdigit(this->ID()[10])==0)
            device_id = this->ID()[9] - '0';
        else
            device_id = std::stoi(this->ID().substr(9,2));
	}

	void NVM_Firmware::Validate_simulation_config()
	{
	}
}
}
