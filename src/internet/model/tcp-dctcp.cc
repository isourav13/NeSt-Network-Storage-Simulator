/* -*- Mode:C++; c-file-style:"gnu"; indent-tabs-mode:nil; -*- */
/*
 * Copyright (c) 2017 NITK Surathkal
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation;
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * Author: Shravya K.S. <shravya.ks0@gmail.com>
 *
 */

#include "tcp-dctcp.h"
#include "ns3/log.h"
#include "math.h"
#include "ns3/tcp-socket-state.h"

namespace ns3 {

NS_LOG_COMPONENT_DEFINE ("TcpDctcp");

NS_OBJECT_ENSURE_REGISTERED (TcpDctcp);

double *TcpDctcp::m_qulity_factor = new double[40];
double *TcpDctcp::m_qulity_factor_response = new double[40];


bool *TcpDctcp::m_assured_service = new bool[40];

double TcpDctcp::threshold_low = 0.0;

double TcpDctcp::threshold_mid = 0.0;

double TcpDctcp::threshold_high = 0.0;

double TcpDctcp::tcp_gamma = 0.0;

double TcpDctcp::bottleneck_bandwidth = 0.0;

uint32_t TcpDctcp::tracker_index = 0;

TCPDctcpTracker *TcpDctcp::m_dctcp_tracker = new TCPDctcpTracker[1000000];
int rttc=0;

TypeId TcpDctcp::GetTypeId (void)
{
	static TypeId tid = TypeId ("ns3::TcpDctcp")
    				.SetParent<TcpNewReno> ()
    				.AddConstructor<TcpDctcp> ()
    				.SetGroupName ("Internet")
    				.AddAttribute ("DctcpShiftG",
    						"Parameter G for updating dctcp_alpha",
    						DoubleValue (0.0625),
    						MakeDoubleAccessor (&TcpDctcp::m_g),
    						MakeDoubleChecker<double> (0, 1))
    						.AddAttribute ("DctcpAlphaOnInit",
    								"Initial alpha value",
    								DoubleValue (1.0),
    								MakeDoubleAccessor (&TcpDctcp::SetDctcpAlpha),
    								MakeDoubleChecker<double> (0, 1))
    								.AddAttribute ("UseEct0",
    										"Use ECT(0) for ECN codepoint, if false use ECT(1)",
    										BooleanValue (true),
    										MakeBooleanAccessor (&TcpDctcp::m_useEct0),
    										MakeBooleanChecker ())
    										;
	return tid;
}

TCPDctcpTracker::TCPDctcpTracker(double alpha, uint32_t app_id, double time, uint32_t prev_wnd, uint32_t cwnd, double target)
{
	this->alpha = alpha;
	this->app_id = app_id;
	this->time_in_microsecond = time;
	this->prev_wnd = prev_wnd;
	this->cwnd = cwnd;
	this->target = target;
}

TCPDctcpTracker::TCPDctcpTracker(){
}


std::string TcpDctcp::GetName () const
{
	return "TcpDctcp";
}

TcpDctcp::TcpDctcp ()
: TcpNewReno ()
{
	NS_LOG_FUNCTION (this);
	m_ackedBytesEcn = 0;
	m_ackedBytesTotal = 0;
	m_priorRcvNxt = SequenceNumber32 (0);
	m_priorRcvNxtFlag = false;
	m_nextSeq = SequenceNumber32 (0);
	m_nextSeqFlag = false;
	m_ceState = false;
	m_delayedAckReserved = false;
	m_ackcount = 0;
	m_timelastack = 0;
	m_throughput = 0.0;
	m_ecnackcount = 0;
	//TCP Friendliness
	m_reductionCount = 0;
	interferance_flow = false;
	m_qf = 1.0;

	m_RTTData = 0;
	for(int i=0;i<4;i++)
		TcpDctcp::m_qulity_factor[i] = 0.0;
}

TcpDctcp::TcpDctcp (const TcpDctcp& sock)
: TcpNewReno (sock),
  m_ackedBytesEcn (sock.m_ackedBytesEcn),
  m_ackedBytesTotal (sock.m_ackedBytesTotal),
  m_priorRcvNxt (sock.m_priorRcvNxt),
  m_priorRcvNxtFlag (sock.m_priorRcvNxtFlag),
  m_alpha (sock.m_alpha),
  m_nextSeq (sock.m_nextSeq),
  m_nextSeqFlag (sock.m_nextSeqFlag),
  m_ceState (sock.m_ceState),
  m_delayedAckReserved (sock.m_delayedAckReserved),
  m_g (sock.m_g),
  m_useEct0 (sock.m_useEct0)
{
	NS_LOG_FUNCTION (this);
}

TcpDctcp::~TcpDctcp (void)
{
	NS_LOG_FUNCTION (this);
}

Ptr<TcpCongestionOps> TcpDctcp::Fork (void)
{
	NS_LOG_FUNCTION (this);
	return CopyObject<TcpDctcp> (this);
}

void
TcpDctcp::Init (Ptr<TcpSocketState> tcb)
{
	NS_LOG_FUNCTION (this << tcb);
	NS_LOG_INFO (this << "Enabling DctcpEcn for DCTCP");
	//NS_LOG_UNCOND("Enabling DCTCP");
	tcb->m_useEcn = TcpSocketState::On;
	tcb->m_ecnMode = TcpSocketState::DctcpEcn;
	tcb->m_ectCodePoint = m_useEct0 ? TcpSocketState::Ect0 : TcpSocketState::Ect1;
}

void
TcpDctcp::ReduceCwnd (Ptr<TcpSocketState> tcb)
{
	uint32_t val;
	//double min_val;
	uint32_t prev_wind;

	prev_wind = tcb->m_cWnd;
	double target_throughput = tcb->m_targetThroughput * TcpDctcp::bottleneck_bandwidth;


	//NS_LOG_UNCOND("Its DCTCP");

	if(!tcb->m_enablediff) //DCTCP
	{
		val = static_cast<uint32_t> ((1 - m_alpha / 2.0) * tcb->m_cWnd);
		tcb->m_cWnd = std::max (val, 2 * tcb->m_segmentSize);

		//NS_LOG_UNCOND("Its DCTCP");
	}
	else //QTCP
	{
		uint32_t app_priority = tcb->m_trpriority;

		bool is_assured = TcpDctcp::m_assured_service[app_priority];

		double quality_factor = TcpDctcp::m_qulity_factor[app_priority];
		//double quality_factor = m_qf;
		//double quality_factor = tcb->m_quality_factor;

		if (is_assured)
		{
			val = static_cast<uint32_t> ((1 - m_alpha / 2.0) * tcb->m_cWnd);
			tcb->m_cWnd = std::max (val, 2 * tcb->m_segmentSize);
			NS_LOG_UNCOND("m_trpriority "<<tcb->m_trpriority<< "assured service");

			return;
		}

		if (m_alpha <= TcpDctcp::threshold_low)
		{
			val = static_cast<uint32_t> (tcb->m_cWnd * (1 - m_alpha));

			if (quality_factor <1.0) val = val * (quality_factor);


			tcb->m_cWnd = std::max (val, 2 * tcb->m_segmentSize);
			NS_LOG_UNCOND("Low threshold Alpha "<<m_alpha<<" Application "<<tcb->m_trpriority<< " prev "<<prev_wind<<" cwnd "<<tcb->m_cWnd<<" qf "<<quality_factor<<" Smooth "<<m_qf);

		}
		else if (m_alpha > TcpDctcp::threshold_low && m_alpha <= TcpDctcp::threshold_mid)
		{
//
			//val = static_cast<uint32_t> ((1 - (std::pow(m_alpha,quality_factor) / 2.0)) * tcb->m_cWnd);
//
//			double cwnd_reduction = -1.0 * (1.0 - m_alpha) * quality_factor;
//
//			cwnd_reduction = std::pow(2.7, cwnd_reduction);
//
//			val = static_cast<uint32_t> ((1 - cwnd_reduction / 2.0) * tcb->m_cWnd);
			//Portion of the code That is working fine
			//-------------------------------------------------------------//
			val= static_cast<uint32_t> ((1 - m_alpha / 2.0) * tcb->m_cWnd);
//
			if (quality_factor <1.0) val = val * (quality_factor);

			tcb->m_cWnd = std::max (val, 2 * tcb->m_segmentSize);
			//----------------------------------------------------------------//

//
			NS_LOG_UNCOND("Mid threshold Alpha "<<m_alpha<<" Application "<<tcb->m_trpriority<< " prev "<<prev_wind<<" cwnd "<<tcb->m_cWnd<<" qf "<<quality_factor<<" Smooth "<<m_qf<<" Target "<<target_throughput<<" m_reductionCount "<<tcb->m_btl_bw<<" TcpDctcp::threshold_mid "<<TcpDctcp::bottleneck_bandwidth);

		}
		else
		{
			//NS_LOG_UNCOND("Current Window "<<tcb->m_cWnd);
			val = static_cast<uint32_t> ((1 - m_alpha / 2.0) * tcb->m_cWnd);
			tcb->m_cWnd = std::max (val, 2 * tcb->m_segmentSize);
			//NS_LOG_UNCOND("Updated Window "<<tcb->m_cWnd<<" with quality factor "<<quality_factor<<" application "<<tcb->m_trpriority);
			NS_LOG_UNCOND("High threshold Alpha "<<m_alpha<< " Application "<<tcb->m_trpriority<< " prev "<<prev_wind<<" cwnd "<<tcb->m_cWnd);
		}

		//NS_LOG_UNCOND("Index id "<<TcpDctcp::tracker_index);

		rttc++;

			/*FILE *qf = fopen("/home/kkant/Downloads/ns3_qtcp_mqsim_trace/qf_interval3.csv","a");
			fprintf(qf,"%d,%d,%f\n",tcb->m_trpriority,rttc,m_qf);
			fclose(qf);*/


		//NS_LOG_UNCOND("tcb->m_cWnd "<<tcb->m_cWnd<<" alpha "<<m_alpha);
	}
	TcpDctcp::m_dctcp_tracker[TcpDctcp::tracker_index] = TCPDctcpTracker(m_alpha, tcb->m_trpriority, (double) Simulator::Now().GetMicroSeconds(), prev_wind, tcb->m_cWnd, target_throughput);

	TcpDctcp::tracker_index += 1;

	//	NS_LOG_FUNCTION (this << tcb);
	//	uint32_t val = static_cast<uint32_t> ((1 - m_alpha / 2.0) * tcb->m_cWnd);
	//	tcb->m_cWnd = std::max (val, 2 * tcb->m_segmentSize);
}

void
TcpDctcp::PktsAcked (Ptr<TcpSocketState> tcb, uint32_t segmentsAcked, const Time &rtt)
{
	NS_LOG_FUNCTION (this << tcb << segmentsAcked << rtt);
	//NS_LOG_UNCOND ("RTT is "<<rtt.GetMicroSeconds()<< " app id "<<tcb->m_trpriority<<" Ack Count "<<m_ackcount);
//
	//if (tcb->m_trpriority == 2) NS_LOG_UNCOND ("RTT is "<<rtt.GetMicroSeconds()<<" SEQ "<<tcb->m_lastAckedSeq<<" TIME "<<Simulator::Now ().GetMicroSeconds());
//	NS_LOG_UNCOND("Last RTT "<<tcb->m_lastRtt.Get().GetMicroSeconds());

	//	if (tcb->m_trpriority == 0)
	//	{
	//		NS_LOG_UNCOND("Inside TcpDctcp::PktsAcked "<<tcb->m_cWnd);
	//	}
	double target_throughput = tcb->m_targetThroughput * TcpDctcp::bottleneck_bandwidth;
	m_ackcount += segmentsAcked;



	//NS_LOG_UNCOND("m_ackcount "<<m_ackcount<<" tcb->m_trpriority "<<tcb->m_trpriority);

//	if (m_ackcount >= SEGMENT_ACK_COUNT) //quality factor calculation
//	{
//
//		m_throughput = (1-m_g) * ((double) (tcb->m_segmentSize * m_ackcount * 8.0) /(double) ( Simulator::Now().GetNanoSeconds() - m_timelastack))+m_g * m_throughput;
//		tcb->m_quality_factor = target_throughput/m_throughput;
//
//
////		if (m_ecnackcount > 0 && tcb->m_quality_factor > 1.0)
////		{
////			tcb->m_targetThroughput = m_throughput;
////
////		}
//////		else
//////		{
//////			tcb->m_targetThroughput = tcb->m_targetThroughput_initial;
//////		}
////		//tcb->m_quality_factor = tcb->m_targetThroughput/m_throughput;
//
//		//NS_LOG_UNCOND("m_ackcount "<<m_ackcount<<" Throughput "<<m_throughput<<" App Id "<<tcb->m_trpriority<<" target "<<target_throughput<<" ECN Count "<<m_ecnackcount<<" quality factor "<<tcb->m_quality_factor);
//		//NS_LOG_UNCOND("BottleNeck bandwidth "<<TcpDctcp::bottleneck_bandwidth);
//		m_timelastack = Simulator::Now().GetNanoSeconds();
//
//		m_ackcount = 0;
//
//		m_ecnackcount = 0;
//	}
//
//
//
//	/********Change For TCP Friendliness *********/
	m_reductionCount += 1;
//	if (m_reductionCount%1024 == 0)
//	{
//		m_qf = (1 - m_g) * tcb->m_quality_factor + m_g * m_qf;
//	}
//
	if (Simulator::Now().GetMilliSeconds() > 0)
	{
		interferance_flow = true;
	}

	if (interferance_flow && m_qf > 1.08 && m_reductionCount%1024 == 0 && tcb->m_enablediff)
	{
	//	NS_LOG_UNCOND("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
		TcpDctcp::bottleneck_bandwidth = TcpDctcp::bottleneck_bandwidth - (0.05 * target_throughput);
		//tcb->m_targetThroughput = tcb->m_targetThroughput * 0.98;
		//TcpDctcp::bottleneck_bandwidth -= 0.05 * tcb->m_targetThroughput;
	}

	if (interferance_flow && m_qf < 0.92 && m_reductionCount%1024 == 0 && tcb->m_enablediff)
	{
	//	NS_LOG_UNCOND("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
		TcpDctcp::bottleneck_bandwidth = TcpDctcp::bottleneck_bandwidth + (0.05 * target_throughput);
	}
	/***************************************************/


	m_ackedBytesTotal += segmentsAcked * tcb->m_segmentSize;
	if (tcb->m_ecnState == TcpSocketState::ECN_ECE_RCVD)
	{
		m_ackedBytesEcn += segmentsAcked * tcb->m_segmentSize;

		m_ecnackcount += segmentsAcked;


	}
	if (m_nextSeqFlag == false)
	{
		m_nextSeq = tcb->m_nextTxSequence;
		m_nextSeqFlag = true;
	}
	if (tcb->m_lastAckedSeq >= m_nextSeq)
	{
		//NS_LOG_UNCOND("tcb->m_trpriority "<<tcb->m_trpriority);

		m_RTTData += m_ackedBytesTotal;

		if (m_reductionCount%1 == 0)
		{
			int64_t time_diff = (Simulator::Now().GetNanoSeconds() - m_timelastack);
			m_throughput = (1.0 - m_g) * m_throughput + 1000.0* m_g * ((double) ((m_RTTData << 3) >> 10)
					/(double) ( time_diff));
			//NS_LOG_UNCOND(m_timelastack<<" "<< Simulator::Now().GetMicroSeconds()<<" "<<m_RTTData<<" "<<m_throughput<<" target_throughput "<<target_throughput);
			tcb->m_quality_factor = target_throughput/m_throughput;
			//m_qf = (1 - m_g) * tcb->m_quality_factor + m_g * m_qf;
			m_qf = tcb->m_quality_factor;
			m_timelastack = Simulator::Now().GetNanoSeconds();
			m_ackcount = 0;

			m_RTTData = 0;
		}

		m_reductionCount += 1;


		double bytesEcn = 0.0;
		if (m_ackedBytesTotal >  0)
		{
			bytesEcn = static_cast<double> (m_ackedBytesEcn * 1.0 / m_ackedBytesTotal);
		}
		m_alpha = (1.0 - m_g) * m_alpha + m_g * bytesEcn;
		NS_LOG_INFO (this << "bytesEcn " << bytesEcn << ", m_alpha " << m_alpha);

		//NS_LOG_UNCOND(m_alpha);
		Reset (tcb);
	}
}

void
TcpDctcp::SetDctcpAlpha (double alpha)
{
	NS_LOG_FUNCTION (this << alpha);
	m_alpha = alpha;
}

void
TcpDctcp::Reset (Ptr<TcpSocketState> tcb)
{
	NS_LOG_FUNCTION (this << tcb);
	m_nextSeq = tcb->m_nextTxSequence;
	m_ackedBytesEcn = 0;
	m_ackedBytesTotal = 0;
}

void
TcpDctcp::CeState0to1 (Ptr<TcpSocketState> tcb)
{
	NS_LOG_FUNCTION (this << tcb);
	if (!m_ceState && m_delayedAckReserved && m_priorRcvNxtFlag)
	{
		SequenceNumber32 tmpRcvNxt;
		/* Save current NextRxSequence. */
		tmpRcvNxt = tcb->m_rxBuffer->NextRxSequence ();

		/* Generate previous ACK without ECE */
		tcb->m_rxBuffer->SetNextRxSequence (m_priorRcvNxt);
		tcb->m_sendEmptyPacketCallback (TcpHeader::ACK);

		/* Recover current RcvNxt. */
		tcb->m_rxBuffer->SetNextRxSequence (tmpRcvNxt);
	}

	if (m_priorRcvNxtFlag == false)
	{
		m_priorRcvNxtFlag = true;
	}
	m_priorRcvNxt = tcb->m_rxBuffer->NextRxSequence ();
	m_ceState = true;
	tcb->m_ecnState = TcpSocketState::ECN_CE_RCVD;
}

void
TcpDctcp::CeState1to0 (Ptr<TcpSocketState> tcb)
{
	NS_LOG_FUNCTION (this << tcb);
	if (m_ceState && m_delayedAckReserved && m_priorRcvNxtFlag)
	{
		SequenceNumber32 tmpRcvNxt;
		/* Save current NextRxSequence. */
		tmpRcvNxt = tcb->m_rxBuffer->NextRxSequence ();

		/* Generate previous ACK with ECE */
		tcb->m_rxBuffer->SetNextRxSequence (m_priorRcvNxt);
		tcb->m_sendEmptyPacketCallback (TcpHeader::ACK | TcpHeader::ECE);

		/* Recover current RcvNxt. */
		tcb->m_rxBuffer->SetNextRxSequence (tmpRcvNxt);
	}

	if (m_priorRcvNxtFlag == false)
	{
		m_priorRcvNxtFlag = true;
	}
	m_priorRcvNxt = tcb->m_rxBuffer->NextRxSequence ();
	m_ceState = false;

	if (tcb->m_ecnState == TcpSocketState::ECN_CE_RCVD || tcb->m_ecnState == TcpSocketState::ECN_SENDING_ECE)
	{
		tcb->m_ecnState = TcpSocketState::ECN_IDLE;
	}
}

void
TcpDctcp::UpdateAckReserved (Ptr<TcpSocketState> tcb,
		const TcpSocketState::TcpCAEvent_t event)
{
	NS_LOG_FUNCTION (this << tcb << event);
	switch (event)
	{
	case TcpSocketState::CA_EVENT_DELAYED_ACK:
		if (!m_delayedAckReserved)
		{
			m_delayedAckReserved = true;
		}
		break;
	case TcpSocketState::CA_EVENT_NON_DELAYED_ACK:
		if (m_delayedAckReserved)
		{
			m_delayedAckReserved = false;
		}
		break;
	default:
		/* Don't care for the rest. */
		break;
	}
}

void
TcpDctcp::CwndEvent (Ptr<TcpSocketState> tcb,
		const TcpSocketState::TcpCAEvent_t event)
{
	NS_LOG_FUNCTION (this << tcb << event);
	switch (event)
	{
	case TcpSocketState::CA_EVENT_ECN_IS_CE:
		CeState0to1 (tcb);
		break;
	case TcpSocketState::CA_EVENT_ECN_NO_CE:
		CeState1to0 (tcb);
		break;
	case TcpSocketState::CA_EVENT_DELAYED_ACK:
	case TcpSocketState::CA_EVENT_NON_DELAYED_ACK:
		UpdateAckReserved (tcb, event);
		break;
	default:
		/* Don't care for the rest. */
		break;
	}
}

/************End to end Qos work******************/

void
TcpDctcp::IncreaseWindow (Ptr<TcpSocketState> tcb, uint32_t segmentsAcked)
{
	//NS_LOG_UNCOND("IncreaseWindow "<<segmentsAcked);
	NS_LOG_FUNCTION (this << tcb << segmentsAcked);

	if (tcb->m_cWnd < tcb->m_ssThresh)
	{
		segmentsAcked = SlowStart (tcb, segmentsAcked);
	}

	if (tcb->m_cWnd >= tcb->m_ssThresh)
	{
		CongestionAvoidance (tcb, segmentsAcked);
	}

	/* At this point, we could have segmentsAcked != 0. This because RFC says
	 * that in slow start, we should increase cWnd by min (N, SMSS); if in
	 * slow start we receive a cumulative ACK, it counts only for 1 SMSS of
	 * increase, wasting the others.
	 *
	 * // Incorrect assert, I am sorry
	 * NS_ASSERT (segmentsAcked == 0);
	 */
}

//void TcpDctcp::IncreaseWindow(Ptr<TcpSocketState> tcb, uint32_t segmentsAcked)
//{
//	if (tcb->m_cWnd < tcb->m_ssThresh)
//	{
//	  segmentsAcked = SlowStart (tcb, segmentsAcked);
//	}
//
//	if (tcb->m_cWnd >= tcb->m_ssThresh)
//	{
//	  CongestionAvoidance (tcb, segmentsAcked);
//	}
//}
//
//
void
TcpDctcp::CongestionAvoidance (Ptr<TcpSocketState> tcb, uint32_t segmentsAcked)
{
	NS_LOG_FUNCTION (this << tcb << segmentsAcked);

	if (segmentsAcked > 0)
	{
		//Working for Normal DCTCP
		double adder = static_cast<double> (tcb->m_segmentSize * tcb->m_segmentSize) / tcb->m_cWnd.Get ();

		//RTT Fairness DCTCP changes

//		double adder = 0.0;
//		double quality_factor = TcpDctcp::m_qulity_factor[tcb->m_trpriority];
////
//		if (tcb->m_ecnState == TcpSocketState::ECN_ECE_RCVD)
//		{
//			adder = static_cast<double> (tcb->m_segmentSize * tcb->m_segmentSize) / tcb->m_cWnd.Get ();
//
//			adder = adder - static_cast<double> ((tcb->m_segmentSize * tcb->m_segmentSize) * m_alpha)/(2.0);
//
//			//if (quality_factor < 1.0) adder = adder * quality_factor;
//		}
//		else
//		{
//			adder = static_cast<double> (tcb->m_segmentSize * tcb->m_segmentSize) / tcb->m_cWnd.Get ();
//		}

//		if (tcb->m_trpriority == 0)
//		{
//			NS_LOG_UNCOND ("adder "<<adder<<" tcb->m_cWnd "<<tcb->m_cWnd);
//		}


//
//		adder = adder * quality_factor;
		/////////////////////////////////////////////

//		uint32_t app_priority = tcb->m_trpriority;
////
//		double quality_factor = TcpDctcp::m_qulity_factor[app_priority];
////
////		//NS_LOG_UNCOND("adder prev " <<adder);
////
//		adder = adder * quality_factor;
////
////		//NS_LOG_UNCOND("adder post " <<adder<<" qf "<<quality_factor<< "app id "<<app_priority);
//
//		adder = std::max (1.0, adder);
		//uint32_t prev = tcb->m_cWnd;
		//NS_LOG_UNCOND("Adder is "<<adder<<"tcb->m_cWnd "<<tcb->m_cWnd);
		tcb->m_cWnd += static_cast<uint32_t> (adder);


		//NS_LOG_UNCOND("tcb->m_cWnd "<<tcb->m_cWnd);
		NS_LOG_INFO ("In CongAvoid, updated to cwnd " << tcb->m_cWnd <<
				" ssthresh " << tcb->m_ssThresh);

//		if (tcb->m_trpriority == 0 || tcb->m_trpriority == 1)
//		{
//			NS_LOG_UNCOND ("App id "<<tcb->m_trpriority<<" In CongAvoid, updated to cwnd " << tcb->m_cWnd <<
//					" prev " << prev<<" diff "<<tcb->m_cWnd - prev);
//		}

	}
}



} // namespace ns3
