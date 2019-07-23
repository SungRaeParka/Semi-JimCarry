package com.kh.jimcarry.board.model.vo;

import java.sql.Date;

public class Board {
	private String postCode; //게시글코드(SEQ)
	private String userNo; //작성자번호(SEQ)
	private Date postDate; // 작성일자
	private String postTitle; //제목
	private String postContents; //내용
	private String attachments; //첨부파일
	private Date delDate; // 삭제일자
	private String postType; //게시판 구분
	private String questionType; //문의유형
	private String postNo1; //글번호(SEQ)

	public Board() {

	}

	public Board(String postCode, String userNo, Date postDate, String postTitle, String postContents,
			String attachments, Date delDate, String postType, String questionType, String postNo1) {
		super();
		this.postCode = postCode;
		this.userNo = userNo;
		this.postDate = postDate;
		this.postTitle = postTitle;
		this.postContents = postContents;
		this.attachments = attachments;
		this.delDate = delDate;
		this.postType = postType;
		this.questionType = questionType;
		this.postNo1 = postNo1;
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

	public Date getDelDate() {
		return delDate;
	}

	public void setDelDate(Date delDate) {
		this.delDate = delDate;
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

	public String getPostNo1() {
		return postNo1;
	}

	public void setPostNo1(String postNo1) {
		this.postNo1 = postNo1;
	}

	@Override
	public String toString() {
		return "Board [postCode=" + postCode + ", userNo=" + userNo + ", postDate=" + postDate + ", postTitle="
				+ postTitle + ", postContents=" + postContents + ", attachments=" + attachments + ", delDate=" + delDate
				+ ", postType=" + postType + ", questionType=" + questionType + ", postNo1=" + postNo1 + "]";
	}



}
