package com.kh.jimcarry.payment.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.jimcarry.payment.model.vo.Refund;
import com.kh.jimcarry.request.model.dao.RequestDao;

import static com.kh.jimcarry.common.JDBCTemplate.*;

public class RefundDao {
	
	private Properties prop = new Properties();
	
	public RefundDao() {
		String fileName = RefundDao.class.getResource("/sql/payment/refund-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Refund selectRefundPayInfo(Connection con, String reqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Refund ref = null;
		
		String query = prop.getProperty("selectPayInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ref = new Refund();
				
				ref.setPayNo(rset.getString("PAY_NO"));
				ref.setReservationDate(rset.getString("RESERVATION_DATE"));
				ref.setPayAmount(rset.getInt("PAY_AMOUNT"));
				
				System.out.println(ref.toString());
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return ref;
	}

	public int insertRefund(Connection con, Refund ref) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertRefund");
		System.out.println(query);
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, ref.getPayNo());
			pstmt.setString(2, ref.getReservationDate());
			pstmt.setInt(3, ref.getPayAmount());
			pstmt.setInt(4, ref.getRefundFees());
			pstmt.setString(5, ref.getRefundReason());
			
			System.out.println(ref.getPayNo());
			System.out.println(ref.getReservationDate());
			System.out.println(ref.getPayAmount());
			System.out.println(ref.getRefundReason());
			
			
			result = pstmt.executeUpdate();
			System.out.println(result);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	

}
