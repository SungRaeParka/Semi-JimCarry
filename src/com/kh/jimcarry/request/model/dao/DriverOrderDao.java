package com.kh.jimcarry.request.model.dao;

import static com.kh.jimcarry.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

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
	
	public int selectReqCount(Connection con, String priceReqNo) {		
		int reqCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;		
		
		String query = prop.getProperty("selectReqCount");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, priceReqNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				reqCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return reqCount;
	}
	
	public int updateReqCount(Connection con, String priceReqNo, int reqCount) {
		int result2 = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("updateReqCount");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, reqCount+1);
			pstmt.setString(2, priceReqNo);
			
			result2 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result2;
	}
	
}
