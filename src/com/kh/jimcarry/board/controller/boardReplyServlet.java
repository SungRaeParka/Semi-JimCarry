package com.kh.jimcarry.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.jimcarry.board.model.service.BoardService;
import com.kh.jimcarry.board.model.vo.Comments;

/**
 * Servlet implementation class boardReplyServlet
 */
@WebServlet("/insertReply.bo")
public class boardReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String writer = request.getParameter("writer");
		String bcode = request.getParameter("bcode");
		String content = request.getParameter("content");
		System.out.println("writer : " + writer);
		System.out.println("bcode : " + bcode);
		System.out.println("content : " +  content);

		 Comments c = new Comments();

		c.setUserNo(writer);
		c.setPostCode(bcode);
		c.setCommentCode(content);

		ArrayList<Comments> replyList = new BoardService().insertReply(c);


		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(replyList,response.getWriter());
		System.out.println("댓글 인설트 ::::::: ::: :: : " + replyList);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
