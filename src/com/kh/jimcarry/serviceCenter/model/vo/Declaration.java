 package com.kh.jimcarry.serviceCenter.model.vo;

import java.sql.Date;

public class Declaration {
	private String declNo;
	private String userNo;
	private String driverNo;
	private Date declDate;
	private String declReason;
	
	
	public Declaration() {
		super();
	}


	public Declaration(String declNo, String userNo, String driverNo, Date declDate, String declReason) {
		super();
		this.declNo = declNo;
		this.userNo = userNo;
		this.driverNo = driverNo;
		this.declDate = declDate;
		this.declReason = declReason;
	}


	public String getDeclNo() {
		return declNo;
	}


	public void setDeclNo(String declNo) {
		this.declNo = declNo;
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


	public Date getDeclDate() {
		return declDate;
	}


	public void setDeclDate(Date declDate) {
		this.declDate = declDate;
	}


	public String getDeclReason() {
		return declReason;
	}


	public void setDeclReason(String declReason) {
		this.declReason = declReason;
	}


	@Override
	public String toString() {
		return "Declaration [declNo=" + declNo + ", userNo=" + userNo + ", driverNo=" + driverNo + ", declDate="
				+ declDate + ", declReason=" + declReason + "]";
	}
	
	 
}
