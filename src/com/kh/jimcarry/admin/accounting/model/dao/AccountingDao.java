package com.kh.jimcarry.admin.accounting.model.dao;

import static com.kh.jimcarry.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jimcarry.admin.accounting.model.vo.AccountingPeriod;
import com.kh.jimcarry.admin.member.model.dao.MemberDao;

public class AccountingDao {
	private Properties prop = new Properties();
	DecimalFormat df = new DecimalFormat("###,###,###,###");
	public AccountingDao() {
		String fileName =
				MemberDao.class.getResource("/sql/admin/admin-member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<AccountingPeriod> period(Connection con, String period) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<AccountingPeriod> list = null;
		String query ="";
		String periodResult = period;
		if(period==null) {
			periodResult = "일";
		}

		System.out.println("periodResult 1 : " + periodResult);
		if(periodResult.equals("일")) {
			query = prop.getProperty("accountingPeriodDay");
		}else if(periodResult.equals("월")) {
			query = prop.getProperty("accountingPeriodMonth");
		}else if(periodResult.equals("년도")) {
			query = prop.getProperty("accountingPeriodYear");
		}

		System.out.println("query : " + query);


		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			list = new ArrayList<AccountingPeriod>();

			while(rset.next()) {
				AccountingPeriod ap = new AccountingPeriod();

				ap.setAccountDate(rset.getString("PD"));
				ap.setTotalPayAmount(rset.getInt("SUM"));
				ap.setTotalCount(rset.getInt("COUNT"));
				ap.setTotalFeesIncome(rset.getInt("INCOME"));
				ap.setPeriodSort(periodResult);

				list.add(ap);
			}
			System.out.println("MemberDao list : " + list);
			String periodSort = list.get(0).getPeriodSort();
			System.out.println("periodSort : " + periodSort);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	}



}
