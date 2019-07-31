package com.kh.jimcarry.request.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.request.model.service.DriverOrderService;

@WebServlet("/insertReqPrice.rq")
public class InsertReqPriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int price = Integer.parseInt(request.getParameter("reqPrice"));
		System.out.println("price :::: " + price);
		
		String priceReqNo = request.getParameter("priceReqNo");
		System.out.println("priceReqNo :::: " + priceReqNo);
		
		String driverNo = request.getParameter("driverNo");
		System.out.println("driverNo :::: " + driverNo);
		
		int result = new DriverOrderService().insertDriverOrder(price, priceReqNo, driverNo);
		
		String page = "";
		
		if(result > 0) {
			page = "/semi/driverJcarrylist.jc";
			
			response.sendRedirect(page);
		}else {
			page="views/common/errorPage.jsp";
			
			request.setAttribute("msg", "기사 견적 입찰 실패!");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
