package com.kh.jimcarry.payment.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import static com.kh.jimcarry.common.JDBCTemplate.*;

public class CalculateDao {
	
	private Properties prop = new Properties();
	
	public CalculateDao() {
		String fileName = CalculateDao.class.getResource("/sql/payment/calculate-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int insertCal(Connection con, String driverNo, int price, String calNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCal");
		
		try {
			
			int pay = (int)(price*0.9);
			int fees = price-pay;
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, price);
			pstmt.setInt(2, pay);
			pstmt.setInt(3, fees);
			pstmt.setString(4, driverNo);
			pstmt.setString(5, calNo);
			System.out.println(calNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		return result;
	}

}
