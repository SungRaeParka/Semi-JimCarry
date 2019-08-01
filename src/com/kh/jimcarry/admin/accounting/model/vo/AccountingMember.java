package com.kh.jimcarry.admin.accounting.model.vo;

import java.sql.Date;

public class AccountingMember implements java.io.Serializable{
	private String memberName;
	private String memberNo;
	private String memberId;
	private String payNo;
	private Date reservationDate;
	private int payAmount;
	private Date payDate;
	private String refundReq;
	private int driverPay;
	private String userDriver;
//	private Date 정산일??

	public AccountingMember() {}

	public AccountingMember(String memberName, String memberNo, String memberId, String payNo, Date reservationDate,
			int payAmount, Date payDate, String refundReq, int driverPay, String userDriver) {
		super();
		this.memberName = memberName;
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.payNo = payNo;
		this.reservationDate = reservationDate;
		this.payAmount = payAmount;
		this.payDate = payDate;
		this.refundReq = refundReq;
		this.driverPay = driverPay;
		this.userDriver = userDriver;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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

	public int getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public String getRefundReq() {
		return refundReq;
	}

	public void setRefundReq(String refundReq) {
		this.refundReq = refundReq;
	}

	public int getDriverPay() {
		return driverPay;
	}

	public void setDriverPay(int driverPay) {
		this.driverPay = driverPay;
	}

	public String getUserDriver() {
		return userDriver;
	}

	public void setUserDriver(String userDriver) {
		this.userDriver = userDriver;
	}

	@Override
	public String toString() {
		return "AccountingMember [memberName=" + memberName + ", memberNo=" + memberNo + ", memberId=" + memberId
				+ ", payNo=" + payNo + ", reservationDate=" + reservationDate + ", payAmount=" + payAmount
				+ ", payDate=" + payDate + ", refundReq=" + refundReq + ", driverPay=" + driverPay + ", userDriver="
				+ userDriver + "]";
	}





}
