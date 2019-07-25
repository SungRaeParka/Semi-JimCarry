package com.kh.jimcarry.member.model.dao;

import java.sql.Statement;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jimcarry.member.model.vo.AttachmentMember;
import com.kh.jimcarry.member.model.vo.Member;
import static com.kh.jimcarry.common.JDBCTemplate.*;

public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int insertMember(Connection con, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getPhone());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Member loginCheck(Connection con, String userId, String userPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("loginSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				System.out.println(rset.getString("MEMBER_ID"));
				
				loginUser = new Member();
				
				loginUser.setSeqNo(rset.getString("MEMBER_NO"));
				loginUser.setUserId(rset.getString("MEMBER_ID"));
				loginUser.setUserPwd(rset.getString("MEMBER_PWD"));
				loginUser.setPhone(rset.getString("PHONE"));
				loginUser.setEnrollDate(rset.getDate("ENROLL_DATE"));
				loginUser.setStatusCheck(rset.getString("STATUS_CHECK"));
				loginUser.setUdCheck(rset.getString("UD_CHECK"));
			}
			
			System.out.println("DAO loginUser userId :::: " + loginUser.getUserId());
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return loginUser;
	}

	public int insertDriver(Connection con, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertDriver");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getAgent());
			pstmt.setString(6, m.getBusinessNo());
			pstmt.setString(7, m.getBusinessAddress());
			pstmt.setString(8, m.getCarType());
			pstmt.setString(9, m.getCarNo());
			pstmt.setString(10, m.getBankName());
			pstmt.setString(11, m.getAccountNo());
			pstmt.setString(12, m.getCarSize());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
}













