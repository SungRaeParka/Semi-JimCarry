package com.kh.jimcarry.admin.accounting.model.service;

import static com.kh.jimcarry.common.JDBCTemplate.close;
import static com.kh.jimcarry.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jimcarry.admin.accounting.model.dao.AccountingDao;
import com.kh.jimcarry.admin.accounting.model.vo.AccountingPeriod;

public class AccountingService {

	public ArrayList<AccountingPeriod> period(String period) {
		Connection con = getConnection();

		ArrayList<AccountingPeriod> list = new AccountingDao().period(con, period);
		close(con);
		return list;
	}



}
