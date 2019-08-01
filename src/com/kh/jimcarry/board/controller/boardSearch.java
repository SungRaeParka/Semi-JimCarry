package com.kh.jimcarry.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.board.model.service.BoardService;
import com.kh.jimcarry.board.model.vo.Board;
import com.kh.jimcarry.board.model.vo.PageInfo;

/**
 * Servlet implementation class BoardSearch
 */
@WebServlet("/search.bo")
public class boardSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
	//	String word;


		String word = request.getParameter("word");
		String searchCondition = request.getParameter("searchCondition");
		//게시판은 1페이지부터 시작함 그래서 1로 초기값
		currentPage = 1;

		if(request.getParameter("currentPage") != null ) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			/*if(request.getParameter("word") != null) {
				word = request.getParameter("word");
			}*/
		}

		//한 페이지에 보여질 목록 갯수
		limit = 10;

			int listCount = new BoardService().getListCountsearch(word,searchCondition);
			System.out.println("word :: :::  " + word);
			System.out.println("searchCondition :: :::  " + searchCondition);


		System.out.println("searchCondition : ::::::::::::::::: " + searchCondition);
		System.out.println();
		System.out.println("listCount 페이지 갯수는??  제목으로 검색   :::::::::::::::::::::: :  " + listCount);

		maxPage = (int)((double)listCount / limit + 0.9);

		startPage = ((int)((double) currentPage / limit + 0.9) -1) *10 + 1;

		endPage = startPage + 10 -1;

		if(maxPage < endPage) {
			endPage = maxPage;

		}

		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage/*, word*/);


		ArrayList<Board> list = new BoardService().searchList(currentPage,limit, searchCondition, word);

		ArrayList<Board> listPage = new BoardService().searchList(currentPage,limit);


		//System.out.println("검색 text 값 :  "  + word);
		System.out.println("검색 리스트 ::::::::" + list);
		System.out.println("word ddddddddddddddddddddd : "   + word);
		System.out.println("searchCondition searchCondition : "   + searchCondition);
		String page = "";

		if(list !=null) {
			page = "views/board/user_ReviewSearchArea.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("word", word);
			request.setAttribute("listPage", listPage);
		}else {
			page = "views/common/Review_errorPage.jsp";
			request.setAttribute("msg", "게시판 검색실패!");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
