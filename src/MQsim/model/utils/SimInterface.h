/*
 * SimInterface.h
 *
 *  Created on: Mar 23, 2021
 *      Author: joyanta
 */

#ifndef SRC_MQSIM_MODEL_UTILS_SIMINTERFACE_H_
#define SRC_MQSIM_MODEL_UTILS_SIMINTERFACE_H_


#include <cstdint>
#include "ns3/core-module.h"
//#include "ns3/Execution_Parameter_Set.h"
#define HOSTS 4
namespace ns3{
enum class Request_Type { READ, WRITE };
class SimInterfaceRequest
{

	//protected:

public:
	static unsigned int unique_id;

	uint64_t Start_LBA;
	unsigned int LBA_count;
	Request_Type Type;
	long int request_id;
	bool serviced;
	int device;

	SimInterfaceRequest(std::size_t index, long unsigned int t, uint64_t LBA, unsigned int size, Request_Type RW)
	{
		flow_id = index;
		Arrival_time = t;
		Start_LBA = LBA;
		LBA_count = size;
		Type = RW;
		request_id = ++unique_id;
		serviced=false;
	}
	SimInterfaceRequest(std::size_t index, long unsigned int t, uint64_t LBA, unsigned int size, Request_Type RW, unsigned int ph_id)
	{
		flow_id = index;
		Arrival_time = t;
		Start_LBA = LBA;
		LBA_count = size;
		Type = RW;
		request_id = ph_id;
		serviced=false;
	}
	SimInterfaceRequest(){request_id=0;}

	void SetFlowID(std::size_t);
	std::size_t GetFlowID();

	void SetArrivalTime(long unsigned int);
	long unsigned int GetArrivalTime();

	void SetGenerationTime(Time);
	Time GetGenerationTime();

	void SetDelay(unsigned int);
	unsigned int GetDelay();


	long unsigned int Arrival_time;
		Time request_generation_time;
		unsigned int delay;
		std::size_t flow_id;

private:




};



}


#endif /* SRC_MQSIM_MODEL_UTILS_SIMINTERFACE_H_ */
