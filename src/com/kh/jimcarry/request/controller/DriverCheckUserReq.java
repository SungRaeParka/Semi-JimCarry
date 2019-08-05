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
import com.kh.jimcarry.request.model.vo.ShowRP;
@WebServlet("/driverckureq.rq")

public class DriverCheckUserReq extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		String reqNo = request.getParameter("reqNo");		
		System.out.println("reqNo :: " + reqNo);
		
		ArrayList<HashMap<String, Object>> tempReqNoList = new RequestService().selectreqNoList();		
		System.out.println("reqNoList ::" + tempReqNoList);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();		
		
		for(int i = 0; i < tempReqNoList.size(); i++) {
			hmap = tempReqNoList.get(i);
			
			System.out.println("hmap.get(reqNo) ::" + hmap.get("reqNo"));
			
			if(reqNo.equals(hmap.get("reqNo"))) {
				ShowRP requestInfo = new RequestService().selectRequestInfo3(reqNo);
				ArrayList<HashMap<String, Object>> requestImg = new RequestService().selectRequestImg3(reqNo);
				ArrayList<HashMap<String, Object>> productInfo = new RequestService().selectProductInfo3(reqNo);
				
				String page = "";
				
				if(requestInfo != null) {
					page = "/semi/views/request/driver_CheckReq.jsp";
					
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
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
