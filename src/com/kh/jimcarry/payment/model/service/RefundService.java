package com.kh.jimcarry.payment.model.service;

import static com.kh.jimcarry.common.JDBCTemplate.close;
import static com.kh.jimcarry.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.kh.jimcarry.payment.model.dao.RefundDao;
import com.kh.jimcarry.payment.model.vo.Payment;
import com.kh.jimcarry.payment.model.vo.Refund;
import static com.kh.jimcarry.common.JDBCTemplate.*;

public class RefundService {

	public Refund selectRefundPayInfo(String reqNo) {
		Connection con = getConnection();
		Refund ref = null;
		
		ref = new RefundDao().selectRefundPayInfo(con,reqNo);
		
		close(con);
		
		return ref;
		
	}

	public int insertRefund(Refund ref) {
		Connection con = getConnection();
		
		int result = new RefundDao().insertRefund(con,ref);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}

}
