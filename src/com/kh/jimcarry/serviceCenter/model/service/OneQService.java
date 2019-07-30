package com.kh.jimcarry.serviceCenter.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jimcarry.serviceCenter.model.dao.OneQDao;
import com.kh.jimcarry.serviceCenter.model.dao.QandADao;
import com.kh.jimcarry.serviceCenter.model.vo.OneQ;

import static com.kh.jimcarry.common.JDBCTemplate.*;

public class OneQService {

	//1:1문의 전체 리스트 조회용
	public ArrayList<OneQ> selectList() {
		// TODO Auto-generated method stub
		
		Connection con = getConnection();
		
		ArrayList<OneQ> list2 = new OneQDao().selectList(con);
		
		close(con);
		
		return list2;
	}
	//1:1문의 작성용
	public int insertOneQ(OneQ one) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		
		int result  = new OneQDao().insertOneQ(con, one);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		return result;
	}

	public OneQ selectOneQ(int num) {
		// TODO Auto-generated method stub
		
		Connection con = getConnection();
		
		OneQ one = new OneQDao().selectQ(con, num);
		
		if(one != null) {
			int result = new OneQDao().updateCountQ(con, num);
			
			if (result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		}
		
		return one;
	}
	public ArrayList<OneQ> selectList(int currentPage, int limit) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		
		ArrayList<OneQ> list2 = new OneQDao().selectList(con, currentPage, limit);
		
		close(con);
		
		return list2;
	}
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
