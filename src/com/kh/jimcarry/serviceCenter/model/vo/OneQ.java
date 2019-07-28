package com.kh.jimcarry.serviceCenter.model.vo;

import java.sql.Date;

public class OneQ {
	private String questionType;
	private String postTitle;
	private String postContent;
	private Date postDate;
	private String answer;
	
	
	public OneQ() {}


	public OneQ(String questionType, String postTitle, String postContent, Date postDate, String answer) {
		super();
		this.questionType = questionType;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postDate = postDate;
		this.answer = answer;
	}


	public String getQuestionType() {
		return questionType;
	}


	public void setQuestionType(String questionType) {
		this.questionType = questionType;
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


	public Date getPostDate() {
		return postDate;
	}


	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}


	public String getAnswer() {
		return answer;
	}


	public void setAnswer(String answer) {
		this.answer = answer;
	}


	@Override
	public String toString() {
		return "OneQ [questionType=" + questionType + ", postTitle=" + postTitle + ", postContent=" + postContent
				+ ", postDate=" + postDate + ", answer=" + answer + "]";
	}

	
	
	
}
	
	
	