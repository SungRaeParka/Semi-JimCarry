package com.kh.jimcarry.request.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jimcarry.request.model.service.RequestService;
import com.kh.jimcarry.request.model.vo.Request;

@WebServlet("/insert.rq")
public class InsertRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] proName = request.getParameterValues("proName");
		String[] proKind = request.getParameterValues("proKind");
		int bookCount = Integer.parseInt(request.getParameter("proTdcount19a"));
		int boxCount = Integer.parseInt(request.getParameter("proTdcount20a"));
		
		Request r = new Request();
		
		r.setProName(proName);
		r.setProKind(proKind);
		r.setBookCount(bookCount);
		r.setBoxCount(boxCount);
		
		for(int i = 0; i < proName.length; i++) {
			System.out.println(proName[i]);
		}
		
		int result = new RequestService().insertRequest(r);		
		
		
		String page = "";
		
		if(result > 0) {
			page = "/semi/views/request/req_ProDetailSelect.jsp";
			
			HttpSession session = request.getSession();
			
			session.setAttribute("r", r);
			
			response.sendRedirect(page);
			
		}else {
			page = "views/common/errorPage.jsp";
			
			request.setAttribute("msg", "물품 선택 실패!");
			request.getRequestDispatcher(page).forward(request, response);			
		}
	
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
