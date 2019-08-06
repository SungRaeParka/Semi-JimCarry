package com.kh.jimcarry.payment.model.vo;

import java.io.Serializable;

public class Calculate implements Serializable{
	private int payAmount;
	private int driverPay;
	private int feesIncome;
	private String calCheck;
	private String driverNo;
	private String payNo;
	
	public Calculate() {}

	public Calculate(int payAmount, int driverPay, int feesIncome, String calCheck, String driverNo, String payNo) {
		super();
		this.payAmount = payAmount;
		this.driverPay = driverPay;
		this.feesIncome = feesIncome;
		this.calCheck = calCheck;
		this.driverNo = driverNo;
		this.payNo = payNo;
	}

	public int getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}

	public int getDriverPay() {
		return driverPay;
	}

	public void setDriverPay(int driverPay) {
		this.driverPay = driverPay;
	}

	public int getFeesIncome() {
		return feesIncome;
	}

	public void setFeesIncome(int feesIncome) {
		this.feesIncome = feesIncome;
	}

	public String getCalCheck() {
		return calCheck;
	}

	public void setCalCheck(String calCheck) {
		this.calCheck = calCheck;
	}

	public String getDriverNo() {
		return driverNo;
	}

	public void setDriverNo(String driverNo) {
		this.driverNo = driverNo;
	}

	public String getPayNo() {
		return payNo;
	}

	public void setPayNo(String payNo) {
		this.payNo = payNo;
	}

	@Override
	public String toString() {
		return "Calculate [payAmount=" + payAmount + ", driverPay=" + driverPay + ", feesIncome=" + feesIncome
				+ ", calCheck=" + calCheck + ", driverNo=" + driverNo + ", payNo=" + payNo + "]";
	}
	
	
	

}