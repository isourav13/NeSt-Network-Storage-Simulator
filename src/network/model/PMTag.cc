/*
 * mqsimTag.cc
 *
 *  Created on: Apr 20, 2021
 *      Author: kkant
 */

#include <ostream>

#include "ns3/core-module.h"
#include "ns3/network-module.h"
#include "ns3/internet-module.h"

#include "ns3/stats-module.h"

#include "PMTag.h"

namespace ns3 {

NS_LOG_COMPONENT_DEFINE ("PMTagSource");

TypeId
PMTag::GetTypeId (void)
{
  static TypeId tid = TypeId ("PMTag")
    .SetParent<Tag> ()
    .AddConstructor<PMTag> ()
    .AddAttribute ("RequestId",
                   "Request Id of the request",
                   EmptyAttributeValue (),
				   MakeUintegerAccessor (&PMTag::GetReqId),
                   MakeTimeChecker ())
  ;
  return tid;
}
TypeId
PMTag::GetInstanceTypeId (void) const
{
  return GetTypeId ();
}

uint32_t
PMTag::GetSerializedSize (void) const
{
  return 8;
}
void
PMTag::Serialize (TagBuffer i) const
{
  uint32_t t = m_requestid;
  i.Write ((const uint8_t *)&t, 4);
}
void
PMTag::Deserialize (TagBuffer i)
{
  uint32_t t;
  i.Read ((uint8_t *)&t, 4);
  m_requestid = t;
}

void
PMTag::SetReqId (uint32_t m_requestid)
{
	this->m_requestid = m_requestid;
}
uint32_t
PMTag::GetReqId (void) const
{
  return m_requestid;
}

void
PMTag::Print (std::ostream &os) const
{
  os << "t=" << m_requestid;
}
}




