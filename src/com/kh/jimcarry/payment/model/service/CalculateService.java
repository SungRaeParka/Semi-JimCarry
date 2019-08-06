package com.kh.jimcarry.payment.model.service;

import static com.kh.jimcarry.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.jimcarry.payment.model.dao.CalculateDao;

public class CalculateService {

	public int insertCal(String driverNo, int price, String calNo) {
		Connection con = getConnection();
		
		int result = new CalculateDao().insertCal(con,driverNo,price,calNo);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}

}
