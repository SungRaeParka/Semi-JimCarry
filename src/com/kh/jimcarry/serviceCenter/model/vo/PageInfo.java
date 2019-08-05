package com.kh.jimcarry.serviceCenter.model.vo;

public class PageInfo implements java.io.Serializable{
	
	private int currentPage;
	private int currentPage1;
	private int currentPage2;
	private int currentPage3;
	private int listCount;
	private int listCount1;
	private int listCount2;
	private int listCount3;
	private int limit;
	private int limit1;
	private int limit2;
	private int limit3;
	private int maxPage;
	private int maxPage1;
	private int maxPage2;
	private int maxPage3;
	private int startPage;
	private int startPage1;
	private int startPage2;
	private int startPage3;
	private int endPage;
	private int endPage1;
	private int endPage2;
	private int endPage3;
	
	public PageInfo() {}
	
	

	public PageInfo(int currentPage, int listCount, int limit, int maxPage, int startPage, int endPage) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.limit = limit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}



	public PageInfo(int currentPage, int currentPage1, int currentPage2, int currentPage3, int listCount,
			int listCount1, int listCount2, int listCount3, int limit, int limit1, int limit2, int limit3, int maxPage,
			int maxPage1, int maxPage2, int maxPage3, int startPage, int startPage1, int startPage2, int startPage3,
			int endPage, int endPage1, int endPage2, int endPage3) {
		super();
		this.currentPage = currentPage;
		this.currentPage1 = currentPage1;
		this.currentPage2 = currentPage2;
		this.currentPage3 = currentPage3;
		this.listCount = listCount;
		this.listCount1 = listCount1;
		this.listCount2 = listCount2;
		this.listCount3 = listCount3;
		this.limit = limit;
		this.limit1 = limit1;
		this.limit2 = limit2;
		this.limit3 = limit3;
		this.maxPage = maxPage;
		this.maxPage1 = maxPage1;
		this.maxPage2 = maxPage2;
		this.maxPage3 = maxPage3;
		this.startPage = startPage;
		this.startPage1 = startPage1;
		this.startPage2 = startPage2;
		this.startPage3 = startPage3;
		this.endPage = endPage;
		this.endPage1 = endPage1;
		this.endPage2 = endPage2;
		this.endPage3 = endPage3;
	}



	public int getCurrentPage() {
		return currentPage;
	}



	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}



	public int getCurrentPage1() {
		return currentPage1;
	}



	public void setCurrentPage1(int currentPage1) {
		this.currentPage1 = currentPage1;
	}



	public int getCurrentPage2() {
		return currentPage2;
	}



	public void setCurrentPage2(int currentPage2) {
		this.currentPage2 = currentPage2;
	}



	public int getCurrentPage3() {
		return currentPage3;
	}



	public void setCurrentPage3(int currentPage3) {
		this.currentPage3 = currentPage3;
	}



	public int getListCount() {
		return listCount;
	}



	public void setListCount(int listCount) {
		this.listCount = listCount;
	}



	public int getListCount1() {
		return listCount1;
	}



	public void setListCount1(int listCount1) {
		this.listCount1 = listCount1;
	}



	public int getListCount2() {
		return listCount2;
	}



	public void setListCount2(int listCount2) {
		this.listCount2 = listCount2;
	}



	public int getListCount3() {
		return listCount3;
	}



	public void setListCount3(int listCount3) {
		this.listCount3 = listCount3;
	}



	public int getLimit() {
		return limit;
	}



	public void setLimit(int limit) {
		this.limit = limit;
	}



	public int getLimit1() {
		return limit1;
	}



	public void setLimit1(int limit1) {
		this.limit1 = limit1;
	}



	public int getLimit2() {
		return limit2;
	}



	public void setLimit2(int limit2) {
		this.limit2 = limit2;
	}



	public int getLimit3() {
		return limit3;
	}



	public void setLimit3(int limit3) {
		this.limit3 = limit3;
	}



	public int getMaxPage() {
		return maxPage;
	}



	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}



	public int getMaxPage1() {
		return maxPage1;
	}



	public void setMaxPage1(int maxPage1) {
		this.maxPage1 = maxPage1;
	}



	public int getMaxPage2() {
		return maxPage2;
	}



	public void setMaxPage2(int maxPage2) {
		this.maxPage2 = maxPage2;
	}



	public int getMaxPage3() {
		return maxPage3;
	}



	public void setMaxPage3(int maxPage3) {
		this.maxPage3 = maxPage3;
	}



	public int getStartPage() {
		return startPage;
	}



	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}



	public int getStartPage1() {
		return startPage1;
	}



	public void setStartPage1(int startPage1) {
		this.startPage1 = startPage1;
	}



	public int getStartPage2() {
		return startPage2;
	}



	public void setStartPage2(int startPage2) {
		this.startPage2 = startPage2;
	}



	public int getStartPage3() {
		return startPage3;
	}



	public void setStartPage3(int startPage3) {
		this.startPage3 = startPage3;
	}



	public int getEndPage() {
		return endPage;
	}



	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}



	public int getEndPage1() {
		return endPage1;
	}



	public void setEndPage1(int endPage1) {
		this.endPage1 = endPage1;
	}



	public int getEndPage2() {
		return endPage2;
	}



	public void setEndPage2(int endPage2) {
		this.endPage2 = endPage2;
	}



	public int getEndPage3() {
		return endPage3;
	}



	public void setEndPage3(int endPage3) {
		this.endPage3 = endPage3;
	}



	@Override
	public String toString() {
		return "PageInfo [currentPage=" + currentPage + ", currentPage1=" + currentPage1 + ", currentPage2="
				+ currentPage2 + ", currentPage3=" + currentPage3 + ", listCount=" + listCount + ", listCount1="
				+ listCount1 + ", listCount2=" + listCount2 + ", listCount3=" + listCount3 + ", limit=" + limit
				+ ", limit1=" + limit1 + ", limit2=" + limit2 + ", limit3=" + limit3 + ", maxPage=" + maxPage
				+ ", maxPage1=" + maxPage1 + ", maxPage2=" + maxPage2 + ", maxPage3=" + maxPage3 + ", startPage="
				+ startPage + ", startPage1=" + startPage1 + ", startPage2=" + startPage2 + ", startPage3=" + startPage3
				+ ", endPage=" + endPage + ", endPage1=" + endPage1 + ", endPage2=" + endPage2 + ", endPage3="
				+ endPage3 + "]";
	}




	
}
