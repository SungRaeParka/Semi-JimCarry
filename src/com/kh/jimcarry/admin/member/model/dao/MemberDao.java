package com.kh.jimcarry.admin.member.model.dao;

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

import com.kh.jimcarry.admin.member.model.vo.BlackList;
import com.kh.jimcarry.admin.member.model.vo.Declaration;
import com.kh.jimcarry.member.model.vo.Member;


public class MemberDao {
	private Properties prop = new Properties();

	public MemberDao() {
		String fileName =
				MemberDao.class.getResource("/sql/admin/admin-member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Member> selectAll(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = null;

		String query = prop.getProperty("selectAll");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			list = new ArrayList<Member>();

			while(rset.next()) {
				Member m = new Member();

				m.setSeqNo(rset.getString("MEMBER_NO"));
				m.setUserId(rset.getString("MEMBER_ID"));
				m.setUserName(rset.getString("MEMBER_NAME"));
				m.setPhone(rset.getString("PHONE"));
				m.setEnrollDate(rset.getDate("ENROLL_DATE"));
				m.setStatusCheck(rset.getString("STATUS_CHECK"));
				m.setUdCheck(rset.getString("UD_CHECK"));

				list.add(m);
			}
			System.out.println("MemberDao list : " + list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	}
	public ArrayList<Member> selectAllDriver(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = null;

		String query = prop.getProperty("selectAllDriver");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			list = new ArrayList<Member>();

			while(rset.next()) {
				Member m = new Member();

				m.setSeqNo(rset.getString("MEMBER_NO"));
				m.setUserId(rset.getString("MEMBER_ID"));
				m.setUserName(rset.getString("MEMBER_NAME"));
				m.setPhone(rset.getString("PHONE"));
				m.setEnrollDate(rset.getDate("ENROLL_DATE"));
				m.setStatusCheck(rset.getString("STATUS_CHECK"));
				m.setUdCheck(rset.getString("UD_CHECK"));
				m.setAgent(rset.getString("AGENT_NAME"));
				m.setBusinessNo(rset.getString("BUSINESS_NO"));
				m.setBusinessAddress(rset.getString("BUSINESS_ADDRESS"));
				m.setCarType(rset.getString("CAR_TYPE"));
				m.setCarNo(rset.getString("CAR_NO"));
				m.setBankName(rset.getString("BANK_NAME"));
				m.setAccountNo(rset.getString("ACCOUNT_NO"));
				m.setBlacklistCheck(rset.getString("BLACK_CHECK"));
				m.setJoinCheck(rset.getString("JOIN_CHECK"));
				m.setRefuseReason(rset.getString("REFUSE_REASON"));
				list.add(m);
			}
			System.out.println("MemberDao list : " + list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	}
	public ArrayList<Declaration> selectAllDc(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Declaration> list = null;

		String query = prop.getProperty("selectAllDc");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			list = new ArrayList<Declaration>();

			while(rset.next()) {
				Declaration d = new Declaration();

				d.setDeclNo(rset.getString("DECL_NO"));
				d.setUserNo(rset.getString("USER_NO"));
				d.setDriverNo(rset.getString("DRIVER_NO"));
				d.setDeclDate(rset.getDate("DECL_DATE"));
				d.setDeclReason(rset.getString("DECL_REASON"));

				list.add(d);
			}
			System.out.println("MemberDao dc list : " + list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	}
	public ArrayList<Member> approveDriver(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = null;

		String query = prop.getProperty("approveDriver");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			list = new ArrayList<Member>();

			while(rset.next()) {
				Member m = new Member();

				m.setSeqNo(rset.getString("MEMBER_NO"));
				m.setUserId(rset.getString("MEMBER_ID"));
				m.setUserName(rset.getString("MEMBER_NAME"));
				m.setPhone(rset.getString("PHONE"));
				m.setEnrollDate(rset.getDate("ENROLL_DATE"));
				m.setStatusCheck(rset.getString("STATUS_CHECK"));
				m.setUdCheck(rset.getString("UD_CHECK"));
				m.setAgent(rset.getString("AGENT_NAME"));
				m.setBusinessNo(rset.getString("BUSINESS_NO"));
				m.setBusinessAddress(rset.getString("BUSINESS_ADDRESS"));
				m.setCarType(rset.getString("CAR_TYPE"));
				m.setCarNo(rset.getString("CAR_NO"));
				m.setBankName(rset.getString("BANK_NAME"));
				m.setAccountNo(rset.getString("ACCOUNT_NO"));
				m.setBlacklistCheck(rset.getString("BLACK_CHECK"));
				m.setJoinCheck(rset.getString("JOIN_CHECK"));
				m.setRefuseReason(rset.getString("REFUSE_REASON"));
				list.add(m);
			}
			System.out.println("MemberDao list : " + list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	}
	public int UdateApproveDriver(Connection con, String resultD, String driverNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("UdateApproveDriver");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, resultD);
			pstmt.setString(2, driverNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	public int UdateRefuseDriver(Connection con, String resultD, String driverNo, String prompt) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("UdateRefuseDriver");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, resultD);
			pstmt.setString(2, prompt);
			pstmt.setString(3, driverNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<BlackList> BlackList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<BlackList> list = null;

		String query = prop.getProperty("blackList");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			list = new ArrayList<BlackList>();

			while(rset.next()) {
				BlackList b = new BlackList();

				b.setDriverNo(rset.getString("DRIVER_NO"));
				b.setStopReason(rset.getString("STOP_REASON"));
				b.setStopDate(rset.getDate("STOP_DATE"));
				b.setActivationReason(rset.getString("ACTIVATION_REASON"));
				b.setActivationDate(rset.getDate("ACTIVATION_DATE"));
				b.setDeclNo(rset.getString("DECL_NO"));
				b.setBlackNo(rset.getString("BLACK_NO"));
				b.setGradeAvg(rset.getDouble("GRADE_AVG"));

				list.add(b);
			}
			System.out.println("BlackListDao list : " + list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	}
	public int updateBlackListDriver(Connection con, double resultD, String driverNo, String prompt) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateBlackListDriver");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setDouble(1, resultD);
			pstmt.setString(2, prompt);
			pstmt.setString(3, driverNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
}
