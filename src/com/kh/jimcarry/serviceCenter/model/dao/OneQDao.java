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

import com.kh.jimcarry.serviceCenter.model.vo.Attachment;
import com.kh.jimcarry.serviceCenter.model.vo.Notice;
import com.kh.jimcarry.serviceCenter.model.vo.OneQ;
import com.kh.jimcarry.serviceCenter.model.vo.QandA;

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
			
			one.setMemberNo(rset.getString("MEMBER_NO"));
			one.setQuestionType(rset.getString("QUESTION_TYPE"));
			one.setPostTitle(rset.getString("POST_TITLE"));
			one.setPostContent(rset.getString("POST_CONTENT"));
			one.setAttachment(rset.getString("ATTACHMENT"));
			
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
			
			pstmt.setString(1, one.getMemberNo());
			pstmt.setString(2, one.getPostTitle());
			pstmt.setString(3, one.getPostContent());
			pstmt.setString(4, one.getAttachment());
			pstmt.setString(5, one.getPostType());
			pstmt.setString(6, one.getQuestionType());
			
			System.out.println(one.getMemberNo());
			
			System.out.println("유형 : "+one.getPostType());
			
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

	public int getListCount(Connection con) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int listCount2 = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectListCount");
		try {
			pstmt =con.prepareStatement(query);
			
			pstmt.setString(1,"질의응답");
			
			rset=pstmt.executeQuery();
			
			System.out.println("들어감?? : "+rset);
			
			if (rset.next()) {
				listCount2=rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return listCount2;

	}
	
	public ArrayList<OneQ> selectList(Connection con, int currentPage2, int limit2) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<OneQ> list2 = null;
		
		String query = prop.getProperty("selectListWithPaging");
		
		try {
			pstmt=con.prepareStatement(query);
			
			System.out.println("query : "+query);
			
			int startRow = (currentPage2 - 1) * limit2 + 1;
			int endRow=startRow + limit2 -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset=pstmt.executeQuery();
			
			list2= new ArrayList<OneQ>();
			
			while(rset.next()) {
					OneQ one = new OneQ();

					one.setPostcode(rset.getString("POST_CODE"));
					one.setMemberNo(rset.getString("MEMBER_NO"));
					one.setPostDate(rset.getDate("POST_DATE"));
					one.setPostTitle(rset.getString("POST_TITLE"));
					one.setPostContent(rset.getString("POST_CONTENTS"));
					one.setPostType(rset.getString("POST_TYPE"));
					one.setQuestionType(rset.getString("QUESTION_TYPE"));
					one.setPostNo(rset.getInt("POST_NO"));
					one.setBCount(rset.getInt("B_COUNT"));
					one.setAnswerCheck(rset.getString("ANSWER_CHECK"));
					
					list2.add(one);
					
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list2;
	}

	//첨부파일 insert
	public int insertAttachment(Connection con, ArrayList<Attachment> fileList) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachment");
		
			try {
				for (int i = 0; i < fileList.size(); i++) {
				pstmt=con.prepareStatement(query);
				
				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getFilePath());
				
				int level = 0;
				if (i == 0) {
					level = 0;
				} else {
					level = 1;
				}
				pstmt.setInt(4, level);
				pstmt.setString(5, fileList.get(i).getAttachType());
				
				result += pstmt.executeUpdate();
				
				System.out.println(result);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
		
		return result;
	}

	

}
