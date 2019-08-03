package com.kh.jimcarry.board.model.vo;

import java.sql.Date;

public class DP {
	private String postCode;
	private String userNo;
	private Date postDate;
	private String postTitle;
	private String postContents;
	private String postType;
	private int postNo;
	private int bCount;
	private Date delDate;
	private String writer;
	private String status;
	
	public DP() {}

	public DP(String postCode, String userNo, Date postDate, String postTitle, String postContents, String postType,
			int postNo, int bCount, Date delDate, String writer, String status) {
		super();
		this.postCode = postCode;
		this.userNo = userNo;
		this.postDate = postDate;
		this.postTitle = postTitle;
		this.postContents = postContents;
		this.postType = postType;
		this.postNo = postNo;
		this.bCount = bCount;
		this.delDate = delDate;
		this.writer = writer;
		this.status = status;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContents() {
		return postContents;
	}

	public void setPostContents(String postContents) {
		this.postContents = postContents;
	}

	public String getPostType() {
		return postType;
	}

	public void setPostType(String postType) {
		this.postType = postType;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public Date getDelDate() {
		return delDate;
	}

	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "DP [postCode=" + postCode + ", userNo=" + userNo + ", postDate=" + postDate + ", postTitle=" + postTitle
				+ ", postContents=" + postContents + ", postType=" + postType + ", postNo=" + postNo + ", bCount="
				+ bCount + ", delDate=" + delDate + ", writer=" + writer + ", status=" + status + "]";
	}

	
	
}
