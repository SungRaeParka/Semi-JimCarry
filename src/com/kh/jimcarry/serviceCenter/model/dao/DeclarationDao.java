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

import com.kh.jimcarry.serviceCenter.model.vo.Declaration;
import com.kh.jimcarry.serviceCenter.model.vo.Notice;

import static com.kh.jimcarry.common.JDBCTemplate.close;

public class DeclarationDao {
	
	private Properties prop = new Properties() ;
	
	public DeclarationDao() {
		String fileName = 
				DeclarationDao.class.getResource("/sql/Notice/declaration-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int getListCount(Connection con) {
		// TODO Auto-generated method stub
		
		Statement stmt = null;
		int listCount3=0;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectListCount");
		
		try {
			stmt =con.createStatement();
			
			rset =stmt.executeQuery(query);
			
			if (rset.next()) {
				listCount3 = rset.getInt(1);
			}
			
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
			
		return listCount3;
	}

	public ArrayList<Declaration> selectList(Connection con, int currentPage3, int limit3) {
		// TODO Auto-generated method stub
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Declaration> list3 = null;
		
		String query = prop.getProperty("selectListWithPaging");
		
		try {
			pstmt =con.prepareStatement(query);
			
			int startRow3 = (currentPage3 - 1) * limit3 + 1;
			int endRow3 = startRow3 + limit3 - 1;
			
			pstmt.setInt(1, startRow3);
			pstmt.setInt(2, endRow3);
			
			rset = pstmt.executeQuery();
			
			list3 = new ArrayList<Declaration>();
			
			while (rset.next()) {
				Declaration de  = new Declaration();
				
				de.setDeclNo(rset.getString("DECL_NO"));
				de.setUserNo(rset.getString("USER_NO"));
				de.setDriverNo(rset.getString("DRIVER_NO"));
				de.setDeclDate(rset.getDate("DECL_DATE"));
				de.setDeclReason(rset.getString("DECL_REASON"));
				
				list3.add(de);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return list3;
	}

}
