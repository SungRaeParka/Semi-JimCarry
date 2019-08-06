package com.kh.jimcarry.admin.accounting.model.service;

import static com.kh.jimcarry.common.JDBCTemplate.close;
import static com.kh.jimcarry.common.JDBCTemplate.commit;
import static com.kh.jimcarry.common.JDBCTemplate.getConnection;
import static com.kh.jimcarry.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jimcarry.admin.accounting.model.dao.AccountingDao;
import com.kh.jimcarry.admin.accounting.model.vo.AccountingMember;
import com.kh.jimcarry.admin.accounting.model.vo.AccountingPeriod;
import com.kh.jimcarry.admin.accounting.model.vo.AccountingRefund;
import com.kh.jimcarry.admin.member.model.dao.MemberDao;

public class AccountingService {

	public ArrayList<AccountingPeriod> period(String period) {
		Connection con = getConnection();

		ArrayList<AccountingPeriod> list = new AccountingDao().period(con, period);
		close(con);
		return list;
	}

	public ArrayList<AccountingRefund> refund(String refundSelect) {
		Connection con = getConnection();

		ArrayList<AccountingRefund> list = new AccountingDao().refund(con, refundSelect);
		close(con);
		return list;
	}

	public ArrayList<AccountingRefund> updateYesRefund(String refundBtnVal, String payNoVal, String refundSelect) {
		Connection con = getConnection();


//		if (list != null) {
			int result = new AccountingDao().updateYesRefund(con,refundBtnVal,payNoVal,refundSelect);

			if(result > 0) {
				commit(con);
			}else {
				rollback(con);
			}
//		}else {
//
//		}
		ArrayList<AccountingRefund> list = new AccountingDao().refund(con, refundSelect);

		close(con);

		return list;
	}

	public ArrayList<AccountingRefund> updateNoRefund(String refundBtnVal, String payNoVal, String promptVal, String refundSelect) {
		Connection con = getConnection();
//		if (list != null) {
			int result = new AccountingDao().updateNoRefund(con,refundBtnVal,payNoVal,promptVal,refundSelect);

			if(result > 0) {
				commit(con);
			}else {
				rollback(con);
			}
//		}else {
//
//		}
		ArrayList<AccountingRefund> list = new AccountingDao().refund(con, refundSelect);

		close(con);

		return list;
	}

	public ArrayList<AccountingMember> member(String memberSelect) {
		Connection con = getConnection();

		ArrayList<AccountingMember> list = new AccountingDao().member(con, memberSelect);
		close(con);
		return list;
	}

	public ArrayList<AccountingMember> updateMember(String calCheckBtnVal, String payNoVal, String memberSelect) {
		Connection con = getConnection();
		ArrayList<AccountingMember> list = null;


//		if (list != null) {
			int result = new AccountingDao().updateMember(con,calCheckBtnVal,payNoVal);
			System.out.println("memberSelect in service : " + memberSelect);
			if(result > 0) {
				commit(con);
				list = new AccountingDao().member(con, memberSelect);
			}else {
				rollback(con);
			}
//		}else {
//
//		}
			System.out.println("memberSelect in service ::::::::::::::: " + memberSelect);

		close(con);

		return list;
	}





}
