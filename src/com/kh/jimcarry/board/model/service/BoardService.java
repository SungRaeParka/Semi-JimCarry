package com.kh.jimcarry.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import javax.swing.plaf.synth.SynthSpinnerUI;

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
		System.out.println("service : " + list);
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

	//게시물 카운터 메소드드
	public int getListCount() {
		Connection con = getConnection();

		int listCount = new BoardDao().getListCount(con);
		close(con);


		return listCount;
	}

	//게시판 상세보기
		public HashMap<String, Object> selectBoardMap(String num) {
			Connection con = getConnection();

			HashMap<String, Object> hmap = null;

			int result = new BoardDao().updateCount(con,num);

			if(result > 0) {
				commit(con);
				hmap = new BoardDao().selectBoardMap(con,num);
			}else {
				rollback(con);
			}
			close(con);
			System.out.println("상세보기  서비스 : " + hmap );
			return hmap;
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
			close(con);
		return result;
	}

	//게시판 검색 기능
	public ArrayList<Board> searchList(int currentPage, int limit, String searchCondition, String word) {
		Connection con = getConnection();

		ArrayList<Board> list = new BoardDao().searchList(con,searchCondition, word);


		ArrayList<Board> listPage = new BoardDao().searchPage(con,currentPage,limit);
		System.out.println(list);
		close(con);


		return list;
	}




}
