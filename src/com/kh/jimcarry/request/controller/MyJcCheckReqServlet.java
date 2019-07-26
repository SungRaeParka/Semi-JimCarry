package com.kh.jimcarry.request.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.request.model.service.RequestService;
import com.kh.jimcarry.request.model.vo.Request;


@WebServlet("/checkReq.jc")
public class MyJcCheckReqServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MyJcCheckReqServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no = request.getParameter("no");
		System.out.println(no);
		
		Request r = new RequestService().checkReq(no);
		System.out.println("controller Request : "+r);
		
		String page = "";
		
		if(r != null) {
			page = "views/request/jim_CarryCheckReq.jsp";
			request.setAttribute("r", r);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "견적서 상세보기 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
