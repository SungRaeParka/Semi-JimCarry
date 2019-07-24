package com.kh.jimcarry.request.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jimcarry.request.model.dao.RequestDao;
import com.kh.jimcarry.request.model.vo.Request;

import static com.kh.jimcarry.common.JDBCTemplate.*;

public class RequestService {
	//전체게시물 수 조회
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

}
