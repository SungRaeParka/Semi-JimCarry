package com.kh.jimcarry.payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.request.model.service.RequestService;
import com.kh.jimcarry.request.model.vo.Request;


@WebServlet("/makePayment.py")
public class MakePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public MakePaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reqNo = request.getParameter("reqNo");
		System.out.println("reqNo::" + reqNo);
		String roNo = request.getParameter("roNo");
		System.out.println("driverNo::" + roNo);
		
		
		Request reqOrder = new RequestService().makePayInfo(reqNo,roNo);
		
		System.out.println(reqOrder);
		
		String page="";
		
		if(reqOrder != null) {
			page = "views/request/reqMatching.jsp";
			request.setAttribute("reqOrder", reqOrder);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "결제정보 가져오기 실패!");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
