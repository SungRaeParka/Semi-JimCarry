package com.kh.jimcarry.request.model.service;

import static com.kh.jimcarry.common.JDBCTemplate.close;
import static com.kh.jimcarry.common.JDBCTemplate.commit;
import static com.kh.jimcarry.common.JDBCTemplate.getConnection;
import static com.kh.jimcarry.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.jimcarry.request.model.dao.RequestDao;
import com.kh.jimcarry.request.model.vo.Request;

public class RequestService {

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
	
}
