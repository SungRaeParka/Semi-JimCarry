package com.kh.jimcarry.serviceCenter.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jimcarry.serviceCenter.model.dao.OneQDao;
import com.kh.jimcarry.serviceCenter.model.dao.QandADao;
import com.kh.jimcarry.serviceCenter.model.vo.Attachment;
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
	public int insertOneQ(OneQ one, ArrayList<Attachment> fileList) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int result =0 ;
		int dao=new OneQDao().insertOneQ(con, one);
		
		int dao1 = new OneQDao().insertAttachment(con,fileList);
		
		System.out.println(dao);
		System.out.println(dao1);
		if (dao > 0&& dao1 > 0 ) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	

	public OneQ selectOneQ(String num1) {
		// TODO Auto-generated method stub
		
		Connection con = getConnection();
		
		OneQ one = new OneQDao().selectQ(con, num1);
		
		if(one != null) {
			int result = new OneQDao().updateCount(con, num1);
			
			if (result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		
		}
		return one;
	}
	public int getListCount() {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		
		int listCount2 = new OneQDao().getListCount(con);
		
		close(con);
		
		return listCount2;
	}
	public ArrayList<OneQ> selectList(int currentPage2, int limit2) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		
		ArrayList<OneQ> list2 = new OneQDao().selectList(con, currentPage2, limit2);
		
		close(con);
		
		return list2;
	}


}
