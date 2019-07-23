package com.kh.jimcarry.request.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class RequestDao {
private Properties prop = new Properties();
	
	public RequestDao(){
		String fileName = RequestDao.class.getResource("sql/request/request-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	

	//게시물 수 조회
	public int getListCount(Connection con,int logUserNo) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, logUserNo);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}

}
