package com.kh.jimcarry.admin.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.board.model.service.DPService;

@WebServlet("/delete.dp")
public class DeleteDPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("DP삭제 서블릿 들어옴 num ::" + num);
		
		int result = new DPService().deleteDP(num);
		
		String page = "";	
		
		if(result > 0) {
			page = "/semi/selectAdmin.dp";			
			
			response.sendRedirect(page);
		}else {
			page="views/common/admin_errorPage.jsp";
			
			request.setAttribute("msg", "게시글 삭제 실패!");
			
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
