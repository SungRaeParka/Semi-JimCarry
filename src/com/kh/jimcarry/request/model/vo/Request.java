package com.kh.jimcarry.request.model.vo;

import java.io.Serializable;
import java.util.Date;

public class Request implements Serializable{
	
	private String reservationDate;
	private String startPoint;
	private String arrivalPoint;
	private Date reqStart;
	private Date reqFinish;
	private String memo;
	private String userNo;
	private String reqNo;
	private String proNo;
	private String conditionReq;
	
	private String driverNo;
	private int orderPrice;
	private Date orderDate;
	private Date matchDate;
	private String conditionDo;	
	
	private int reqCount;
	private String userName;
	private String driverName;
	private String grade;
	
	public Request() {}

	public Request(String reservationDate, String startPoint, String arrivalPoint, Date reqStart, Date reqFinish,
			String memo, String userNo, String reqNo, String proNo, String conditionReq, String driverNo,
			int orderPrice, Date orderDate, Date matchDate, String conditionDo, int reqCount, String userName,
			String driverName, String grade) {
		super();
		this.reservationDate = reservationDate;
		this.startPoint = startPoint;
		this.arrivalPoint = arrivalPoint;
		this.reqStart = reqStart;
		this.reqFinish = reqFinish;
		this.memo = memo;
		this.userNo = userNo;
		this.reqNo = reqNo;
		this.proNo = proNo;
		this.conditionReq = conditionReq;
		this.driverNo = driverNo;
		this.orderPrice = orderPrice;
		this.orderDate = orderDate;
		this.matchDate = matchDate;
		this.conditionDo = conditionDo;
		this.reqCount = reqCount;
		this.userName = userName;
		this.driverName = driverName;
		this.grade = grade;
	}

	public String getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}

	public String getStartPoint() {
		return startPoint;
	}

	public void setStartPoint(String startPoint) {
		this.startPoint = startPoint;
	}

	public String getArrivalPoint() {
		return arrivalPoint;
	}

	public void setArrivalPoint(String arrivalPoint) {
		this.arrivalPoint = arrivalPoint;
	}

	public Date getReqStart() {
		return reqStart;
	}

	public void setReqStart(Date reqStart) {
		this.reqStart = reqStart;
	}

	public Date getReqFinish() {
		return reqFinish;
	}

	public void setReqFinish(Date reqFinish) {
		this.reqFinish = reqFinish;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getReqNo() {
		return reqNo;
	}

	public void setReqNo(String reqNo) {
		this.reqNo = reqNo;
	}

	public String getProNo() {
		return proNo;
	}

	public void setProNo(String proNo) {
		this.proNo = proNo;
	}

	public String getConditionReq() {
		return conditionReq;
	}

	public void setConditionReq(String conditionReq) {
		this.conditionReq = conditionReq;
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

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Date getMatchDate() {
		return matchDate;
	}

	public void setMatchDate(Date matchDate) {
		this.matchDate = matchDate;
	}

	public String getConditionDo() {
		return conditionDo;
	}

	public void setConditionDo(String conditionDo) {
		this.conditionDo = conditionDo;
	}

	public int getReqCount() {
		return reqCount;
	}

	public void setReqCount(int reqCount) {
		this.reqCount = reqCount;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getDriverName() {
		return driverName;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "Request [reservationDate=" + reservationDate + ", startPoint=" + startPoint + ", arrivalPoint="
				+ arrivalPoint + ", reqStart=" + reqStart + ", reqFinish=" + reqFinish + ", memo=" + memo + ", userNo="
				+ userNo + ", reqNo=" + reqNo + ", proNo=" + proNo + ", conditionReq=" + conditionReq + ", driverNo="
				+ driverNo + ", orderPrice=" + orderPrice + ", orderDate=" + orderDate + ", matchDate=" + matchDate
				+ ", conditionDo=" + conditionDo + ", reqCount=" + reqCount + ", userName=" + userName + ", driverName="
				+ driverName + ", grade=" + grade + "]";
	}
	

}
