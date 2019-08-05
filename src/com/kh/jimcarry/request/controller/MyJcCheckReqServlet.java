package com.kh.jimcarry.request.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jimcarry.request.model.service.RequestService;
import com.kh.jimcarry.request.model.vo.Product;
import com.kh.jimcarry.request.model.vo.Request;
import com.kh.jimcarry.request.model.vo.ShowRP;


@WebServlet("/checkReq.jc")
public class MyJcCheckReqServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reqNo = request.getParameter("no");
		System.out.println("지은이 최종견적서 reqNo ::::" + reqNo);
		
		ShowRP requestInfo = new RequestService().selectRequestInfo2(reqNo);
		System.out.println("지은이 최종 견적서 requestInfo ::::" + requestInfo);
		
		ArrayList<HashMap<String, Object>> requestImg = new RequestService().selectRequestImg2(reqNo);
		System.out.println("지은이 최종 견적서 requestImg ::" + requestImg);
		
		ArrayList<HashMap<String, Object>> productInfo = new RequestService().selectProductInfo2(reqNo);
		System.out.println("지은이 최종 견적서 productInfo :::" + productInfo);
		
		String page = "";
		
		if(requestInfo != null) {
			page = "/semi/views/request/jim_CarryCheckReq.jsp";
			
			HttpSession session = request.getSession();
			
			session.setAttribute("requestInfo", requestInfo);		
			session.setAttribute("requestImg", requestImg);
			session.setAttribute("productInfo", productInfo);
			
			response.sendRedirect(page);
		}else {
			page = "views/common/errorPage.jsp";
			
			request.setAttribute("msg", "견적 생성 실패!");
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
