package com.kh.jimcarry.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;


import com.kh.jimcarry.board.model.dao.BoardDao;
import com.kh.jimcarry.board.model.vo.Attachment;
import com.kh.jimcarry.board.model.vo.Board;

import static com.kh.jimcarry.common.JDBCTemplate.*;

public class BoardService {

	//게시판 전체 조회 메소드
	public ArrayList<Board> selectList() {
		Connection con = getConnection();

		ArrayList<Board> list = new BoardDao().selectList(con);

		close(con);

		return list;
	}
	//페이징 메소드
	public ArrayList<Board> selectList(int currentPage, int limit) {
		Connection con = getConnection();

		ArrayList<Board> list = new BoardDao().selectList(con,currentPage,limit);

		System.out.println(list);
		close(con);
		return list;
	}

	//게시물 카운터 메소드
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	// 게시판 인설트
	public int insertBoard(Board b, ArrayList<Attachment> fileList) {
		Connection con = getConnection();

		int result = 0;

		int result1 = new BoardDao().insertBoardContent(con, b);


			if(result1 > 0) {
				String postCode = new BoardDao().selectCurrval(con);
				System.out.println("postCode : " + postCode);

				for(int i = 0; i < fileList.size(); i++) {
					fileList.get(i).setPostCode(postCode);
				}
		}
		int result2 = new BoardDao().inserAttachment(con, fileList);
		if(result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;

		}else {
			rollback(con);
		}
		System.out.println();
		return result;
	}

}
