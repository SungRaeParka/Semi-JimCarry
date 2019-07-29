package com.kh.jimcarry.serviceCenter.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jimcarry.serviceCenter.model.vo.Notice;
import com.kh.jimcarry.serviceCenter.model.vo.OneQ;

import static com.kh.jimcarry.common.JDBCTemplate.*;

public class OneQDao {
	private Properties prop = new Properties();
	
	public OneQDao() {
		String fileName=
				OneQDao.class.getResource("/sql/Notice/OneQ-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<OneQ> selectList(Connection con) {
		// TODO Auto-generated method stub
		ArrayList<OneQ> list2 = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("listOne");
		
		try {
			stmt=con.createStatement();
			rset=stmt.executeQuery(query);
			
			list2=new ArrayList<OneQ>();
			
			while(rset.next()) {
				
			OneQ one = new OneQ();	
			
			one.setQuestionType(rset.getString("QUESTION_TYPE"));
			one.setPostTitle(rset.getString("POST_TITLE"));
			one.setPostContent(rset.getString("POST_CONTENT"));
			//one.setPostDate(rset.getDate("POST_DATE"));
			
			list2.add(one);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return list2;
	}
	//1:1문의 등록용 메소드
	public int insertOneQ(Connection con, OneQ one) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertOneQ");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, one.getQuestionType());
			pstmt.setString(2, one.getPostTitle());
			pstmt.setString(3, one.getPostContent());
			//pstmt.setDate(4, one.getPostDate());
			
			result = pstmt.executeUpdate();
			
			System.out.println("a :"+result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public OneQ selectQ(Connection con, int num) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		OneQ one =null;
		
		String query=prop.getProperty("selectOne");
		
		
		
		
		
		
		
		
		
		return one;
	}

	public int updateCountQ(Connection con, int num) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		
		
		
		
		
		
		
		
		return result;
	}

}
