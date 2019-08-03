package com.kh.jimcarry.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.board.model.service.DPService;
import com.kh.jimcarry.board.model.vo.DP;

@WebServlet("/selectOne.dp")
public class SelectDPOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println("dpOne 서블릿 num :: " + num);
		
		DP dpOne = new DPService().selectdpOne(num);
		
		String page = "";
		
		if(dpOne != null) {
			page = "views/board/driver_PromotionDetail.jsp";
			
			request.setAttribute("dpOne", dpOne);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "DP게시판 상세조회 실패!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
