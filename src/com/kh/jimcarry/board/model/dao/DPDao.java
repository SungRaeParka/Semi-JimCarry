package com.kh.jimcarry.board.model.dao;

import static com.kh.jimcarry.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jimcarry.board.model.vo.Attachment;
import com.kh.jimcarry.board.model.vo.DP;

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
				dp.setChangeName(rset.getString("CHANGE_NAME"));
				dp.setFilePath(rset.getString("FILE_PATH"));
				
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
				dpOne.setChangeName(rset.getString("CHANGE_NAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return dpOne;
	}

	public int insertAdminDPContent(Connection con, DP dp) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAdminDP");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1,  dp.getPostTitle());
			pstmt.setString(2, dp.getPostContents());
			pstmt.setString(3,  "기사홍보");
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public String selectDPCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String postCode = null;
		
		String query = prop.getProperty("selectDPCurrval");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				postCode = rset.getString("CURRVAL");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		return postCode;
	}

	public int insertAttachment(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertDPAttachment");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				
				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getFilePath());
				pstmt.setString(4, "기사홍보");
				pstmt.setString(5, fileList.get(i).getPostCode());
				
				result += pstmt.executeUpdate();				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteDP(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteDP");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<DP> selectDPUpdatePre(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<DP> selectDPList = null;
		
		String query = prop.getProperty("selectDPUpdatePre");
		
		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			selectDPList = new ArrayList<DP>();
			
			if(rset.next()) {
				DP dp = new DP();
				
				dp.setPostTitle(rset.getString("POST_TITLE"));
				dp.setPostContents(rset.getString("POST_CONTENTS"));
				dp.setPostDate(rset.getDate("POST_DATE"));
				dp.setPostNo(rset.getInt("POST_NO"));
				dp.setPostCode(rset.getString("POST_CODE"));
				dp.setChangeName(rset.getString("CHANGE_NAME"));
				dp.setFilePath(rset.getString("FILE_PATH"));
				
				selectDPList.add(dp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return selectDPList;
	}

	public int updatetAdminDPContent(Connection con, DP dp) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateDP");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, dp.getPostTitle());
			pstmt.setString(2, dp.getPostContents());
			pstmt.setString(3, dp.getPostCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateAttachment(Connection con, ArrayList<Attachment> fileList, DP dp) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateDPAttachment");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				
				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getFilePath());
				pstmt.setString(4, dp.getPostCode());
				
				result += pstmt.executeUpdate();				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
