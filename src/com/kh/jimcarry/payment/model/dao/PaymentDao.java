package com.kh.jimcarry.payment.model.dao;

import static com.kh.jimcarry.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.jimcarry.payment.model.vo.Payment;

public class PaymentDao {
	private Properties prop = new Properties();
	
	public PaymentDao() {
		String fileName = PaymentDao.class.getResource("/sql/payment/payment-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	public int insertPayment(Connection con, Payment pay) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPayment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pay.getPayer());
			pstmt.setInt(2, pay.getPayAmount());
			pstmt.setString(3, pay.getUserNo());
			pstmt.setString(4, pay.getDriverNo());
			pstmt.setString(5, pay.getReqNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}


	public Payment selectRefundPayInfo(Connection con, String reqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Payment pay = null;
		
		String query = prop.getProperty("selectPayInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				pay = new Payment();
				
				pay.setPayNo(rset.getString(""));
				
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		return pay;
	}
}
