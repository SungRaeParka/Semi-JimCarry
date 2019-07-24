package com.kh.jimcarry.member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable{
	private String seqNo;
	private String userName;
	private String userId;
	private String userPwd;
	private String phone;
	private Date enrollDate;
	private String statusCheck;
	private String udCheck;
	private String agent;
	private String businessNo;
	private String businessAddress;
	private String carType;
	private String carNo;
	private String bankName;
	private String accountNo;
	private String carSize;
	private String blacklistCheck;
	private String joinCheck;
	private String refuseReason;

	public Member() {}

	public Member(String seqNo, String userName, String userId, String userPwd, String phone, Date enrollDate,
			String statusCheck, String udCheck, String agent, String businessNo, String businessAddress, String carType,
			String carNo, String bankName, String accountNo, String carSize, String blacklistCheck, String joinCheck,
			String refuseReason) {
		super();
		this.seqNo = seqNo;
		this.userName = userName;
		this.userId = userId;
		this.userPwd = userPwd;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.statusCheck = statusCheck;
		this.udCheck = udCheck;
		this.agent = agent;
		this.businessNo = businessNo;
		this.businessAddress = businessAddress;
		this.carType = carType;
		this.carNo = carNo;
		this.bankName = bankName;
		this.accountNo = accountNo;
		this.carSize = carSize;
		this.blacklistCheck = blacklistCheck;
		this.joinCheck = joinCheck;
		this.refuseReason = refuseReason;
	}

	public String getSeqNo() {
		return seqNo;
	}

	public void setSeqNo(String seqNo) {
		this.seqNo = seqNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatusCheck() {
		return statusCheck;
	}

	public void setStatusCheck(String statusCheck) {
		this.statusCheck = statusCheck;
	}

	public String getUdCheck() {
		return udCheck;
	}

	public void setUdCheck(String udCheck) {
		this.udCheck = udCheck;
	}

	public String getAgent() {
		return agent;
	}

	public void setAgent(String agent) {
		this.agent = agent;
	}

	public String getBusinessNo() {
		return businessNo;
	}

	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}

	public String getBusinessAddress() {
		return businessAddress;
	}

	public void setBusinessAddress(String businessAddress) {
		this.businessAddress = businessAddress;
	}

	public String getCarType() {
		return carType;
	}

	public void setCarType(String carType) {
		this.carType = carType;
	}

	public String getCarNo() {
		return carNo;
	}

	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getCarSize() {
		return carSize;
	}

	public void setCarSize(String carSize) {
		this.carSize = carSize;
	}

	public String getBlacklistCheck() {
		return blacklistCheck;
	}

	public void setBlacklistCheck(String blacklistCheck) {
		this.blacklistCheck = blacklistCheck;
	}

	public String getJoinCheck() {
		return joinCheck;
	}

	public void setJoinCheck(String joinCheck) {
		this.joinCheck = joinCheck;
	}

	public String getRefuseReason() {
		return refuseReason; 
	}

	public void setRefuseReason(String refuseReason) {
		this.refuseReason = refuseReason;
	}

	@Override
	public String toString() {
		return "Member [seqNo=" + seqNo + ", userName=" + userName + ", userId=" + userId + ", userPwd=" + userPwd
				+ ", phone=" + phone + ", enrollDate=" + enrollDate + ", statusCheck=" + statusCheck + ", udCheck="
				+ udCheck + ", agent=" + agent + ", businessNo=" + businessNo + ", businessAddress=" + businessAddress
				+ ", carType=" + carType + ", carNo=" + carNo + ", bankName=" + bankName + ", accountNo=" + accountNo
				+ ", carSize=" + carSize + ", blacklistCheck=" + blacklistCheck + ", joinCheck=" + joinCheck
				+ ", refuseReason=" + refuseReason + "]";
	}

	

	
}
