#include "ns3/SimInterface.h"

using namespace ns3;
namespace ns3{

	unsigned int SimInterfaceRequest::unique_id { 0 };

	void SimInterfaceRequest::SetFlowID(std::size_t flow_id)
	{
		this->flow_id = flow_id;
	}
	std::size_t SimInterfaceRequest::GetFlowID()
	{
		return this->flow_id;
	}

	void SimInterfaceRequest::SetArrivalTime(long unsigned int arrival_time)
	{
		this->Arrival_time = arrival_time;
	}
	long unsigned int SimInterfaceRequest::GetArrivalTime()
	{
		return this->Arrival_time;
	}

	void SimInterfaceRequest::SetGenerationTime(Time generation_time)
	{
		this->request_generation_time = generation_time;
	}
	Time SimInterfaceRequest::GetGenerationTime()
	{
		return this->request_generation_time;
	}

	void SimInterfaceRequest::SetDelay(unsigned int delay)
	{
		this->delay = delay;
	}
	unsigned int SimInterfaceRequest::GetDelay()
	{
		return this->delay;
	}

}
