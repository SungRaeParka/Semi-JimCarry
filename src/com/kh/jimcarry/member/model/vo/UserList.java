package com.kh.jimcarry.member.model.vo;

import java.sql.Date;

public class UserList {
	private String reqNo;				//견적번호
	private String userName;			//기사명
	private Date matchingDate;			//매칭일자
	private String reservattonDate;		//예약일자
	private int orderPrice;				//견적금액
	private String ConditionReq;		//매칭상태
	
	public UserList() {}

	public UserList(String reqNo, String userName, Date matchingDate, String reservattonDate, int orderPrice,
			String conditionReq) {
		super();
		this.reqNo = reqNo;
		this.userName = userName;
		this.matchingDate = matchingDate;
		this.reservattonDate = reservattonDate;
		this.orderPrice = orderPrice;
		ConditionReq = conditionReq;
	}

	public String getReqNo() {
		return reqNo;
	}

	public void setReqNo(String reqNo) {
		this.reqNo = reqNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getMatchingDate() {
		return matchingDate;
	}

	public void setMatchingDate(Date matchingDate) {
		this.matchingDate = matchingDate;
	}

	public String getReservattonDate() {
		return reservattonDate;
	}

	public void setReservattonDate(String reservattonDate) {
		this.reservattonDate = reservattonDate;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public String getConditionReq() {
		return ConditionReq;
	}

	public void setConditionReq(String conditionReq) {
		ConditionReq = conditionReq;
	}

	@Override
	public String toString() {
		return "UserList [reqNo=" + reqNo + ", userName=" + userName + ", matchingDate=" + matchingDate
				+ ", reservattonDate=" + reservattonDate + ", orderPrice=" + orderPrice + ", ConditionReq="
				+ ConditionReq + "]";
	}
	
	
}
