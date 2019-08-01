package com.kh.jimcarry.request.model.service;

import static com.kh.jimcarry.common.JDBCTemplate.close;
import static com.kh.jimcarry.common.JDBCTemplate.commit;
import static com.kh.jimcarry.common.JDBCTemplate.getConnection;
import static com.kh.jimcarry.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.jimcarry.request.model.dao.RequestDao;
import com.kh.jimcarry.request.model.vo.Request;
import com.kh.jimcarry.request.model.vo.RequestAttachment;
import com.kh.jimcarry.request.model.vo.ShowRP;

public class RequestService { 
			//전체게시물 수 조회_사용자,기사님
			public int getListCount(String logUserNo) {
				Connection con = getConnection();
				
				int listCount = new RequestDao().getListCount(con,logUserNo); 
				
				close(con);
				
				return listCount;
				
			}

			
			//짐캐리리스트 전체조회_사용자
			public ArrayList<Request> selectList(int currentPage, int limit, String logUserNo) {
				Connection con = getConnection();
				
				ArrayList<Request> list = new RequestDao().selectList(con,currentPage,limit,logUserNo);
				
				close(con);
				
				return list;
				
				
			}


			//짐캐리리스트 전체조회_기사님
			public ArrayList<Request> selectDriverList(int currentPage, int limit, String logUserNo) {
				Connection con = getConnection();
				
				ArrayList<Request> list = new RequestDao().selectDriverList(con,currentPage,limit,logUserNo);
				
				close(con);
				
				return list;
				
				
			}
			
			
			//입찰내역 리스트
			public HashMap<String, Request> selectOrderList(String logUserNo) {
				Connection con = getConnection();
				
				HashMap<String, Request> orderMap = new RequestDao().selectOrderList(con,logUserNo);
				
				close(con);
				
				return orderMap;
			}

			//입찰내역 확인
			public ArrayList<Request> checkOrder(String no) {
				Connection con = getConnection();
				ArrayList<Request> rolist = null;
				
				rolist = new RequestDao().checkOrder(con,no);
				
				close(con);
				
				return rolist;
			}
			
			
			
			//가격 최저가 가져오기
			public int minPriceCal(String no) {
				Connection con = getConnection();
				
				int minPrice = new RequestDao().minPriceCal(con,no);
				
				close(con);
				
				return minPrice;
			}


			public Request makePayInfo(String reqNo, String roNo) {
				Connection con = getConnection();
				
				Request payInfo = new RequestDao().makePayInfo(con,reqNo,roNo);
				
				close(con);
				
				return payInfo;
			}


			

			public int insertRequest(Request r) {
				Connection con = getConnection();
				
				int result = new RequestDao().insertRequest(con, r);
				
				if(result > 0) {
					commit(con);
				}else {
					rollback(con);
				}
				
				close(con);
				
				return result;
			}
			
		
			


			public int insertPIMG(ArrayList<RequestAttachment> fileList, String reqNo, String proNo) {
				Connection con = getConnection();	
				
				int result = new RequestDao().insertPIMG(con, fileList, reqNo, proNo);			
				
				if(result > 0) {
					commit(con);
				}else {
					rollback(con);
				}
				
				close(con);
				
				return result;
			}
  
			public ShowRP selectRequestInfo(String reqNo) {
				Connection con = getConnection();
				
				ShowRP requestInfo = new RequestDao().selectRequestInfo(con, reqNo);
				
				close(con);
				
				return requestInfo;
			}


			public ArrayList<HashMap<String, Object>> selectRequestImg(String reqNo) {
				Connection con = getConnection();
				
				ArrayList<HashMap<String, Object>> requestImg = new RequestDao().selectRequestImg(con, reqNo);
				
				close(con);
				
				return requestImg;
			}


			public ArrayList<HashMap<String, Object>> selectProductInfo(String reqNo) {
				Connection con = getConnection();
				
				ArrayList<HashMap<String, Object>> requestInfo = new RequestDao().selectProductInFo(con, reqNo);
				
				close(con);
				
				return requestInfo;
			}


			public ShowRP selectRequestInfo2(String reqNo) {
				Connection con = getConnection();
				
				ShowRP requestInfo = new RequestDao().selectRequestInfo2(con, reqNo);
				
				close(con);
				
				return requestInfo;
			}

			
			public ArrayList<HashMap<String, Object>> selectRequestImg2(String reqNo) {
				Connection con = getConnection();
				
				ArrayList<HashMap<String, Object>> requestImg = new RequestDao().selectRequestImg2(con, reqNo);
				
				close(con);
				
				return requestImg;
			}

			public ArrayList<HashMap<String, Object>> selectProductInfo2(String reqNo) {
				Connection con = getConnection();
				
				ArrayList<HashMap<String, Object>> requestInfo = new RequestDao().selectProductInFo2(con, reqNo);
				
				close(con);
				
				return requestInfo;
			}


			public ArrayList<HashMap<String, Object>> selectreqNoList() {
				Connection con = getConnection();
				
				ArrayList<HashMap<String, Object>> tempReqNoList = new RequestDao().selectreqNoList(con);
				
				close(con);
				
				return tempReqNoList;
			}


			public ArrayList<HashMap<String, Object>> selectReqList(ArrayList<HashMap<String, Object>> reqNoList) {
				Connection con = getConnection();
				
				ArrayList<HashMap<String, Object>> reqList = new RequestDao().selectReqList(con, reqNoList);
				
				close(con);
				
				return reqList;
			}


			public ShowRP selectRequestInfo3(String reqNo) {
				Connection con = getConnection();
				
				ShowRP requestInfo = new RequestDao().selectRequestInfo3(con, reqNo);
				
				close(con);
				
				return requestInfo;
			}


			public ArrayList<HashMap<String, Object>> selectRequestImg3(String reqNo) {
				Connection con = getConnection();
				
				ArrayList<HashMap<String, Object>> requestImg = new RequestDao().selectRequestImg3(con, reqNo);
				
				close(con);
				
				return requestImg;
			}


			public ArrayList<HashMap<String, Object>> selectProductInfo3(String reqNo) {
				Connection con = getConnection();
				
				ArrayList<HashMap<String, Object>> requestInfo = new RequestDao().selectProductInFo3(con, reqNo);
				
				close(con);
				
				return requestInfo;
			}




			
}
