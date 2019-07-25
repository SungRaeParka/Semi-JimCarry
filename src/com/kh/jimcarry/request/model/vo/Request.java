package com.kh.jimcarry.request.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Request implements Serializable{
	
	private Date reservationDate;
	private int reservationTime;
	private String startPoint;
	private String arrivalPoint;
	private Date reqStart;
	private Date reqFinish;
	private String memo;
	private String userNo;
	private String reqNo;
	private String proNo;
	private String condition;
	
	private String driverNo;
	private int orderPrice;
	private Date orderDate;
	private Date matchDate;
	private String matchCheck;
	
	private String proName;
	private String proType;
	private String proSize;
	private String proMaterial;
	private String proWidth;
	private String proHeight;
	private String glassCheck;
	private String uniquness;
	private String proKind;
	private int bookCount;
	private int boxCount;
	
	private int reqCount;
	private String driverName;
	private String grade;
	
	
	public Request() {}


	public Request(Date reservationDate, int reservationTime, String startPoint, String arrivalPoint, Date reqStart,
			Date reqFinish, String memo, String userNo, String reqNo, String proNo, String condition, String driverNo,
			int orderPrice, Date orderDate, Date matchDate, String matchCheck, String proName, String proType,
			String proSize, String proMaterial, String proWidth, String proHeight, String glassCheck, String uniquness,
			String proKind, int bookCount, int boxCount, int reqCount, String driverName, String grade) {
		super();
		this.reservationDate = reservationDate;
		this.reservationTime = reservationTime;
		this.startPoint = startPoint;
		this.arrivalPoint = arrivalPoint;
		this.reqStart = reqStart;
		this.reqFinish = reqFinish;
		this.memo = memo;
		this.userNo = userNo;
		this.reqNo = reqNo;
		this.proNo = proNo;
		this.condition = condition;
		this.driverNo = driverNo;
		this.orderPrice = orderPrice;
		this.orderDate = orderDate;
		this.matchDate = matchDate;
		this.matchCheck = matchCheck;
		this.proName = proName;
		this.proType = proType;
		this.proSize = proSize;
		this.proMaterial = proMaterial;
		this.proWidth = proWidth;
		this.proHeight = proHeight;
		this.glassCheck = glassCheck;
		this.uniquness = uniquness;
		this.proKind = proKind;
		this.bookCount = bookCount;
		this.boxCount = boxCount;
		this.reqCount = reqCount;
		this.driverName = driverName;
		this.grade = grade;
	}


	public Date getReservationDate() {
		return reservationDate;
	}


	public void setReservationDate(Date reservationDate) {
		this.reservationDate = reservationDate;
	}


	public int getReservationTime() {
		return reservationTime;
	}


	public void setReservationTime(int reservationTime) {
		this.reservationTime = reservationTime;
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


	public String getCondition() {
		return condition;
	}


	public void setCondition(String condition) {
		this.condition = condition;
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


	public String getMatchCheck() {
		return matchCheck;
	}


	public void setMatchCheck(String matchCheck) {
		this.matchCheck = matchCheck;
	}


	public String getProName() {
		return proName;
	}


	public void setProName(String proName) {
		this.proName = proName;
	}


	public String getProType() {
		return proType;
	}


	public void setProType(String proType) {
		this.proType = proType;
	}


	public String getProSize() {
		return proSize;
	}


	public void setProSize(String proSize) {
		this.proSize = proSize;
	}


	public String getProMaterial() {
		return proMaterial;
	}


	public void setProMaterial(String proMaterial) {
		this.proMaterial = proMaterial;
	}


	public String getProWidth() {
		return proWidth;
	}


	public void setProWidth(String proWidth) {
		this.proWidth = proWidth;
	}


	public String getProHeight() {
		return proHeight;
	}


	public void setProHeight(String proHeight) {
		this.proHeight = proHeight;
	}


	public String getGlassCheck() {
		return glassCheck;
	}


	public void setGlassCheck(String glassCheck) {
		this.glassCheck = glassCheck;
	}


	public String getUniquness() {
		return uniquness;
	}


	public void setUniquness(String uniquness) {
		this.uniquness = uniquness;
	}


	public String getProKind() {
		return proKind;
	}


	public void setProKind(String proKind) {
		this.proKind = proKind;
	}


	public int getBookCount() {
		return bookCount;
	}


	public void setBookCount(int bookCount) {
		this.bookCount = bookCount;
	}


	public int getBoxCount() {
		return boxCount;
	}


	public void setBoxCount(int boxCount) {
		this.boxCount = boxCount;
	}


	public int getReqCount() {
		return reqCount;
	}


	public void setReqCount(int reqCount) {
		this.reqCount = reqCount;
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
		return "Request [reservationDate=" + reservationDate + ", reservationTime=" + reservationTime + ", startPoint="
				+ startPoint + ", arrivalPoint=" + arrivalPoint + ", reqStart=" + reqStart + ", reqFinish=" + reqFinish
				+ ", memo=" + memo + ", userNo=" + userNo + ", reqNo=" + reqNo + ", proNo=" + proNo + ", condition="
				+ condition + ", driverNo=" + driverNo + ", orderPrice=" + orderPrice + ", orderDate=" + orderDate
				+ ", matchDate=" + matchDate + ", matchCheck=" + matchCheck + ", proName=" + proName + ", proType="
				+ proType + ", proSize=" + proSize + ", proMaterial=" + proMaterial + ", proWidth=" + proWidth
				+ ", proHeight=" + proHeight + ", glassCheck=" + glassCheck + ", uniquness=" + uniquness + ", proKind="
				+ proKind + ", bookCount=" + bookCount + ", boxCount=" + boxCount + ", reqCount=" + reqCount
				+ ", driverName=" + driverName + ", grade=" + grade + "]";
	}


	
	

	
	

}
