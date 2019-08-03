package com.kh.jimcarry.serviceCenter.model.service;

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
		
		ArrayList<QandA> list1 = new QandADao().selectList(con);
		
		close(con);
		
		return list1;
	}
	/*//상세보기용
	public QandA selectOneQA(int num) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		
		QandA qa = new QandADao().selectOneQA(con, num);
		
		if(qa != null) {
			int result = new QandADao().updateCountQA(con, num);
			
			if (result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		}
		
		return qa;
	}*/
	public int getListCount() {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		
		int listCount1 = new QandADao().getListCount(con);
		
		close(con);
		
		return listCount1;
	}
	
	public ArrayList<QandA> selectList(int currentPage1, int limit1) {
		// TODO Auto-generated method stub
		
		Connection con = getConnection();
		
		ArrayList<QandA> list1 = new QandADao().selectList(con, currentPage1, limit1);
		
		close(con);
		
		return list1;
	}

}
