package com.kh.jimcarry.request.model.service;

import static com.kh.jimcarry.common.JDBCTemplate.close;
import static com.kh.jimcarry.common.JDBCTemplate.commit;
import static com.kh.jimcarry.common.JDBCTemplate.getConnection;
import static com.kh.jimcarry.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jimcarry.request.model.dao.RequestDao;
import com.kh.jimcarry.request.model.vo.Request;

public class RequestService {
	
	/*public Request insertRequest(String proName) {
		Connection con = getConnection();
		
		Request r = new RequestDao().insertRequest(con, proName);
		
		if(r != null) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return r;
	}*/

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

	public ArrayList<Request> selectProInfo() {
		Connection con = getConnection();
		
		ArrayList<Request> list = new RequestDao().selectProInfo(con);
		
		close(con);
		
		return list;
	}

	

	
}
