package com.kh.jimcarry.request.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.request.model.service.ProductService;
import com.kh.jimcarry.request.model.vo.Product;

@WebServlet("/proinfo.rq")
public class SelectProductInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*ArrayList<Product> list = new ProductService().selectProInfo();
		
		System.out.println("arrayList list :::" + list);
		
		String page ="";
		
		if(list != null) {
			page = "/views/request/req_ProDetailSelect.jsp";
			
			request.setAttribute("list", list);
		}else {
			page = "views/common/errorPage.jsp";
			
			request.setAttribute("msg", "견적 정보 조회 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);*/
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
