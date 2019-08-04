package com.kh.jimcarry.admin.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jimcarry.board.model.service.DPService;
import com.kh.jimcarry.board.model.vo.DP;

@WebServlet("/updatePreSelect.dp")
public class UpdatePreSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println("업데이트전 내용 셀렉트 num :: " + num);
		
		ArrayList<DP> selectDPList = new DPService().selectDPList(num);
		
		System.out.println("업데이트전 내용 셀렉트 selectDPList :: " + selectDPList);
		
		String page="";
		
		if(selectDPList != null) {
			page = "views/admin/board/admin_updateDPForm.jsp";
			
			HttpSession session = request.getSession();
			
			session.setAttribute("selectDPList", selectDPList);
			
			response.sendRedirect(page);
		}else {
			page = "views/common/admin_errorPage.jsp";
			
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
