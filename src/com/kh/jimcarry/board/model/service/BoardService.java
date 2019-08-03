package com.kh.jimcarry.board.model.service;

import static com.kh.jimcarry.common.JDBCTemplate.close;
import static com.kh.jimcarry.common.JDBCTemplate.commit;
import static com.kh.jimcarry.common.JDBCTemplate.getConnection;
import static com.kh.jimcarry.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.jimcarry.board.model.dao.BoardDao;
import com.kh.jimcarry.board.model.vo.Attachment;
import com.kh.jimcarry.board.model.vo.Board;
import com.kh.jimcarry.board.model.vo.Comments;

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

		ArrayList<Board> list = new BoardDao().searchList(con,searchCondition, word, currentPage, limit );



		close(con);


		return list;
	}
    //게시판 업데이트요 수정
	public int updateBoard(Board b, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		int result = 0;

		int result1 = new BoardDao().updateBoard(con,b);
		System.out.println("update 서비스  보더 : " + b);

		int result2 = new BoardDao().updateAttachmen(con, fileList);
		System.out.println("update 서비스 사진 : " + fileList);
		if(result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;

		}else {
			rollback(con);
		}
			close(con);

			return result;
	}
	//게시판 삭제
	public int deleteBoard(String num) {
		Connection con = getConnection();


		int result = new BoardDao().deleteBoard(con,num);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}
	//댓글 작성
	public ArrayList<Comments> insertReply(Comments c) {
		Connection con = getConnection();

		ArrayList<Comments> replyList = null;

		int result = new BoardDao().insertReply(con, c);


		if(result > 0) {
			commit(con);
			replyList = new BoardDao().selectReplyList(con, c.getPostCode());
		}else {
			rollback(con);
		}
		close(con);
		return replyList;
	}



	//검색 갯수 카운터
	public int getListCountsearch(String word,String searchCondition) {
		Connection con = getConnection();

		int listCount = new BoardDao().getListCountsearch(con, word, searchCondition);
		close(con);
		System.out.println("word ::: searchCondition ::" + word + "나와 : "  + searchCondition + "제발" );

		return listCount;
	}

	//댓글 조회
	public ArrayList<Comments> selectReply1(String bcode) {

		Connection con = getConnection();

		ArrayList<Comments> replyList = new BoardDao().selectReply1(con, bcode);

		close(con);
		return replyList;
	}





}
