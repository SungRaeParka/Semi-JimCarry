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
		String fileName = RequestDao.class.getResource("/sql/request/request-query.properties").getPath();
		
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
		
		String query;
		if(logUserNo.charAt(0)=='U') {
			query = prop.getProperty("selectListCount");
		}else {
			query = prop.getProperty("selectDriverListCount");
		}
		System.out.println(query);
		
		
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
				
				req.setReqNo(rset.getString("REQ_NO"));
				req.setStartPoint(rset.getString("START_POINT"));
				req.setArrivalPoint(rset.getString("ARRIVE_POINT"));
				req.setReservationDate(rset.getDate("RESERVATION_DATE"));
				req.setReservationTime(rset.getInt("RESERVATION_TIME"));
				req.setReqStart(rset.getDate("REQ_START"));
				req.setReqFinish(rset.getDate("REQ_FINISH"));
				req.setReqCount(rset.getInt("COUNT"));
				req.setOrderPrice(rset.getInt("ORDER_PRICE"));
				req.setDriverName(rset.getString("MEMBER_NAME"));
				req.setGrade(rset.getString("GRADE"));
				req.setConditionReq(rset.getString("CONDITION_REQ"));
				
				list.add(req);
				
				System.out.println("리스트에 담김");
				System.out.println(list);
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



	//페이징처리후 게시물 조회_기사
	public ArrayList<Request> selectDriverList(Connection con, int currentPage, int limit, String logUserNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Request> list = null;
		
		String query = prop.getProperty("selectDriverList");
		
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
				
				req.setReqNo(rset.getString("REQ_NO"));
				req.setStartPoint(rset.getString("START_POINT"));
				req.setArrivalPoint(rset.getString("ARRIVE_POINT"));
				req.setReservationDate(rset.getDate("RESERVATION_DATE"));
				req.setReservationTime(rset.getInt("RESERVATION_TIME"));
				req.setReqFinish(rset.getDate("REQ_FINISH"));
				req.setUserName(rset.getString("MEMBER_NAME"));
				req.setReqCount(rset.getInt("COUNT"));
				req.setOrderPrice(rset.getInt("ORDER_PRICE"));
				req.setConditionDo(rset.getString("CONDITION_DO"));
				
				list.add(req);
				
				System.out.println("리스트에 담김");
				
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




	public Request checkReq(Connection con, String no) {
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		Request r = null;
		
		String query = prop.getProperty("checkReq");
		
		
		
		return r;
	}



	
}
