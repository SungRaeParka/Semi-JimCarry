package com.kh.jimcarry.request.model.service;

import static com.kh.jimcarry.common.JDBCTemplate.close;

public class RequestService {
	//전체게시물 수 조회
		public int getListCount(int logUserNo) {
			Connection con = getConnection();
			
			int listCount = new RequestDao().getListCount(con,logUserNo);
			
			close(con);
			
			return listCount;
			
			
			
		}

}
