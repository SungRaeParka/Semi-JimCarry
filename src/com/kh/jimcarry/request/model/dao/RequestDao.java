package com.kh.jimcarry.request.model.dao;

import static com.kh.jimcarry.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.jimcarry.request.model.vo.Request;

public class RequestDao {
	private Properties prop = new Properties();
	
	public RequestDao() {
		String fileName = RequestDao.class.getResource("/sql/request/request-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertRequest(Connection con, Request r) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		System.out.println("r.getProName().length : " + r.getProName().length);
		
		for(int i = 0; i < r.getProName().length; i++) {			
			if(i == 0) {
				String query = prop.getProperty("insertRequest");	
				
				try {
					pstmt = con.prepareStatement(query);	
					
					pstmt.setString(1, r.getProName()[i]);				
					
					result = pstmt.executeUpdate();						
					
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(pstmt);
				}				
			}else if(i > 0) {
				String query = prop.getProperty("insertRequest2");	
				
				try {
					pstmt = con.prepareStatement(query);	
					
					pstmt.setString(1, r.getProName()[i]);
					
					result = pstmt.executeUpdate();					
					
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(pstmt);
				}
			}						
		}		
		return result;
	}
	
}	
