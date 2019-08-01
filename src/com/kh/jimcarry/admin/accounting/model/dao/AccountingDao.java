package com.kh.jimcarry.admin.accounting.model.dao;

import static com.kh.jimcarry.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jimcarry.admin.accounting.model.vo.AccountingMember;
import com.kh.jimcarry.admin.accounting.model.vo.AccountingPeriod;
import com.kh.jimcarry.admin.accounting.model.vo.AccountingRefund;
import com.kh.jimcarry.admin.member.model.dao.MemberDao;

import oracle.net.aso.a;

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

	public ArrayList<AccountingRefund> refund(Connection con, String refundSelect) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<AccountingRefund> list = null;
		String query ="";
		String refundSelectResult = refundSelect;
		if(refundSelect==null) {
			refundSelectResult = "전체";
		}

		System.out.println("periodResult 1 : " + refundSelectResult);
		if(refundSelectResult.equals("전체")) {
			query = prop.getProperty("accountingRefundAll");
		}else if(refundSelectResult.equals("환불대기")) {
			query = prop.getProperty("accountingRefunding");
		}else if(refundSelectResult.equals("완료")) {
			query = prop.getProperty("accountingYesRefund");
		}else if(refundSelectResult.equals("반려")) {
			query = prop.getProperty("accountingNoRefund");
		}

		System.out.println("query : " + query);


		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			list = new ArrayList<AccountingRefund>();

			while(rset.next()) {
				AccountingRefund ar = new AccountingRefund();

				ar.setPayNo(rset.getString("PAY_NO"));
				ar.setReservationDate(rset.getDate("RESERVATION_DATE"));
				ar.setMemberName(rset.getString("MEMBER_NAME"));
				ar.setRefundReqDate(rset.getDate("REFUND_REQ_DATE"));
				ar.setPayAmount(rset.getInt("PAY_AMOUNT"));
				ar.setRefundFees(rset.getInt("REFUND_FEES"));
				ar.setRefundReason(rset.getString("REFUND_REASON"));
				ar.setRefundCondition(rset.getString("REFUND_CONDITION"));
				ar.setCompanionReason(rset.getString("COMPANION_REASON"));
				ar.setRefundMember(refundSelectResult);

				list.add(ar);
			}
			System.out.println("MemberDao list : " + list);
			String refundMember = list.get(0).getRefundMember();
			System.out.println("periodSort : " + refundMember);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	}

	public int updateRefund(Connection con, String resultD, String driverNo, String prompt, String refundSelect) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateBlackListDriver");

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

	public ArrayList<AccountingMember> member(Connection con, String memberSelect) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<AccountingMember> list = null;
		String query ="";
		String memberSelectResult = memberSelect;
		if(memberSelect==null) {
			memberSelectResult = "사용자";
		}

		System.out.println("periodResult 1 : " + memberSelectResult);
		if(memberSelectResult.equals("사용자")) {
			query = prop.getProperty("accountingUser");
		}else if(memberSelectResult.equals("기사")) {
			query = prop.getProperty("accountingDriver");
		}

		System.out.println("query : " + query);


		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			list = new ArrayList<AccountingMember>();

			while(rset.next()) {
				AccountingMember am = new AccountingMember();

				am.setMemberName(rset.getString("MEMBER_NAME"));
				am.setMemberNo(rset.getString("MEMBER_NO"));
				am.setMemberId(rset.getString("MEMBER_ID"));
				am.setPayNo(rset.getString("PAY_NO"));
				am.setReservationDate(rset.getString("RESERVATION_DATE"));
				am.setPayAmount(rset.getInt("PAY_AMOUNT"));
				am.setPayDate(rset.getDate("PAY_DATE"));
				am.setRefundReq(rset.getString("REFUND_REQ"));
				am.setDriverPay(rset.getInt("DRIVER_PAY"));
				am.setUserDriver(memberSelectResult);

				list.add(am);
			}
			System.out.println("MemberDao list : " + list);
			String userDriver = list.get(0).getUserDriver();
			System.out.println("userDriver : " + userDriver);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	}



}
