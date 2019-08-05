 package com.kh.jimcarry.serviceCenter.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jimcarry.serviceCenter.model.dao.NoticeDao;
import com.kh.jimcarry.serviceCenter.model.vo.Notice;


import static com.kh.jimcarry.common.JDBCTemplate.*;
import static com.kh.jimcarry.common.JDBCTemplate.close;
import static com.kh.jimcarry.common.JDBCTemplate.getConnection;


public class NoticeService {
	//공지사항 전체 조회용 메소드
	public ArrayList<Notice> selectList(){
		
		Connection con = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectList(con);
		
		close(con);
		
		return list;
	}
	//공지사항 상세 보기용 메소드

	public Notice selectOne(String num) {
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
		
		/*int result = new NoticeDao().updateCount(con,num);
		
		if (result > 0) {
			commit(con);
			n = new NoticeDao().selectOne(con, num);
		} else {
			rollback(con);
		}*/
	}
	//게시글 수 조회
	public int getListCount() {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		
		int listCount = new NoticeDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}
	//페이징 처리후
	public ArrayList<Notice> selectList(int currentPage, int limit) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	

}
