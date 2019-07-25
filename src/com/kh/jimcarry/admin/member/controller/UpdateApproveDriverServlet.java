package com.kh.jimcarry.admin.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.jimcarry.admin.member.model.service.MemberService;
import com.kh.jimcarry.member.model.vo.Member;

/**
 * Servlet implementation class UpdateApproveDriverServlet
 */
@WebServlet("/updateApprove.d")
public class UpdateApproveDriverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateApproveDriverServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String yesD = request.getParameter("yesD");
		String driverNo = request.getParameter("driverNo");

		System.out.println("yesD in controller : " + yesD);
		System.out.println("driverNo in controller : " + driverNo);

		ArrayList<Member> list = new MemberService().UdateApproveDriver(yesD, driverNo);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(list, response.getWriter());
//		String page ="";
//
//		if(list != null) {
//			page = "views/admin/memberMng/admin_ApproveDriverMng.jsp";
//			request.setAttribute("list", list);
//		}else {
//			page = "views/common/erroPage.jsp";
//			request.setAttribute("msg", "목록 조회 실패!");
//		}
//		System.out.println("SelectAllDriver.svl list : " + list);
//
//		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
