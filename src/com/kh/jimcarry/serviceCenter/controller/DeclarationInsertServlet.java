package com.kh.jimcarry.serviceCenter.controller;

import java.io.IOException;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.serviceCenter.model.service.DeclarationService;
import com.kh.jimcarry.serviceCenter.model.vo.Declaration;

/**
 * Servlet implementation class DeclarationInsertServlet
 */
@WebServlet("/declaration.de")
public class DeclarationInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeclarationInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String btn=request.getParameter("rbtn");
		String date = request.getParameter("date");
		String dname=request.getParameter("drivername");
		String uname = request.getParameter("username");
		String content =request.getParameter("Content");
		
		java.sql.Date day = null;
		
		if (!date.equals("")) {
			day = java.sql.Date.valueOf(date);
		}else {
			day = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
		}
		
		System.out.println("day ::: "+day);
		
		Declaration de = new Declaration();
		de.setDeclReason(btn);
		de.setDeclDate(day);
		de.setDriverNo(dname);
		de.setUserNo(uname);
		de.setDeclContent(content);
		
		int result = new DeclarationService().insertDeclaration(de);
		
		String page="";
		if (result > 0) {
			response.sendRedirect("/semi/noticelist.no");
		} else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "신고합니다 등록 실패");
			request.getRequestDispatcher(page).forward(request, response);
		}

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
