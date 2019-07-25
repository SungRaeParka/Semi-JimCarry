package com.kh.jimcarry.request.model.dao;

import static com.kh.jimcarry.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jimcarry.request.model.vo.Product;

public class ProductDao {
	private Properties prop = new Properties();

	public ProductDao() {
		String fileName = ProductDao.class.getResource("/sql/request/product-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertRequest(Connection con, Product r) {
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
					pstmt.setString(2, kindrr[i]);
					pstmt.setInt(3, r.getBookCount());
					pstmt.setInt(4, r.getBoxCount());

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
					pstmt.setString(2, kindrr[i]);
					pstmt.setInt(3, r.getBookCount());
					pstmt.setInt(4, r.getBoxCount());

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

	public String selectReqNo(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String reqNo = "";
		int reqNo2 = 0;
		Product p = new Product();


		String query = prop.getProperty("selectReqNo");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			if(rset.next()) {				
				reqNo = rset.getString("LAST_NUMBER");

				reqNo2 = Integer.parseInt(reqNo);

				reqNo = String.valueOf(reqNo2 - 1);

				p.setReqNo(reqNo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}

		return reqNo;
	}

	public String selectProNo(Connection con, String reqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product p = null;
		String proNo = "";

		String query = prop.getProperty("selectProNo");	

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "R"+reqNo);

			rset = pstmt.executeQuery();

			while(rset.next()) {
				proNo += rset.getString("PRODUCT_NO") + ",";
			}

			p = new Product();
			p.setProNo(proNo);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return proNo;
	}

}	
