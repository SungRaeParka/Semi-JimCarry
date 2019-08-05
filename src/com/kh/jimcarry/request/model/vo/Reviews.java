package com.kh.jimcarry.request.model.vo;

import java.io.Serializable;

public class Reviews implements Serializable{
	private String reviewCode;
	private String userNo;
	private String driverNo;
	private int grade;
	private String review;
	private String reqNo;
	private String status;
	
	public Reviews() {}

	public Reviews(String reviewCode, String userNo, String driverNo, int grade, String review, String reqNo,
			String status) {
		super();
		this.reviewCode = reviewCode;
		this.userNo = userNo;
		this.driverNo = driverNo;
		this.grade = grade;
		this.review = review;
		this.reqNo = reqNo;
		this.status = status;
	}

	public String getReviewCode() {
		return reviewCode;
	}

	public void setReviewCode(String reviewCode) {
		this.reviewCode = reviewCode;
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

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getReqNo() {
		return reqNo;
	}

	public void setReqNo(String reqNo) {
		this.reqNo = reqNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Reviews [reviewCode=" + reviewCode + ", userNo=" + userNo + ", driverNo=" + driverNo + ", grade="
				+ grade + ", review=" + review + ", reqNo=" + reqNo + ", status=" + status + "]";
	}
	
	
	
	
	
}

