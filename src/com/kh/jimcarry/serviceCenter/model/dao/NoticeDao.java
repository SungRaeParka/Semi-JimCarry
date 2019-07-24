package com.kh.jimcarry.serviceCenter.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
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
			NoticeDao.class.getResource("/sql/notice-query.properties").getPath();
	
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
				n.setPostcode(rset.getString("POST_CODE"));
				n.setUserNo(rset.getString("USER_NO"));
				n.setPostdate(rset.getDate("POST_DATE"));
				n.setPostTitle(rset.getString("POST_TITLE"));
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

}
