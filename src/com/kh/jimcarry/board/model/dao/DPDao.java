package com.kh.jimcarry.board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.jimcarry.board.model.vo.DP;

import static com.kh.jimcarry.common.JDBCTemplate.*;

public class DPDao {
	
	private Properties prop = new Properties();

	public DPDao() {
		String fileName = DPDao.class.getResource("/sql/board/dp-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getListCount(Connection con) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "기사홍보");
			
			rset = pstmt.executeQuery();			
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<DP> selectDPList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<DP> dpList = null;
		
		String query = prop.getProperty("selectDPList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setString(1, "기사홍보");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
						
			rset = pstmt.executeQuery();
			
			dpList = new ArrayList<DP>();
			
			while(rset.next()) {
				DP dp = new DP();				
				
				dp.setPostCode(rset.getString("POST_CODE"));
				dp.setPostType(rset.getString("POST_TYPE"));
				dp.setPostNo(rset.getInt("POST_NO"));
				dp.setPostTitle(rset.getString("POST_TITLE"));
				dp.setPostContents(rset.getString("POST_CONTENTS"));
				dp.setbCount(rset.getInt("B_COUNT"));
				dp.setPostDate(rset.getDate("POST_DATE"));
				dp.setStatus(rset.getString("STATUS"));
				
				dpList.add(dp);
			}
			System.out.println(dpList);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return dpList;
	}

	public int updatedpCount(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatedpCount");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} close(pstmt);
		
		return result;
	}

	public DP selectdpOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		DP dpOne = null;
		
		String query = prop.getProperty("selectdpOne");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				dpOne = new DP();
				
				dpOne.setPostCode(rset.getString("POST_CODE"));
				dpOne.setPostType(rset.getString("POST_TYPE"));
				dpOne.setPostNo(rset.getInt("POST_NO"));
				dpOne.setPostTitle(rset.getString("POST_TITLE"));
				dpOne.setPostContents(rset.getString("POST_CONTENTS"));
				dpOne.setbCount(rset.getInt("B_COUNT"));
				dpOne.setPostDate(rset.getDate("POST_DATE"));
				dpOne.setStatus(rset.getString("STATUS"));				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return dpOne;
	}

}
