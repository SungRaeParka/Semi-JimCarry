package com.kh.jimcarry.request.model.service;

import static com.kh.jimcarry.common.JDBCTemplate.close;
import static com.kh.jimcarry.common.JDBCTemplate.commit;
import static com.kh.jimcarry.common.JDBCTemplate.getConnection;
import static com.kh.jimcarry.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.jimcarry.request.model.dao.DriverOrderDao;
public class DriverOrderService {

	public int insertDriverOrder(int price, String priceReqNo, String driverNo) {
		Connection con = getConnection();
		int result = new DriverOrderDao().insertDriverOrder(con, price, priceReqNo, driverNo);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
}
