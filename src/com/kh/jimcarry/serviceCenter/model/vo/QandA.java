package com.kh.jimcarry.serviceCenter.model.vo;

public class QandA {
	private String questionType;
	private String postTitle;
	private String postContent;
	private String postType;
	
	public QandA() {}

	public QandA(String questionType, String postTitle, String postContent, String postType) {
		super();
		this.questionType = questionType;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postType = postType;
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

	public String getPostType() {
		return postType;
	}

	public void setPostType(String postType) {
		this.postType = postType;
	}

	@Override
	public String toString() {
		return "QandA [questionType=" + questionType + ", postTitle=" + postTitle + ", postContent=" + postContent
				+ ", postType=" + postType + "]";
	}
	
	
	
	

}
