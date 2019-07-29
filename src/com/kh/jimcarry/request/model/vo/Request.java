package com.kh.jimcarry.request.model.vo;

import java.io.Serializable;
import java.util.Date;

public class Request implements Serializable{
	
	private Date reservationDate;
	private String startPoint;
	private String arrivalPoint;
	private Date reqStart;
	private Date reqFinish;
	private String userNo;
	private String reqNo;
	private String proNo;
	private int reqCount;
	private String conditionReq;
	private String memo;
	
	private String driverNo;
	private int orderPrice;
	private Date orderDate;
	private Date matchDate;

	private String conditionDo;	
	
	private int reqCount;

	private String userName;
	private String driverName;
	private String grade;
	private String review;
	
	public Request() {}	

}
