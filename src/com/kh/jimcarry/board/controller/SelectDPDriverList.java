package com.kh.jimcarry.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.board.model.service.DPService;
import com.kh.jimcarry.board.model.vo.DP;
import com.kh.jimcarry.board.model.vo.DPPageInfo;

@WebServlet("/selecdpListDriver.dp")
public class SelectDPDriverList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
System.out.println("selectDPListServlet 들어옴");
		
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 8;
		
		int listCount = new DPService().getListCount();
		
		System.out.println("DPList Count :::" + listCount);
		
		maxPage = (int) ((double) listCount / limit + 0.875);
		
		startPage = (((int) ((double) currentPage / limit + 0.875)) -1) * 10 + 1;
		
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		DPPageInfo pi = new DPPageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<DP> dpList = new DPService().selectDPList(currentPage, limit);
		
		String page = "";
		
		if(dpList != null) {
			page = "views/board/dp_DriverList.jsp";
			
			request.setAttribute("dpList", dpList);
			request.setAttribute("pi", pi);			
		}else {
			page = "views/common/errorPage.jsp";
			
			request.setAttribute("msg", "기사홍보 게시판 조회 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
