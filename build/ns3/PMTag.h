/*
 * mqsimTag.h
 *
 *  Created on: Apr 20, 2021
 *      Author: kkant
 */

#ifndef SCRATCH_DCTCP_EXAMPLE_PMTAG_H_
#define SCRATCH_DCTCP_EXAMPLE_PMTAG_H_

#include "ns3/core-module.h"
#include "ns3/network-module.h"
#include "ns3/application.h"

#include "ns3/stats-module.h"

namespace ns3 {

class PMTag : public Tag {
public:
  static TypeId GetTypeId (void);
  virtual TypeId GetInstanceTypeId (void) const;

  virtual uint32_t GetSerializedSize (void) const;
  virtual void Serialize (TagBuffer i) const;
  virtual void Deserialize (TagBuffer i);

  // these are our accessors to our tag structure
  void SetReqId (uint32_t m_requestid);
  uint32_t GetReqId (void) const;

  void Print (std::ostream &os) const;

private:
  uint32_t m_requestid;

  // end class TimestampTag
};
}



#endif /* SCRATCH_DCTCP_EXAMPLE_PMTAG_H_ */
