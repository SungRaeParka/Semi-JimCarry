package com.kh.jimcarry.payment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Payment implements Serializable{
	private String payNo;
	private String cardPayNo;
	private String cardCompany;
	private String payer;
	private int payAmount;
	private Date payDate;
	private String reqNo;
	private String userNo;
	private String driverNo;
	private String refundReq;
	
	
	public Payment() {}

	public Payment(String payNo, String cardPayNo, String cardCompany, String payer, int payAmount, Date payDate,
			String reqNo, String userNo, String driverNo, String refundReq) {
		super();
		this.payNo = payNo;
		this.cardPayNo = cardPayNo;
		this.cardCompany = cardCompany;
		this.payer = payer;
		this.payAmount = payAmount;
		this.payDate = payDate;
		this.reqNo = reqNo;
		this.userNo = userNo;
		this.driverNo = driverNo;
		this.refundReq = refundReq;
	}

	public String getPayNo() {
		return payNo;
	}

	public void setPayNo(String payNo) {
		this.payNo = payNo;
	}

	public String getCardPayNo() {
		return cardPayNo;
	}

	public void setCardPayNo(String cardPayNo) {
		this.cardPayNo = cardPayNo;
	}

	public String getCardCompany() {
		return cardCompany;
	}

	public void setCardCompany(String cardCompany) {
		this.cardCompany = cardCompany;
	}

	public String getPayer() {
		return payer;
	}

	public void setPayer(String payer) {
		this.payer = payer;
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

	public String getReqNo() {
		return reqNo;
	}

	public void setReqNo(String reqNo) {
		this.reqNo = reqNo;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getDriverNo() {
		return driverNo;
	}

	public void setDriverNo(String driverNo) {
		this.driverNo = driverNo;
	}

	public String getRefundReq() {
		return refundReq;
	}

	public void setRefundReq(String refundReq) {
		this.refundReq = refundReq;
	}

	@Override
	public String toString() {
		return "Payment [payNo=" + payNo + ", cardPayNo=" + cardPayNo + ", cardCompany=" + cardCompany + ", payer="
				+ payer + ", payAmount=" + payAmount + ", payDate=" + payDate + ", reqNo=" + reqNo + ", userNo="
				+ userNo + ", driverNo=" + driverNo + ", refundReq=" + refundReq + "]";
	}
	
	
	
	

}







