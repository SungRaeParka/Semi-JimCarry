package com.kh.jimcarry.request.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.jimcarry.request.model.service.ProductService;
import com.kh.jimcarry.request.model.vo.Product;

@WebServlet("/updateRef.pr")
public class zUpdatePopRefServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String proType_ref = request.getParameter("proType_ref");
		String proSize_ref = request.getParameter("proSize_ref");
		String reqNo = request.getParameter("reqNo");
		String proNo = request.getParameter("proNo");
		
		System.out.println("proType_ref ::::" + proType_ref);
		System.out.println("proSize_ref ::::" + proSize_ref);
		System.out.println("reqNo ::::" + reqNo);
		System.out.println("proNo ::::" + proNo);
		
		Product p = new Product();
		
		p.setProType(proType_ref);
		p.setProSize(proSize_ref);
		p.setReqNo(reqNo);
		p.setProNo(proNo);
		
		System.out.println("p.getProType() ::::" + p.getProType());
		System.out.println("p.getProSize() ::::" + p.getProSize());
		System.out.println("p.getReqNo() ::::" + p.getReqNo());
		System.out.println("p.getProNo() ::::" + p.getProNo());
		
		int result = new ProductService().updateRef(p);
		
		String page = "";
		
		if(result > 0) {
			page = "/semi/views/request/req_ProDetailSelect.jsp";
			
			request.getSession().setAttribute("p", p);
			
			response.sendRedirect(page);
		}else {
			page = "views/common/errorPage.jsp";
			
			request.setAttribute("msg", "회원 정보 수정 실패!");
			request.getRequestDispatcher(page).forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
