package com.kh.jimcarry.admin.member.model.vo;

import java.sql.Date;

public class Declaration implements java.io.Serializable{
	private String declNo;
	private String userNo;
	private String driverNo;
	private Date declDate;
	private String DeclReason;

	public Declaration() {}

	public Declaration(String declNo, String userNo, String driverNo, Date declDate, String declReason) {
		super();
		this.declNo = declNo;
		this.userNo = userNo;
		this.driverNo = driverNo;
		this.declDate = declDate;
		DeclReason = declReason;
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
		return DeclReason;
	}

	public void setDeclReason(String declReason) {
		DeclReason = declReason;
	}

	@Override
	public String toString() {
		return "Declaration [declNo=" + declNo + ", userNo=" + userNo + ", driverNo=" + driverNo + ", declDate="
				+ declDate + ", DeclReason=" + DeclReason + "]";
	}


}
