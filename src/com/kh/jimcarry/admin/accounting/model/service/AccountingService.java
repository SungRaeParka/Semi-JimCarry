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

	public ArrayList<AccountingRefund> updateRefund(String resultD, String driverNo, String prompt, String refundSelect) {
		Connection con = getConnection();


//		if (list != null) {
			int result = new AccountingDao().updateRefund(con,resultD,driverNo,prompt,refundSelect);

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



}
