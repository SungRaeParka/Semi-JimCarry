package com.kh.jimcarry.admin.member.model.dao;

import static com.kh.jimcarry.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class MemberDao {
	public ArrayList<Member> selectAll(Connection con) {
		ArrayList<Member> list = null;
		Statement stmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectAll");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			list = new ArrayList<Member>();

			while(rset.next()) {
				Member m = new Member();

				m.setUserId(rset.getString("USER_ID"));
				m.setPassword(rset.getString("USER_PWD"));
				m.setUserName(rset.getString("USER_NAME"));
				m.setGender(rset.getString("GENDER"));
				m.setAge(rset.getInt("AGE"));
				m.setEmail(rset.getString("EMAIL"));
				m.setPhone(rset.getString("PHONE"));
				m.setAddress(rset.getString("ADDRESS"));
				m.setHobby(rset.getString("HOBBY"));
				m.setEnrollDate(rset.getDate("ENROLL_DATE"));

				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	}
}
