package com.kh.jimcarry.request.model.dao;

import static com.kh.jimcarry.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jimcarry.request.model.vo.Request;

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
	public int getListCount(Connection con,String logUserNo) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, logUserNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}



	//페이징처리후 게시물 조회
	public ArrayList<Request> selectList(Connection con, int currentPage, int limit, String logUserNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Request> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage-1)*limit + 1;
			int endRow = startRow + limit -1;
			
			pstmt.setString(1, logUserNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Request>();
			
			while(rset.next()) {
				Request req = new Request();
				
				req.setReqDate(rset.getDate("RESERVATION_DATE"));
				req.setStartPoint(rset.getString("START_POINT"));
				req.setArrivalPoint(rset.getString("ARRIVE_POINT"));
				req.setReqStart(rset.getDate("REQ_START"));
				req.setReqFinish(rset.getDate("REQ_FINISH"));
				req.setMemo(rset.getString("MEMO"));
				req.setUserNo(rset.getString("USER_NO"));
				req.setReqNo(rset.getString("REQ_NO"));
				req.setDriverNo(rset.getString("DRIVER_NO"));
				req.setOrderPrice(rset.getInt("ORDER_PRICE"));
				req.setMatchDate(rset.getDate("MATCHING_DATE"));
				req.setMatchCheck(rset.getString("MATCHING_CHECK"));
				
				list.add(req);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}

}
