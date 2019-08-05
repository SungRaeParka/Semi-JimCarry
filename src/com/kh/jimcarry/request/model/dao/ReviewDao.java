package com.kh.jimcarry.request.model.dao;

import java.io.FileReader;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.jimcarry.request.model.vo.Reviews;
import static com.kh.jimcarry.common.JDBCTemplate.*;

public class ReviewDao {
	private Properties prop = new Properties();
	
	public ReviewDao() {
		String fileName = ReviewDao.class.getResource("/sql/request/reviews-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int insertReviews(Connection con, Reviews rev) {
		PreparedStatement pstmt = null;
		int result=0;
		
		String query = prop.getProperty("insertReviews");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, rev.getUserNo());
			pstmt.setString(2, rev.getDriverNo());
			pstmt.setInt(3, rev.getGrade());
			pstmt.setString(4, rev.getReview());
			pstmt.setString(5, rev.getReqNo());
			
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
