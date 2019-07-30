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

import static com.kh.jimcarry.common.JDBCTemplate.close;

public class NoticeDao {
	private Properties prop = new Properties();
	
	public NoticeDao() {
	String fileName = 
			NoticeDao.class.getResource("/sql/Notice/notice-query.properties").getPath();
	
	try {
		prop.load(new FileReader(fileName));
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}
//공지사항 전체 조회용 메소드
	public ArrayList<Notice> selectList(Connection con) {
		// TODO Auto-generated method stub
		ArrayList<Notice> list = null;
		Statement stmt = null;
		ResultSet rset= null;
		
		String query = prop.getProperty("selectlist");
		
		try {
			stmt=con.createStatement();
			rset=stmt.executeQuery(query);
			
			list = new ArrayList<Notice>();
			
			while (rset.next()) {
				Notice n = new Notice();
				// POST_TYPE, POST_NO,B_COUNT
				n.setUserNo(rset.getString("USER_NO"));
				n.setPostdate(rset.getDate("POST_DATE"));
				n.setPostTitle(rset.getString("POST_TITLE"));
				n.setPostContent(rset.getString("POST_CONTENTS"));
				n.setPostType(rset.getString("POST_TYPE"));
				n.setPostNo(rset.getInt("POST_NO"));
				n.setbCount(rset.getInt("B_COUNT"));
				
				list.add(n);
					
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return list;
	}
	//상세보기용
	public Notice selectOne(Connection con, int num) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n =null;
		
		String query=prop.getProperty("selectOne");
		
		try{
		pstmt=con.prepareStatement(query);
		pstmt.setInt(1,num);
		
		rset= pstmt.executeQuery();
		
		if(rset.next()){
			n=new Notice();

			n.setPostcode(rset.getString("POST_CODE"));
			n.setUserNo(rset.getString("MEMBER_NO"));
			n.setPostdate(rset.getDate("POST_DATE"));
			n.setPostTitle(rset.getString("POST_TITLE"));
			n.setPostContent(rset.getString("POST_CONTENTS"));
			n.setPostType(rset.getString("POST_TYPE"));
			n.setPostNo(rset.getInt("POST_NO"));
			n.setbCount(rset.getInt("B_COUNT"));
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return n;
	}
	//조회수 증가
	public int updateCount(Connection con, int num) {
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
	}
	public ArrayList<Notice> selectList(Connection con, int currentPage, int limit) {
		// TODO Auto-generated method stub
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = null;
		
		String query = prop.getProperty("selectListWithPaging");
		
		try {
			pstmt=con.prepareStatement(query);
			
			System.out.println("query : "+query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow=startRow + limit -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset=pstmt.executeQuery();
			
			list= new ArrayList<Notice>();
			
			while(rset.next()) {
					Notice n=new Notice();

					n.setPostcode(rset.getString("POST_CODE"));
					n.setUserNo(rset.getString("MEMBER_NO"));
					n.setPostdate(rset.getDate("POST_DATE"));
					n.setPostTitle(rset.getString("POST_TITLE"));
					n.setPostContent(rset.getString("POST_CONTENTS"));
					n.setPostType(rset.getString("POST_TYPE"));
					n.setPostNo(rset.getInt("POST_NO"));
					n.setbCount(rset.getInt("B_COUNT"));
					
					list.add(n);
					
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
