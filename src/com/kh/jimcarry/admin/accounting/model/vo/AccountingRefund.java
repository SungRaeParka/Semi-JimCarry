package com.kh.jimcarry.admin.accounting.model.vo;

import java.sql.Date;

public class AccountingRefund implements java.io.Serializable{
	private String payNo;
	private Date reservationDate;
	private String memberName;
	private Date refundReqDate;
	private int payAmount;
	private int refundFees;
	private String refundReason;
	private String refundCondition;
	private String companionReason;
	private String refundMember;

	public AccountingRefund() {}

	public AccountingRefund(String payNo, Date reservationDate, String memberName, Date refundReqDate, int payAmount,
			int refundFees, String refundReason, String refundCondition, String companionReason, String refundMember) {
		super();
		this.payNo = payNo;
		this.reservationDate = reservationDate;
		this.memberName = memberName;
		this.refundReqDate = refundReqDate;
		this.payAmount = payAmount;
		this.refundFees = refundFees;
		this.refundReason = refundReason;
		this.refundCondition = refundCondition;
		this.companionReason = companionReason;
		this.refundMember = refundMember;
	}

	public String getPayNo() {
		return payNo;
	}

	public void setPayNo(String payNo) {
		this.payNo = payNo;
	}

	public Date getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(Date reservationDate) {
		this.reservationDate = reservationDate;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public Date getRefundReqDate() {
		return refundReqDate;
	}

	public void setRefundReqDate(Date refundReqDate) {
		this.refundReqDate = refundReqDate;
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

	public String getRefundCondition() {
		return refundCondition;
	}

	public void setRefundCondition(String refundCondition) {
		this.refundCondition = refundCondition;
	}

	public String getCompanionReason() {
		return companionReason;
	}

	public void setCompanionReason(String companionReason) {
		this.companionReason = companionReason;
	}

	public String getRefundMember() {
		return refundMember;
	}

	public void setRefundMember(String refundMember) {
		this.refundMember = refundMember;
	}

	@Override
	public String toString() {
		return "AccountingRefund [payNo=" + payNo + ", reservationDate=" + reservationDate + ", memberName="
				+ memberName + ", refundReqDate=" + refundReqDate + ", payAmount=" + payAmount + ", refundFees="
				+ refundFees + ", refundReason=" + refundReason + ", refundCondition=" + refundCondition
				+ ", companionReason=" + companionReason + ", refundMember=" + refundMember + "]";
	}




}
