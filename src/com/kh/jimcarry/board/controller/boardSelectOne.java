package com.kh.jimcarry.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.board.model.service.BoardService;
import com.kh.jimcarry.board.model.vo.Attachment;
import com.kh.jimcarry.board.model.vo.Board;
import com.kh.jimcarry.board.model.vo.Comments;

/**
 * Servlet implementation class boardSelectOne
 */
@WebServlet("/selectOne.bo")
public class boardSelectOne extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		System.out.println("num : " + num);
		System.out.println();


		HashMap<String, Object> hmap = new BoardService().selectBoardMap(num);
		Board b = (Board) hmap.get("board");


		System.out.println("b : " + b);
		ArrayList<Attachment> fileList = (ArrayList<Attachment>) hmap.get("attachment");
		System.out.println("파일 리스트 : " + fileList);
		String page = "";

		ArrayList<Comments> comment = new BoardService().selectReplyListOne(num);


			if(hmap != null) {
			page = "views/board/user_ReviewOne.jsp";
			request.setAttribute("b", b);
			request.setAttribute("fileList", fileList);
			//request.setAttribute("comment", comment);
		}else {
			page = "views/common/Review_errorPage.jsp";
			request.setAttribute("msg", "게시판 상세보기 실패!!!");
		}

		request.getRequestDispatcher(page).forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
