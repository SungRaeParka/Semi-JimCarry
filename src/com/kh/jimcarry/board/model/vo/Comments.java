package com.kh.jimcarry.board.model.vo;

import java.sql.Date;

public class Comments implements java.io.Serializable {
	private String commentCode;
	private String postCode;
	private String userNo;
	private Date commentDate;
	private String commentContents;
	private String writer;

	public Comments() {

	}

	public Comments(String commentCode, String postCode, String userNo, Date commentDate, String commentContents,
			String writer) {
		super();
		this.commentCode = commentCode;
		this.postCode = postCode;
		this.userNo = userNo;
		this.commentDate = commentDate;
		this.commentContents = commentContents;
		this.writer = writer;
	}

	public String getCommentCode() {
		return commentCode;
	}

	public void setCommentCode(String commentCode) {
		this.commentCode = commentCode;
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

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public String getCommentContents() {
		return commentContents;
	}

	public void setCommentContents(String commentContents) {
		this.commentContents = commentContents;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	@Override
	public String toString() {
		return "Comments [commentCode=" + commentCode + ", postCode=" + postCode + ", userNo=" + userNo
				+ ", commentDate=" + commentDate + ", commentContents=" + commentContents + ", writer=" + writer + "]";
	}



}
