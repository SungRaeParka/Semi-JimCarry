package com.kh.jimcarry.admin.statistics.model.dao;

import static com.kh.jimcarry.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jimcarry.admin.member.model.dao.MemberDao;
import com.kh.jimcarry.admin.statistics.model.vo.StatisticsMember;
import com.kh.jimcarry.admin.statistics.model.vo.StatisticsSales;
import com.kh.jimcarry.member.model.vo.Member;

public class StatisticsDao {
	private Properties prop = new Properties();

	public StatisticsDao() {
		String fileName =
				MemberDao.class.getResource("/sql/admin/admin-member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<StatisticsMember> member(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<StatisticsMember> list = null;

		String query = prop.getProperty("statisticsMember");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			list = new ArrayList<StatisticsMember>();

			while(rset.next()) {
				StatisticsMember sm = new StatisticsMember();

				sm.setPeriod(rset.getString("ED"));
				sm.setMemberCount(rset.getInt("TOTAL_COUNT"));
				sm.setUserCount(rset.getInt("U_COUNT"));
				sm.setDriverCount(rset.getInt("D_COUNT"));
//				sm.setPeriodResult();

				list.add(sm);
			}
			System.out.println("StatisticsDao list : " + list);


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	}

	public ArrayList<StatisticsSales> sales(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<StatisticsSales> list = null;

		String query = prop.getProperty("statisticsSales");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			list = new ArrayList<StatisticsSales>();

			while(rset.next()) {
				StatisticsSales ss = new StatisticsSales();
				ss.setPeriod(rset.getString("PD"));
				ss.setProfit(rset.getInt("PROFIT"));
				ss.setSales(rset.getInt("SALES"));

//				sS.setPeriodResult();

				list.add(ss);
			}
			System.out.println("StatisticsDao list : " + list);


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	}



}
