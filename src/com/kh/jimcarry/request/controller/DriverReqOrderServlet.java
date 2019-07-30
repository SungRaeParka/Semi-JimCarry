package com.kh.jimcarry.request.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.request.model.service.RequestService;

@WebServlet("/driverOrder.rq")
public class DriverReqOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<HashMap<String, Object>> reqNoList = new RequestService().selectreqNoList();		
		System.out.println("driverreqOrder reqNolist : " + reqNoList);
		
		ArrayList<HashMap<String, Object>> reqList = new RequestService().selectReqList(reqNoList);
		System.out.println("driverreqOrder reqList : " + reqList);
		
		String page = "";
		
		if(reqNoList != null && reqList != null) {
			page = "views/request/driver_ReqOrder.jsp";
			
			request.setAttribute("reqNoList", reqNoList);
			request.setAttribute("reqList", reqList);			
		}else {
			page = "views/common/errorPage.jsp";
			
			request.setAttribute("msg", "회원 견적 정보 조회 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
