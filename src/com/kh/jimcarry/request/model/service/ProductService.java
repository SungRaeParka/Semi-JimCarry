package com.kh.jimcarry.request.model.service;

import static com.kh.jimcarry.common.JDBCTemplate.close;
import static com.kh.jimcarry.common.JDBCTemplate.commit;
import static com.kh.jimcarry.common.JDBCTemplate.getConnection;
import static com.kh.jimcarry.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jimcarry.request.model.dao.ProductDao;
import com.kh.jimcarry.request.model.vo.Product;

public class ProductService {	

	public int insertRequest(Product r) {
		Connection con = getConnection();
		
		int result = new ProductDao().insertRequest(con, r);
		
		if(result > 0) {
			commit(con);
			//String reqNo = new ProductDao().selectReqNo(con);
			//String proNo = new ProductDao().selectProNo(con, reqNo);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	/*public ArrayList<Product> selectProInfo() {
		Connection con = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectProInfo(con);
		
		close(con);
		
		return list;
	}*/

	public String selectReqNo() {		
		Connection con = getConnection();
		
		String reqNo = new ProductDao().selectReqNo(con);
		
		close(con);
		
		return reqNo;
	}

	public String selectProNo(String reqNo) {
		Connection con = getConnection();
		
		String proNo = new ProductDao().selectProNo(con, reqNo);
		
		close(con);
		
		return proNo;
	}
	
	/*public String selectProName(String reqNo, String proNo) {
		Connection con = getConnection();
		
		String proName = new ProductDao().selectProName(con, reqNo, proNo);
		
		close(con);
		
		return proName;
	}*/

	public int updateRef(Product p) { 
		Connection con = getConnection();
		
		String refProNo = new ProductDao().selectRefProNo(con, p);
		
		System.out.println("Service refProNo :::" + refProNo);
		
		int result = new ProductDao().updateRef(con, p, refProNo);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}




	

	
}
