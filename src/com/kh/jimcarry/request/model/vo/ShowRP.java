package com.kh.jimcarry.request.model.vo;

import java.sql.Date;

public class ShowRP implements java.io.Serializable{
	private String reqNo;
	private String reservDate;
	private String startPoint;
	private String arrivePoint;
	private String proNo;
	private String proKind;
	private String proName;
	private String proType;
	private String proSize;
	private String proMat;
	private String proWidth;
	private String proHeight;
	private String proGck;
	private String proUni;
	private int bookCount;
	private int boxCount;
	private String memo;
	private Date reqStart;
	private Date reqFinish;
	
	public ShowRP() {}
	

	public ShowRP(String reqNo, String reservDate, String startPoint, String arrivePoint, String proNo, String proKind,
			String proName, String proType, String proSize, String proMat, String proWidth, String proHeight,
			String proGck, String proUni, int bookCount, int boxCount, String memo, Date reqStart, Date reqFinish) {
		super();
		this.reqNo = reqNo;
		this.reservDate = reservDate;
		this.startPoint = startPoint;
		this.arrivePoint = arrivePoint;
		this.proNo = proNo;
		this.proKind = proKind;
		this.proName = proName;
		this.proType = proType;
		this.proSize = proSize;
		this.proMat = proMat;
		this.proWidth = proWidth;
		this.proHeight = proHeight;
		this.proGck = proGck;
		this.proUni = proUni;
		this.bookCount = bookCount;
		this.boxCount = boxCount;
		this.memo = memo;
		this.reqStart = reqStart;
		this.reqFinish = reqFinish;
	}

	public String getReqNo() {
		return reqNo;
	}

	public void setReqNo(String reqNo) {
		this.reqNo = reqNo;
	}

	public String getReservDate() {
		return reservDate;
	}

	public void setReservDate(String reservDate) {
		this.reservDate = reservDate;
	}

	public String getStartPoint() {
		return startPoint;
	}

	public void setStartPoint(String startPoint) {
		this.startPoint = startPoint;
	}

	public String getArrivePoint() {
		return arrivePoint;
	}

	public void setArrivePoint(String arrivePoint) {
		this.arrivePoint = arrivePoint;
	}

	public String getProNo() {
		return proNo;
	}

	public void setProNo(String proNo) {
		this.proNo = proNo;
	}

	public String getProKind() {
		return proKind;
	}

	public void setProKind(String proKind) {
		this.proKind = proKind;
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

	public String getProMat() {
		return proMat;
	}

	public void setProMat(String proMat) {
		this.proMat = proMat;
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

	public String getProGck() {
		return proGck;
	}

	public void setProGck(String proGck) {
		this.proGck = proGck;
	}

	public String getProUni() {
		return proUni;
	}

	public void setProUni(String proUni) {
		this.proUni = proUni;
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

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
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

	@Override
	public String toString() {
		return "ShowRP [reqNo=" + reqNo + ", reservDate=" + reservDate + ", startPoint=" + startPoint + ", arrivePoint="
				+ arrivePoint + ", proNo=" + proNo + ", proKind=" + proKind + ", proName=" + proName + ", proType="
				+ proType + ", proSize=" + proSize + ", proMat=" + proMat + ", proWidth=" + proWidth + ", proHeight="
				+ proHeight + ", proGck=" + proGck + ", proUni=" + proUni + ", bookCount=" + bookCount + ", boxCount="
				+ boxCount + ", memo=" + memo + ", reqStart=" + reqStart + ", reqFinish=" + reqFinish + "]";
	}
	
	
	
}
