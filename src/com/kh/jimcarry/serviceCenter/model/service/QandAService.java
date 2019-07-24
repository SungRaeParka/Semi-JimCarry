package com.kh.jimcarry.serviceCenter.model.service;

import static com.kh.jimcarry.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jimcarry.serviceCenter.model.dao.QandADao;
import com.kh.jimcarry.serviceCenter.model.vo.QandA;

import static com.kh.jimcarry.common.JDBCTemplate.*;

public class QandAService {
	//QandA
	public ArrayList<QandA> selectList() {
		// TODO Auto-generated method stub
		
		Connection con = getConnection();
		
		ArrayList<QandA> list = new QandADao().selectList(con);
		
		close(con);
		
		return list;
	}

}
