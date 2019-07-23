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
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<Product> selectProInfo() {
		Connection con = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectProInfo(con);
		
		close(con);
		
		return list;
	}

	

	
}
