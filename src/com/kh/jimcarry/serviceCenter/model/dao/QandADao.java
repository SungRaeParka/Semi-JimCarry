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

import com.kh.jimcarry.serviceCenter.model.vo.QandA;

import static com.kh.jimcarry.common.JDBCTemplate.*;

public class QandADao {
	private Properties prop = new Properties();
	
	public QandADao() {
		String fileName=
				QandADao.class.getResource("/sql/Notice/qanda-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
	}catch (IOException e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	}
	public ArrayList<QandA> selectList(Connection con) {
		// TODO Auto-generated method stub
		ArrayList<QandA> list1 = null;
		Statement stmt = null;
		ResultSet rset=null;
		
		String query = prop.getProperty("list");
		
		try {
			stmt=con.createStatement();
			rset=stmt.executeQuery(query);
			
			list1=new ArrayList<QandA>();
			
			while (rset.next()) {
				//POST_TYPE, POST_TITLE, POST_CONTENT, QUESTION_TYPE
				QandA qa = new QandA();
				
				qa.setPostType(rset.getString("POST_TYPE"));
				qa.setPostTitle(rset.getString("POST_TITLE"));
				qa.setPostContent(rset.getString("POST_CONTENTS"));
				qa.setQuestionType(rset.getString("QUESTION_TYPE"));
				
				list1.add(qa);
					
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list1;
	}
	/*//상세보기용
	public QandA selectOneQA(Connection con, int num) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		QandA qa =null;
		
		String query = prop.getProperty("selectOneqa");
		
		
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			
			
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				qa=new QandA();
				
				qa.setPostType(rset.getString("POST_TYPE"));
				qa.setPostTitle(rset.getString("POST_TITLE"));
				qa.setPostContent(rset.getString("POST_CONTENTS"));
				qa.setQuestionType(rset.getString("QUESTION_TYPE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(con);
		}
		return qa;
	}
	//조회수 증가
	public int updateCountQA(Connection con, int num) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}*/
	public int getListCount(Connection con) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int listCount1 = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectListCount");
		try {
			pstmt =con.prepareStatement(query);
			
			pstmt.setString(1,"Q&A");
			
			rset=pstmt.executeQuery();
			
			System.out.println("들어감?? : "+rset);
			
			if (rset.next()) {
				listCount1=rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return listCount1;
	}
	public ArrayList<QandA> selectList(Connection con, int currentPage1, int limit1) {
		// TODO Auto-generated method stub
		
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		ArrayList<QandA> list1= null;
		
		String query =prop.getProperty("selectListWithPaging");
		
		try {
			pstmt=con.prepareStatement(query);
			
			System.out.println("query : "+query);
			
			int startRow = (currentPage1 - 1) * limit1 + 1;
			int endRow=startRow + limit1 -1;
			
			pstmt.setString(1,"Q&A");
			pstmt.setString(2,"결제/진행");
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset=pstmt.executeQuery();
			
			list1= new ArrayList<QandA>();
			
			while(rset.next()) {
					QandA qa = new QandA();

					qa.setPostcode(rset.getString("POST_CODE"));
					qa.setUserNo(rset.getString("MEMBER_NO"));
					qa.setPostDate(rset.getDate("POST_DATE"));
					qa.setPostTitle(rset.getString("POST_TITLE"));
					qa.setPostContent(rset.getString("POST_CONTENTS"));
					qa.setPostType(rset.getString("POST_TYPE"));
					qa.setQuestionType(rset.getString("QUESTION_TYPE"));
					qa.setPostNo(rset.getInt("POST_NO"));
					qa.setBCount(rset.getInt("B_COUNT"));
					
					list1.add(qa);
					
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list1;
	}

}
