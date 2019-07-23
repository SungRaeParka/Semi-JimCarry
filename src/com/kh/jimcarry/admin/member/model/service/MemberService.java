package com.kh.jimcarry.admin.member.model.service;

import static com.kh.jimcarry.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jimcarry.admin.member.model.vo.Member;


public class MemberService {

	public ArrayList<Member> selectAll() {
		Connection con = getConnection();

		ArrayList<Member> list = new MemberDao().selectAll(con);
		close(con);
		return list;
	}

}
