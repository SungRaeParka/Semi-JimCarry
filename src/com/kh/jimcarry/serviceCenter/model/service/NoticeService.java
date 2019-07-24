package com.kh.jimcarry.serviceCenter.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jimcarry.serviceCenter.model.dao.NoticeDao;
import com.kh.jimcarry.serviceCenter.model.vo.Notice;
import static com.kh.jimcarry.common.JDBCTemplate.*;


public class NoticeService {
	//공지사항 전체 조회용 메소드
	public ArrayList<Notice> selectList(){
		
		Connection con = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectList(con);
		
		close(con);
		
		return list;
	}
	//공지사항 상세 보기용 메소드

	public Notice selectOne(int num) {
		// TODO Auto-generated method stub
		
		Connection con =getConnection();
		
		Notice n = new NoticeDao().selectOne(con, num);
		
		if (n != null) {
			int result = new NoticeDao().updateCount(con,num);
			
			if (result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		}
		close(con);
		
		return n;
	}
	

}
