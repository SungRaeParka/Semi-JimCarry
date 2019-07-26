package com.kh.jimcarry.admin.member.model.service;

import static com.kh.jimcarry.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jimcarry.admin.member.model.dao.MemberDao;
import com.kh.jimcarry.admin.member.model.vo.Declaration;
import com.kh.jimcarry.member.model.vo.Member;


public class MemberService {

	public ArrayList<Member> selectAll() {
		Connection con = getConnection();

		ArrayList<Member> list = new MemberDao().selectAll(con);
		close(con);
		return list;
	}

	public ArrayList<Member> selectAllDriver() {
		Connection con = getConnection();

		ArrayList<Member> list = new MemberDao().selectAllDriver(con);
		close(con);
		return list;
	}

	public ArrayList<Declaration> selectAllDc() {
		Connection con = getConnection();

		ArrayList<Declaration> list = new MemberDao().selectAllDc(con);
		close(con);
		return list;
	}

	public ArrayList<Member> approveDriver() {
		Connection con = getConnection();

		ArrayList<Member> list = new MemberDao().approveDriver(con);
		close(con);
		return list;
	}

	public ArrayList<Member> UdateApproveDriver(String resultD, String driverNo) {
		Connection con = getConnection();


//		if (list != null) {
			int result = new MemberDao().UdateApproveDriver(con,resultD,driverNo);

			if(result > 0) {
				commit(con);
			}else {
				rollback(con);
			}
//		}else {
//
//		}
		ArrayList<Member> list = new MemberDao().approveDriver(con);

		close(con);

		return list;
	}

	public ArrayList<Member> UdateRefuseDriver(String resultD, String driverNo, String prompt) {
		Connection con = getConnection();


//		if (list != null) {
			int result = new MemberDao().UdateRefuseDriver(con,resultD,driverNo,prompt);

			if(result > 0) {
				commit(con);
			}else {
				rollback(con);
			}
//		}else {
//
//		}
		ArrayList<Member> list = new MemberDao().approveDriver(con);

		close(con);

		return list;
	}

}
