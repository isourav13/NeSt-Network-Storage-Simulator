#ifndef SSD_DEVICE_H
#define SSD_DEVICE_H

#include <vector>
#include "ns3/Sim_Object.h"
#include "ns3/Sim_Reporter.h"
#include "ns3/SSD_Defs.h"
#include "ns3/Host_Interface_Base.h"
#include "ns3/Host_Interface_SATA.h"
#include "ns3/Host_Interface_NVMe.h"
#include "ns3/Data_Cache_Manager_Base.h"
#include "ns3/Data_Cache_Flash.h"
#include "ns3/NVM_Firmware.h"
#include "ns3/NVM_PHY_Base.h"
#include "ns3/NVM_Channel_Base.h"
#include "ns3/PCIe_Switch.h"
#include "ns3/NVM_Types.h"
#include "ns3/Device_Parameter_Set.h"
#include "ns3/IO_Flow_Parameter_Set.h"
#include "ns3/Workload_Statistics.h"

/*********************************************************************************************************
* An SSD device has the following components:
* 
* Host_Interface <---> Data_Cache_Manager <----> NVM_Firmware <---> NVM_PHY <---> NVM_Channel <---> Chips
*
*********************************************************************************************************/
namespace ns3
{
class SSD_Device : public MQSimEngine::Sim_Object, public MQSimEngine::Sim_Reporter
{
public:
	SSD_Device(Device_Parameter_Set* parameters, std::vector<IO_Flow_Parameter_Set*>* io_flows, uint32_t id2);
	~SSD_Device();
	bool Preconditioning_required;
	NVM::NVM_Type Memory_Type;
	SSD_Components::Host_Interface_Base *Host_interface;
	SSD_Components::Data_Cache_Manager_Base *Cache_manager;
	SSD_Components::NVM_Firmware* Firmware;
	SSD_Components::NVM_PHY_Base* PHY;
	std::vector<SSD_Components::NVM_Channel_Base*> Channels;
	void Report_results_in_XML(std::string name_prefix, Utils::XmlWriter& xmlwriter);
	unsigned int Get_no_of_LHAs_in_an_NVM_write_unit();
    uint32_t device_id; //added by JG
	void Attach_to_host(Host_Components::PCIe_Switch* pcie_switch);
	void Perform_preconditioning(std::vector<Utils::Workload_Statistics*> workload_stats);
	void Start_simulation();
	void Validate_simulation_config();
	void Execute_simulator_event(MQSimEngine::Sim_Event* event);
	static LPA_type Convert_host_logical_address_to_device_address( int id, LHA_type lha);
	static page_status_type Find_NVM_subunit_access_bitmap( int id, LHA_type lha);

	unsigned int Channel_count;
	unsigned int Chip_no_per_channel;

private:
	static SSD_Device * my_instance[DEVICES];//Used in static functions
};
}

#endif //!SSD_DEVICE_H