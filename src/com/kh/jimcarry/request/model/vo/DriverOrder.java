package com.kh.jimcarry.request.model.vo;

import java.util.Date;

public class DriverOrder implements java.io.Serializable {
	private String driverNo;
	private int orderPrice;
	private Date matchDate;
	private String conditionDo;
	private String reqNo;
	private Date orderDate;
	
	public DriverOrder() {}

	public DriverOrder(String driverNo, int orderPrice, Date matchDate, String conditionDo, String reqNo,
			Date orderDate) {
		super();
		this.driverNo = driverNo;
		this.orderPrice = orderPrice;
		this.matchDate = matchDate;
		this.conditionDo = conditionDo;
		this.reqNo = reqNo;
		this.orderDate = orderDate;
	}

	public String getDriverNo() {
		return driverNo;
	}

	public void setDriverNo(String driverNo) {
		this.driverNo = driverNo;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public Date getMatchDate() {
		return matchDate;
	}

	public void setMatchDate(Date matchDate) {
		this.matchDate = matchDate;
	}

	public String getConditionDo() {
		return conditionDo;
	}

	public void setConditionDo(String conditionDo) {
		this.conditionDo = conditionDo;
	}

	public String getReqNo() {
		return reqNo;
	}

	public void setReqNo(String reqNo) {
		this.reqNo = reqNo;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "DriverOrder [driverNo=" + driverNo + ", orderPrice=" + orderPrice + ", matchDate=" + matchDate
				+ ", conditionDo=" + conditionDo + ", reqNo=" + reqNo + ", orderDate=" + orderDate + "]";
	}
	
	
}
