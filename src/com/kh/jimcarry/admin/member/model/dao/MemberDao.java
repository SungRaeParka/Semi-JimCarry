package com.kh.jimcarry.admin.member.model.dao;

import static com.kh.jimcarry.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jimcarry.admin.member.model.vo.Member;
import com.kh.jimcarry.admin.member.model.vo.User;


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

				m.setSeqNo(rset.getString("USER_NO"));
				m.setUserId(rset.getString("USER_ID"));
				m.setUserName(rset.getString("USER_NAME"));
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
}
