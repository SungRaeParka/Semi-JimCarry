package com.kh.jimcarry.admin.statistics.model.vo;

public class StatisticsSales {
	private String period;
	private int profit;
	private int sales;
	private String periodResult;

	public StatisticsSales() {}

	public StatisticsSales(String period, int profit, int sales, String periodResult) {
		super();
		this.period = period;
		this.profit = profit;
		this.sales = sales;
		this.periodResult = periodResult;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public int getProfit() {
		return profit;
	}

	public void setProfit(int profit) {
		this.profit = profit;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public String getPeriodResult() {
		return periodResult;
	}

	public void setPeriodResult(String periodResult) {
		this.periodResult = periodResult;
	}

	@Override
	public String toString() {
		return "StatisticsSales [period=" + period + ", profit=" + profit + ", sales=" + sales + ", periodResult="
				+ periodResult + "]";
	}


}
