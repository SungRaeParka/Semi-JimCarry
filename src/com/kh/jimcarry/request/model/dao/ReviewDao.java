package com.kh.jimcarry.request.model.dao;

import static com.kh.jimcarry.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.jimcarry.request.model.vo.Reviews;

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


	public double countGrade(Connection con, String driverNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		double gradeAvg=0;
		
		String query = prop.getProperty("countGrade");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, driverNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				gradeAvg=rset.getInt("AVG(GRADE)");
				System.out.println(gradeAvg);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return gradeAvg;
	}


	public int updateGrade(Connection con, String driverNo, double gradeAvg) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateGrade");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setDouble(1, gradeAvg);
			pstmt.setString(2, driverNo);
			
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
