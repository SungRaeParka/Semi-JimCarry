 package com.kh.jimcarry.serviceCenter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.serviceCenter.model.service.OneQService;
import com.kh.jimcarry.serviceCenter.model.vo.OneQ;

/**
 * Servlet implementation class OneQSelectOneServlet
 */
@WebServlet("/selectOne.one")
public class OneQSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OneQSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String num1 =request.getParameter("num1");
		
		System.out.println("num1 : "+num1);
		
		OneQ one = new OneQService().selectOneQ(num1);
	
		System.out.println("one : "+one);
	
		String page="";
	
	if(one != null) {
		page="views/board/user_Insert1onDetail.jsp;";
		request.setAttribute("one", one);
	}else {
		page="views/common/errorPage.jsp";
		request.setAttribute("msg", "1:1문의 상세보기 실패!");
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
