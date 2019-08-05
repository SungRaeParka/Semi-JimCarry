package com.kh.jimcarry.member.model.vo;

import java.sql.Date;

public class DriverList {
	private String reservattonDate;	//예약일자
	private Date matchingDate;		//매칭일자
	private String reqNo;			//견적번호
	private String ConditionReq;	//견적상태
	private String driverNo;		//기사번호
	private int orderPrice;			//견적금액
	private int driverPay;			//정산금액
	private String userName;		//유저이름
	
	public DriverList () {}

	public DriverList(String reservattonDate, Date matchingDate, String reqNo, String conditionReq, String driverNo,
			int orderPrice, int driverPay, String userName) {
		super();
		this.reservattonDate = reservattonDate;
		this.matchingDate = matchingDate;
		this.reqNo = reqNo;
		ConditionReq = conditionReq;
		this.driverNo = driverNo;
		this.orderPrice = orderPrice;
		this.driverPay = driverPay;
		this.userName = userName;
	}

	public String getReservattonDate() {
		return reservattonDate;
	}

	public void setReservattonDate(String reservattonDate) {
		this.reservattonDate = reservattonDate;
	}

	public Date getMatchingDate() {
		return matchingDate;
	}

	public void setMatchingDate(Date matchingDate) {
		this.matchingDate = matchingDate;
	}

	public String getReqNo() {
		return reqNo;
	}

	public void setReqNo(String reqNo) {
		this.reqNo = reqNo;
	}

	public String getConditionReq() {
		return ConditionReq;
	}

	public void setConditionReq(String conditionReq) {
		ConditionReq = conditionReq;
	}

	public String getDriverNo() {
		return driverNo;
	}

	public void setDriverNo(String driverNo) {
		this.driverNo = driverNo;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public int getDriverPay() {
		return driverPay;
	}

	public void setDriverPay(int driverPay) {
		this.driverPay = driverPay;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "DriverList [reservattonDate=" + reservattonDate + ", matchingDate=" + matchingDate + ", reqNo=" + reqNo
				+ ", ConditionReq=" + ConditionReq + ", driverNo=" + driverNo + ", orderPrice=" + orderPrice
				+ ", driverPay=" + driverPay + ", userName=" + userName + "]";
	}

	

	
	
	
}
