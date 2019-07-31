package com.kh.jimcarry.serviceCenter.model.vo;

import java.sql.Date;

public class Attachment {
	private String attachNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String status;
	private int fileLevel;
	private String attachType;
	private String postCode;
	
	public Attachment() {
		super();
	}
	
	public Attachment(String attachNo, String originName, String changeName, String filePath, Date uploadDate,
			String status, int fileLevel, String attachType, String postCode) {
		super();
		this.attachNo = attachNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.status = status;
		this.fileLevel = fileLevel;
		this.attachType = attachType;
		this.postCode = postCode;
	}
	
	public String getAttachNo() {
		return attachNo;
	}
	
	public void setAttachNo(String attachNo) {
		this.attachNo = attachNo;
	}
	
	public String getOriginName() {
		return originName;
	}
	
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	
	public String getChangeName() {
		return changeName;
	}
	
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	
	public String getFilePath() {
		return filePath;
	}
	
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	public Date getUploadDate() {
		return uploadDate;
	}
	
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public int getFileLevel() {
		return fileLevel;
	}
	
	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}
	
	public String getAttachType() {
		return attachType;
	}
	
	public void setAttachType(String attachType) {
		this.attachType = attachType;
	}
	
	public String getPostCode() {
		return postCode;
	}
	
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	
	@Override
	public String toString() {
		return "Attachment [attachNo=" + attachNo + ", originName=" + originName + ", changeName=" + changeName
				+ ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", status=" + status + ", fileLevel="
				+ fileLevel + ", attachType=" + attachType + ", postCode=" + postCode + "]";
	}
	
	
}
