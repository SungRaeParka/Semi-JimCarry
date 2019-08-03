package com.kh.jimcarry.admin.statistics.model.vo;

import java.sql.Date;

public class StatisticsMember implements java.io.Serializable{
	private String period;
	private int userCount;
	private int driverCount;
	private int blCount;
	private int memberCount;
	private String periodResult;

	public StatisticsMember() {}

	public StatisticsMember(String period, int userCount, int driverCount, int blCount, int memberCount,
			String periodResult) {
		super();
		this.period = period;
		this.userCount = userCount;
		this.driverCount = driverCount;
		this.blCount = blCount;
		this.memberCount = memberCount;
		this.periodResult = periodResult;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public int getUserCount() {
		return userCount;
	}

	public void setUserCount(int userCount) {
		this.userCount = userCount;
	}

	public int getDriverCount() {
		return driverCount;
	}

	public void setDriverCount(int driverCount) {
		this.driverCount = driverCount;
	}

	public int getBlCount() {
		return blCount;
	}

	public void setBlCount(int blCount) {
		this.blCount = blCount;
	}

	public int getMemberCount() {
		return memberCount;
	}

	public void setMemberCount(int memberCount) {
		this.memberCount = memberCount;
	}

	public String getPeriodResult() {
		return periodResult;
	}

	public void setPeriodResult(String periodResult) {
		this.periodResult = periodResult;
	}

	@Override
	public String toString() {
		return "StatisticsMember [period=" + period + ", userCount=" + userCount + ", driverCount=" + driverCount
				+ ", blCount=" + blCount + ", memberCount=" + memberCount + ", periodResult=" + periodResult + "]";
	}


}
