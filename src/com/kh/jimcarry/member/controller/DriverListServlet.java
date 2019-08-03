package com.kh.jimcarry.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.member.model.service.MemberService;
import com.kh.jimcarry.member.model.vo.DriverList;

/**
 * Servlet implementation class DriverListServlet
 */
@WebServlet("/driverList.me")
public class DriverListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<DriverList> list = new  MemberService().driverList();
		System.out.println("sdsd :"+list);
		String page ="";

		if(list != null) {
			page = "views/member/DriverMyPage2.jsp";
			request.setAttribute("list", list);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "목록 조회 실패!");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
