package com.kh.jimcarry.request.model.vo;

import java.util.Arrays;

public class Request implements java.io.Serializable{
	private String[] reqNo;
	private String[] proNo;
	private String[] proName;
	private String[] proType;
	private String[] proSize;
	private String[] proMaterial;
	private String[] proWidth;
	private String[] proHeight;
	private String[] glassCheck;
	private String[] uniquness;
	private String[] proKind;
	private int bookCount;
	private int boxCount;
	
	public Request() {}

	public Request(String[] reqNo, String[] proNo, String[] proName, String[] proType, String[] proSize,
			String[] proMaterial, String[] proWidth, String[] proHeight, String[] glassCheck, String[] uniquness,
			String[] proKind, int bookCount, int boxCount) {
		super();
		this.reqNo = reqNo;
		this.proNo = proNo;
		this.proName = proName;
		this.proType = proType;
		this.proSize = proSize;
		this.proMaterial = proMaterial;
		this.proWidth = proWidth;
		this.proHeight = proHeight;
		this.glassCheck = glassCheck;
		this.uniquness = uniquness;
		this.proKind = proKind;
		this.bookCount = bookCount;
		this.boxCount = boxCount;
	}

	public String[] getReqNo() {
		return reqNo;
	}

	public void setReqNo(String[] reqNo) {
		this.reqNo = reqNo;
	}

	public String[] getProNo() {
		return proNo;
	}

	public void setProNo(String[] proNo) {
		this.proNo = proNo;
	}

	public String[] getProName() {
		return proName;
	}

	public void setProName(String[] proName) {
		this.proName = proName;
	}

	public String[] getProType() {
		return proType;
	}

	public void setProType(String[] proType) {
		this.proType = proType;
	}

	public String[] getProSize() {
		return proSize;
	}

	public void setProSize(String[] proSize) {
		this.proSize = proSize;
	}

	public String[] getProMaterial() {
		return proMaterial;
	}

	public void setProMaterial(String[] proMaterial) {
		this.proMaterial = proMaterial;
	}

	public String[] getProWidth() {
		return proWidth;
	}

	public void setProWidth(String[] proWidth) {
		this.proWidth = proWidth;
	}

	public String[] getProHeight() {
		return proHeight;
	}

	public void setProHeight(String[] proHeight) {
		this.proHeight = proHeight;
	}

	public String[] getGlassCheck() {
		return glassCheck;
	}

	public void setGlassCheck(String[] glassCheck) {
		this.glassCheck = glassCheck;
	}

	public String[] getUniquness() {
		return uniquness;
	}

	public void setUniquness(String[] uniquness) {
		this.uniquness = uniquness;
	}

	public String[] getProKind() {
		return proKind;
	}

	public void setProKind(String[] proKind) {
		this.proKind = proKind;
	}

	public int getBookCount() {
		return bookCount;
	}

	public void setBookCount(int bookCount) {
		this.bookCount = bookCount;
	}

	public int getBoxCount() {
		return boxCount;
	}

	public void setBoxCount(int boxCount) {
		this.boxCount = boxCount;
	}

	@Override
	public String toString() {
		return "Request [reqNo=" + Arrays.toString(reqNo) + ", proNo=" + Arrays.toString(proNo) + ", proName="
				+ Arrays.toString(proName) + ", proType=" + Arrays.toString(proType) + ", proSize="
				+ Arrays.toString(proSize) + ", proMaterial=" + Arrays.toString(proMaterial) + ", proWidth="
				+ Arrays.toString(proWidth) + ", proHeight=" + Arrays.toString(proHeight) + ", glassCheck="
				+ Arrays.toString(glassCheck) + ", uniquness=" + Arrays.toString(uniquness) + ", proKind="
				+ Arrays.toString(proKind) + ", bookCount=" + bookCount + ", boxCount=" + boxCount + "]";
	}
}
