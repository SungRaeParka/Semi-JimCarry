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
	//상세보기용
	public QandA selectOneQA(Connection con, int num) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		QandA qa =null;
		
		String query = prop.getProperty("selectOneqa");
		
		try {
			pstmt=con.prepareStatement(query);
			
			
			
			
			
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
		return 0;
	}

}
