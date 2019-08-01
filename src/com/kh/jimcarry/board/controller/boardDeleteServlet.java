package com.kh.jimcarry.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.board.model.service.BoardService;
import com.kh.jimcarry.board.model.vo.Board;

/**
 * Servlet implementation class boardDeleteServlet
 */
@WebServlet("/Delete.bo")
public class boardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String num = request.getParameter("num");

		int result = new BoardService().deleteBoard(num);

		String page = "";
		if(result > 0) {
			page = "selectList.bo";
			//response.sendRedirect("/semi/selectList.bo");

		}else {
			page = "views/common/Review_errorPage.jsp";
			request.setAttribute("msg", "삭제 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
