package com.kh.jimcarry.request.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jimcarry.request.model.dao.RequestDao;
import com.kh.jimcarry.request.model.vo.Request;
import com.kh.jimcarry.request.model.vo.RequestAttachment;

import static com.kh.jimcarry.common.JDBCTemplate.*;

public class RequestService {
			//전체게시물 수 조회_사용자
			public int getListCount(String logUserNo) {
				Connection con = getConnection();
				
				int listCount = new RequestDao().getListCount(con,logUserNo); 
				
				close(con);
				
				return listCount;
				
			}

			
			//리스트 전체조회
			public ArrayList<Request> selectList(int currentPage, int limit, String logUserNo) {
				Connection con = getConnection();
				
				ArrayList<Request> list = new RequestDao().selectList(con,currentPage,limit,logUserNo);
				
				close(con);
				
				return list;
				
				
			}


			

			//리스트 전체조회_기사님
			public ArrayList<Request> selectDriverList(int currentPage, int limit, String logUserNo) {
				Connection con = getConnection();
				
				ArrayList<Request> list = new RequestDao().selectDriverList(con,currentPage,limit,logUserNo);
				
				close(con);
				
				return list;
				
				
			}


			public Request checkReq(String no) {
				Connection con = getConnection();
				Request r = null;
				
				r = new RequestDao().checkReq(con,no);
				
				
				
				return r;
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



			
}
