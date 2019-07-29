package com.kh.jimcarry.request.model.dao;

import static com.kh.jimcarry.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jimcarry.request.model.vo.Request;
import com.kh.jimcarry.request.model.vo.RequestAttachment;

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
				req.setReservationDate(rset.getString("RESERVATION_DATE"));
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
				req.setReservationDate(rset.getString("RESERVATION_DATE"));
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



	public int insertRequest(Connection con, Request r) {
		PreparedStatement pstmt = null;
		int result = 0;
		long a = r.getReqFinish().getTime();
		
		String query = prop.getProperty("insertRequestInfo");
		
		java.sql.Date reqFinishSql = new java.sql.Date(a);
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, r.getReservationDate());
			pstmt.setString(2, r.getStartPoint());
			pstmt.setString(3, r.getArrivalPoint());
			pstmt.setDate(4, reqFinishSql);
			pstmt.setString(5, r.getUserNo());
			pstmt.setString(6, r.getReqNo());
			pstmt.setString(7, r.getProNo());
			pstmt.setString(8, r.getMemo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}



	public int insertPIMG(Connection con, ArrayList<RequestAttachment> fileList, String reqNo, String proNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPIMG");
		
			try {
				for(int i = 0; i < fileList.size(); i++) {
					pstmt = con.prepareStatement(query);
					
					pstmt.setString(1, fileList.get(i).getOriginName());
					pstmt.setString(2, fileList.get(i).getChangeName());
					pstmt.setString(3, fileList.get(i).getFilePath());
					
					int level = 0;
					
					pstmt.setInt(4, level);
					
					level++;
					
					pstmt.setString(5, "견적물품사진");
					pstmt.setString(6, reqNo);
					//pstmt.setString(7, "");
					
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
