package com.kh.jimcarry.request.model.vo;

import java.io.Serializable;

public class Member implements Serializable{
	private String mno;
	private String mid;
	private String mpwd;
	private String mname;
	private String mphone;
	
	
	public Member() {}
	
	public Member(String mno, String mid, String mpwd, String mname, String mphone) {
		super();
		this.mno = mno;
		this.mid = mid;
		this.mpwd = mpwd;
		this.mname = mname;
		this.mphone = mphone;
	}

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpwd() {
		return mpwd;
	}

	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMphone() {
		return mphone;
	}

	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	
	

}
