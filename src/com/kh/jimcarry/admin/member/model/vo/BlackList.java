package com.kh.jimcarry.admin.member.model.vo;

import java.sql.Date;

public class BlackList implements java.io.Serializable{
	private String driverNo;
	private String stopReason;
	private Date stopDate;
	private String activationReason;
	private Date activationDate;
	private String declNo;
	private String blackNo;
	private double starRating;

	public BlackList() {}

	public BlackList(String driverNo, String stopReason, Date stopDate, String activationReason, Date activationDate,
			String declNo, String blackNo, double starRating) {
		super();
		this.driverNo = driverNo;
		this.stopReason = stopReason;
		this.stopDate = stopDate;
		this.activationReason = activationReason;
		this.activationDate = activationDate;
		this.declNo = declNo;
		this.blackNo = blackNo;
		this.starRating = starRating;
	}

	public String getDriverNo() {
		return driverNo;
	}

	public void setDriverNo(String driverNo) {
		this.driverNo = driverNo;
	}

	public String getStopReason() {
		return stopReason;
	}

	public void setStopReason(String stopReason) {
		this.stopReason = stopReason;
	}

	public Date getStopDate() {
		return stopDate;
	}

	public void setStopDate(Date stopDate) {
		this.stopDate = stopDate;
	}

	public String getActivationReason() {
		return activationReason;
	}

	public void setActivationReason(String activationReason) {
		this.activationReason = activationReason;
	}

	public Date getActivationDate() {
		return activationDate;
	}

	public void setActivationDate(Date activationDate) {
		this.activationDate = activationDate;
	}

	public String getDeclNo() {
		return declNo;
	}

	public void setDeclNo(String declNo) {
		this.declNo = declNo;
	}

	public String getBlackNo() {
		return blackNo;
	}

	public void setBlackNo(String blackNo) {
		this.blackNo = blackNo;
	}

	public double getStarRating() {
		return starRating;
	}

	public void setStarRating(double starRating) {
		this.starRating = starRating;
	}

	@Override
	public String toString() {
		return "BlackList [driverNo=" + driverNo + ", stopReason=" + stopReason + ", stopDate=" + stopDate
				+ ", activationReason=" + activationReason + ", activationDate=" + activationDate + ", declNo=" + declNo
				+ ", blackNo=" + blackNo + ", starRating=" + starRating + "]";
	}







}
