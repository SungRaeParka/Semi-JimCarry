package com.kh.jimcarry.serviceCenter.model.vo;

import java.sql.Date;

public class Notice {
	private String postcode;
	private String userNo;
	private Date postdate;
	private String postTitle;
	private String postContent;
	private String postType;
	private int postNo;
	private int bCount;
	
	public Notice() {}

	public Notice(String postcode, String userNo, Date postdate, String postTitle, String postContent, String postType,
			int postNo, int bCount) {
		super();
		this.postcode = postcode;
		this.userNo = userNo;
		this.postdate = postdate;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postType = postType;
		this.postNo = postNo;
		this.bCount = bCount;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public Date getPostdate() {
		return postdate;
	}

	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
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

	@Override
	public String toString() {
		return "Notice [postcode=" + postcode + ", userNo=" + userNo + ", postdate=" + postdate + ", postTitle="
				+ postTitle + ", postContent=" + postContent + ", postType=" + postType + ", postNo=" + postNo
				+ ", bCount=" + bCount + "]";
	}
	
	
	
	
}
