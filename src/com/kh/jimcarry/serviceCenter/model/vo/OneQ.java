package com.kh.jimcarry.serviceCenter.model.vo;

import java.sql.Date;

public class OneQ {
	private String postCond;
	private String userNo;
	private String  postNo;
	private Date postdate;
	private String postTitle;
	private String postContent;
	private String attachments;
	private String postType;
	private String questionType;
	
	
	public OneQ() {}


	public OneQ(String postCond, String userNo, String postNo, Date postdate, String postTitle, String postContent,
			String attachments, String postType, String questionType) {
		super();
		this.postCond = postCond;
		this.userNo = userNo;
		this.postNo = postNo;
		this.postdate = postdate;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.attachments = attachments;
		this.postType = postType;
		this.questionType = questionType;
	}


	public String getPostCond() {
		return postCond;
	}


	public void setPostCond(String postCond) {
		this.postCond = postCond;
	}


	public String getUserNo() {
		return userNo;
	}


	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}


	public String getPostNo() {
		return postNo;
	}


	public void setPostNo(String postNo) {
		this.postNo = postNo;
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


	@Override
	public String toString() {
		return "OneQ [postCond=" + postCond + ", userNo=" + userNo + ", postNo=" + postNo + ", postdate=" + postdate
				+ ", postTitle=" + postTitle + ", postContent=" + postContent + ", attachments=" + attachments
				+ ", postType=" + postType + ", questionType=" + questionType + "]";
	}


	
}
	
	
	