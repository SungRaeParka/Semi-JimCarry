package com.kh.jimcarry.request.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.request.model.service.RequestService;
import com.kh.jimcarry.request.model.vo.Request;


@WebServlet("/checkOrder.jc")
public class MyJcCheckOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MyJcCheckOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no = request.getParameter("no");
		System.out.println(no);
		
		Request ro = new RequestService().checkOrder(no);
		
		String page="";
		
		if(ro != null) {
			page = "views/request/req_ReqList.jsp";
			request.setAttribute("ro", ro);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "입찰내역 확인 실패");
		}
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
