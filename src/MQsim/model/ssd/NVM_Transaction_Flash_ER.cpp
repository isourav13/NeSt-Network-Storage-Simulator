#include "ns3/NVM_Transaction_Flash_ER.h"
using namespace ns3;
namespace ns3{
namespace SSD_Components
{
	NVM_Transaction_Flash_ER::NVM_Transaction_Flash_ER(int device_id, Transaction_Source_Type source, stream_id_type streamID,
		const NVM::FlashMemory::Physical_Page_Address& address) :
		NVM_Transaction_Flash(device_id, source, Transaction_Type::ERASE, streamID, 0, NO_LPA, NO_PPA, address, NULL, IO_Flow_Priority_Class::UNDEFINED)
	{
        transc_device_id = device_id;
	}
}
}
