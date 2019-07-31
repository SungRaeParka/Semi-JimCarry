package com.kh.jimcarry.admin.accounting.model.vo;

public class AccountingPeriod implements java.io.Serializable{
	private String accountDate;
	private int totalPayAmount;
	private int totalFeesIncome;
	private int totalRefundFee;
	private int totalCount;
	private String periodSort;

	public AccountingPeriod() {}

	public AccountingPeriod(String accountDate, int totalPayAmount, int totalFeesIncome, int totalRefundFee,
			int totalCount, String periodSort) {
		super();
		this.accountDate = accountDate;
		this.totalPayAmount = totalPayAmount;
		this.totalFeesIncome = totalFeesIncome;
		this.totalRefundFee = totalRefundFee;
		this.totalCount = totalCount;
		this.periodSort = periodSort;
	}

	public String getAccountDate() {
		return accountDate;
	}

	public void setAccountDate(String accountDate) {
		this.accountDate = accountDate;
	}

	public int getTotalPayAmount() {
		return totalPayAmount;
	}

	public void setTotalPayAmount(int totalPayAmount) {
		this.totalPayAmount = totalPayAmount;
	}

	public int getTotalFeesIncome() {
		return totalFeesIncome;
	}

	public void setTotalFeesIncome(int totalFeesIncome) {
		this.totalFeesIncome = totalFeesIncome;
	}

	public int getTotalRefundFee() {
		return totalRefundFee;
	}

	public void setTotalRefundFee(int totalRefundFee) {
		this.totalRefundFee = totalRefundFee;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public String getPeriodSort() {
		return periodSort;
	}

	public void setPeriodSort(String periodSort) {
		this.periodSort = periodSort;
	}

	@Override
	public String toString() {
		return "AccountingPeriod [accountDate=" + accountDate + ", totalPayAmount=" + totalPayAmount
				+ ", totalFeesIncome=" + totalFeesIncome + ", totalRefundFee=" + totalRefundFee + ", totalCount="
				+ totalCount + ", periodSort=" + periodSort + "]";
	}


}
