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
		String resultD = request.getParameter("resultD");
		String driverNo = request.getParameter("driverNo");
		String prompt = request.getParameter("prompt");


		System.out.println("resultD in controller : " + resultD);
		System.out.println("driverNo in controller : " + driverNo);
		System.out.println("prompt in controller : " + prompt);

		if(prompt != null) {
			ArrayList<Member> list = new MemberService().UdateRefuseDriver(resultD, driverNo, prompt);

				String page ="";

				if(list != null) {
					page = "/semi/approve.d";
//					request.setAttribute("list", list);
					response.sendRedirect(page);
				}else {
					page = "views/common/erroPage.jsp";
					request.setAttribute("msg", "목록 조회 실패!");
					request.getRequestDispatcher(page).forward(request, response);
				}
				System.out.println("SelectAllDriver.svl list : " + list);

		}else {
			ArrayList<Member> list = new MemberService().UdateApproveDriver(resultD, driverNo);

			String page ="";

			if(list != null) {
				page = "/semi/approve.d";
//				request.setAttribute("list", list);
				response.sendRedirect(page);
			}else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "목록 조회 실패!");
				request.getRequestDispatcher(page).forward(request, response);
			}
			System.out.println("SelectAllDriver.svl list : " + list);

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
