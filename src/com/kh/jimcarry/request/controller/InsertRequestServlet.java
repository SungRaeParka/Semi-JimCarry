package com.kh.jimcarry.request.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jimcarry.request.model.service.ProductService;
import com.kh.jimcarry.request.model.vo.Product;

@WebServlet("/insert.rq")
public class InsertRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] proNamerr = request.getParameterValues("proName");
		String[] proKindrr = request.getParameterValues("proKind");
		String proName = "";
		String proKind = "";
		int bookCount = Integer.parseInt(request.getParameter("proTdcount19a"));
		int boxCount = Integer.parseInt(request.getParameter("proTdcount20a"));
		
		if(proNamerr != null) {
			for(int i = 0; i < proNamerr.length; i++) {
				if(i == 0) {
					proName += proNamerr[i];
				}else {
					proName += ", " + proNamerr[i];
				}
			}
		}
		
		if(proKindrr != null) {
			for(int i = 0; i < proKindrr.length; i++) {
				if(i == 0) {
					proKind += proKindrr[i];
				}else {
					proKind += ", " + proKindrr[i];
				}
			}
		}
		
		System.out.println("proKind::::" + proKind);
		
		Product r = new Product();
		
		r.setProName(proName);
		r.setProKind(proKind);
		r.setBookCount(bookCount);
		r.setBoxCount(boxCount);	
		
		int result = new ProductService().insertRequest(r);	
		
		System.out.println("insertrequest 수행 후 Request r :::" + r);
		
		/*if(boxCount > 0) {
			int result2 = new ProductService().insertBoxCount(r);			
		}
		
		if(bookCount > 0) {
			int result3 = new ProductService().insertBookCount(r);
		}*/
		
		String reqNo = new ProductService().selectReqNo();
		r.setReqNo(reqNo);
		System.out.println("select 수행 후 ReqNo ::: " + r.getReqNo());
		
		String proNo = new ProductService().selectProNo(reqNo); 
		r.setProNo(proNo);
		System.out.println("select 수행 후 ProNo ::: " + r.getProNo());
		
		
		String page = "";
		
		if(result > 0) {
			page = "views/request/req_ProDetailSelect.jsp";
			
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
