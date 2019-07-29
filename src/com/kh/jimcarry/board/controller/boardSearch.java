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


		//게시판은 1페이지부터 시작함 그래서 1로 초기값
		currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		//한 페이지에 보여질 목록 갯수
		limit = 10;

		int listCount = new BoardService().getListCount();


		System.out.println();
		System.out.println("listCount 페이지 갯수는?? :  " + listCount);

		maxPage = (int)((double)listCount / limit + 0.9);

		startPage = ((int)((double) currentPage / limit + 0.9) -1) *10 + 1;

		endPage = startPage + 10 -1;

		if(maxPage < endPage) {
			endPage = maxPage;

		}

		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);

		String searchCondition = request.getParameter("searchCondition");
		String word = request.getParameter("word");

		ArrayList<Board> list = new BoardService().searchList(currentPage,limit, searchCondition, word);
		System.out.println("검색 text 값 :  "  + word);
		System.out.println("검색 리스트 ::::::::" + list);
		String page = "";

		if(list !=null) {
			page = "views/board/user_ReviewList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else {
			page = "views/common/errorPage.jsp";
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
