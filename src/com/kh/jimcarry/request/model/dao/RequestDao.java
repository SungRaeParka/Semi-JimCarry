package com.kh.jimcarry.request.model.dao;

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

import com.kh.jimcarry.request.model.vo.Request;

public class RequestDao {
	private Properties prop = new Properties();
	
	public RequestDao() {
		String fileName = RequestDao.class.getResource("/sql/request/request-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/*public Request insertRequest(Connection con, String proName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Request r = null;
		
		String[] namerr = proName.split(", ");
		
		for(int i = 0; i < namerr.length; i++) {
			System.out.println("namerr[i] ::::" + namerr[i]);
		}
		
		for(int i = 0; i < namerr.length; i++) {
			if(i == 0) {
				String query = prop.getProperty("insertRequest");
				
				try {
					pstmt = con.prepareStatement(query);
					
					pstmt.setString(1, namerr[i]);
					
					rset = pstmt.executeQuery();
					
					while(rset.next()) {
						r = new Request();
						
						r.setReqNo(rset.getString("REQ_NO"));
						r.setProNo(rset.getString("PRODUCT_NO"));
						
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(rset);
					close(pstmt);
				}
			} else {
				String query = prop.getProperty("insertRequest2");
				
				try {
					pstmt = con.prepareStatement(query);
					
					pstmt.setString(1, namerr[i]);
					
					rset = pstmt.executeQuery();
					
					while(rset.next()) {
						r = new Request();
						
						r.setReqNo(rset.getString("REQ_NO"));
						r.setProNo(rset.getString("PRODUCT_NO"));
						
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(rset);
					close(pstmt);
				}
			}
		}
		
		return r;
	}*/

	public int insertRequest(Connection con, Request r) {
		int result = 0;
		PreparedStatement pstmt = null;	
		
		String[] namerr = r.getProName().split(", ");
		String[] kindrr = r.getProKind().split(", ");
		
		for(int i = 0; i < kindrr.length; i++) {
			System.out.println("namerr[i] ::::" + namerr[i]);
			System.out.println("kindrr[i] ::::" + kindrr[i]);
		}		
		
		for(int i = 0; i < namerr.length; i++) {			
			if(i == 0) {
				String query = prop.getProperty("insertRequest");	
				
				try {
					pstmt = con.prepareStatement(query);	
					
					pstmt.setString(1, namerr[i]);				
					
					result = pstmt.executeUpdate();						
					
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(pstmt);
				}				
			}else if(i > 0) {
				String query = prop.getProperty("insertRequest2");	
				
				try {
					pstmt = con.prepareStatement(query);	
					
					pstmt.setString(1, namerr[i]);
					
					result = pstmt.executeUpdate();					
					
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(pstmt);
				}
			}						
		}
		return result;
	}

	public ArrayList<Request> selectProInfo(Connection con) {
		ArrayList<Request> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectProInfo");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Request>();
			
			while(rset.next()) {
				Request r = new Request();
				
				r.setReqNo(rset.getString("REQ_NO"));
				r.setProNo(rset.getString("PRODUCT_NO"));
				r.setProName(rset.getString("PRODUCT_NAME"));
				
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		return list;
	}

	

	
}	
