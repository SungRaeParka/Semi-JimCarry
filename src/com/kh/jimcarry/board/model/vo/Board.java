package com.kh.jimcarry.board.model.vo;

import java.sql.Date;

public class Board implements java.io.Serializable {
	private String postCode;
	private String userNo;
	private Date postDate;
	private String postTitle;
	private String postContents;
	private String attachments;
	private String postType;
	private String questionType;
	private int postNo;
	private int bCount;
	private Date delDate;
	private String writer;

	public Board() {

	}

	public Board(String postCode, String userNo, Date postDate, String postTitle, String postContents,
			String attachments, String postType, String questionType, int postNo, int bCount, Date delDate,
			String writer) {
		super();
		this.postCode = postCode;
		this.userNo = userNo;
		this.postDate = postDate;
		this.postTitle = postTitle;
		this.postContents = postContents;
		this.attachments = attachments;
		this.postType = postType;
		this.questionType = questionType;
		this.postNo = postNo;
		this.bCount = bCount;
		this.delDate = delDate;
		this.writer = writer;
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

	public String getAttachments() {
		return attachments;
	}

	public void setAttachments(String attachments) {
		this.attachments = attachments;
	}

	public String getPostType() {
		return postType;
	}

	public void setPostType(String postType) {
		this.postType = postType;
	}

	public String getQuestionType() {
		return questionType;
	}

	public void setQuestionType(String questionType) {
		this.questionType = questionType;
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

	@Override
	public String toString() {
		return "Board [postCode=" + postCode + ", userNo=" + userNo + ", postDate=" + postDate + ", postTitle="
				+ postTitle + ", postContents=" + postContents + ", attachments=" + attachments + ", postType="
				+ postType + ", questionType=" + questionType + ", postNo=" + postNo + ", bCount=" + bCount
				+ ", delDate=" + delDate + ", writer=" + writer + "]";
	}





}
