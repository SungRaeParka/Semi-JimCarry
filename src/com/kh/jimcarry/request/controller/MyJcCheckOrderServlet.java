package com.kh.jimcarry.request.controller;

import java.io.IOException;
import java.util.ArrayList;

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
		System.out.println("서블릿으로 온 넘버"+no);
		
		System.out.println("rolist 가지고오기");
		ArrayList<Request> rolist = new RequestService().checkOrder(no);
		System.out.println("rolist 가지고옴");
		System.out.println("rolist :: " + rolist);
		System.out.println("rolist size :: " + rolist.size());
		
		
		String page="";
		
		if(rolist.size()==0) {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "입찰내역이 아직 없습니다.");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
		
		System.out.println("최저가 가져오기");
		int minPrice = new RequestService().minPriceCal(no);
		System.out.println("최저가 가져옴");
		System.out.println(minPrice);
		
		
		
		if(rolist != null) {
			page = "views/request/req_ReqList.jsp";
			request.setAttribute("rolist", rolist);
			request.setAttribute("no", no);
			request.setAttribute("minPrice", minPrice);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "입찰내역 확인 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
