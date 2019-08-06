package com.kh.jimcarry.payment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Refund implements Serializable{
	private String refundNo;
	private String payNo;
	private Date refundReqDate;
	private String reservationDate;
	private int payAmount;
	private int refundFees;
	private String refundReason;
	private String refund_codition;
	private String companionReason;
	
	public Refund() {}

	public Refund(String refundNo, String payNo, Date refundReqDate, String reservationDate, int payAmount,
			int refundFees, String refundReason, String refund_codition, String companionReason) {
		super();
		this.refundNo = refundNo;
		this.payNo = payNo;
		this.refundReqDate = refundReqDate;
		this.reservationDate = reservationDate;
		this.payAmount = payAmount;
		this.refundFees = refundFees;
		this.refundReason = refundReason;
		this.refund_codition = refund_codition;
		this.companionReason = companionReason;
	}

	public String getRefundNo() {
		return refundNo;
	}

	public void setRefundNo(String refundNo) {
		this.refundNo = refundNo;
	}

	public String getPayNo() {
		return payNo;
	}

	public void setPayNo(String payNo) {
		this.payNo = payNo;
	}

	public Date getRefundReqDate() {
		return refundReqDate;
	}

	public void setRefundReqDate(Date refundReqDate) {
		this.refundReqDate = refundReqDate;
	}

	public String getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}

	public int getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}

	public int getRefundFees() {
		return refundFees;
	}

	public void setRefundFees(int refundFees) {
		this.refundFees = refundFees;
	}

	public String getRefundReason() {
		return refundReason;
	}

	public void setRefundReason(String refundReason) {
		this.refundReason = refundReason;
	}

	public String getRefund_codition() {
		return refund_codition;
	}

	public void setRefund_codition(String refund_codition) {
		this.refund_codition = refund_codition;
	}

	public String getCompanionReason() {
		return companionReason;
	}

	public void setCompanionReason(String companionReason) {
		this.companionReason = companionReason;
	}

	@Override
	public String toString() {
		return "Refund [refundNo=" + refundNo + ", payNo=" + payNo + ", refundReqDate=" + refundReqDate
				+ ", reservationDate=" + reservationDate + ", payAmount=" + payAmount + ", refundFees=" + refundFees
				+ ", refundReason=" + refundReason + ", refund_codition=" + refund_codition + ", companionReason="
				+ companionReason + "]";
	}

	
	
	
}

