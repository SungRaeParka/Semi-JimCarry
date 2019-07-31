package com.kh.jimcarry.request.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import static com.kh.jimcarry.common.JDBCTemplate.*;

public class DriverOrderDao {
	private Properties prop = new Properties();

	public DriverOrderDao() {
		String fileName = ProductDao.class.getResource("/sql/request/driverOrder-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int insertDriverOrder(Connection con, int price, String priceReqNo, String driverNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertDriverOrder");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, driverNo);
			pstmt.setInt(2, price);
			pstmt.setString(3, priceReqNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}
