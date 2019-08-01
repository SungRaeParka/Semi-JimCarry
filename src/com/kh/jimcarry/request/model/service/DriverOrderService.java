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
		
		int result2 = 0;
		
		if(result > 0) {
			commit(con);
			 int reqCount = new DriverOrderDao().selectReqCount(con, priceReqNo);
			 result2= new DriverOrderDao().updateReqCount(con, priceReqNo, reqCount);
			if(result2 > 0) {
				
			}
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result2;
	}
	
}
