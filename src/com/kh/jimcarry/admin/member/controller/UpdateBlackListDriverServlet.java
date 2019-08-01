package com.kh.jimcarry.admin.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.admin.member.model.service.MemberService;
import com.kh.jimcarry.admin.member.model.vo.BlackList;

/**
 * Servlet implementation class UpdateBlackListDriverServlet
 */
@WebServlet("/updateBlackList.d")
public class UpdateBlackListDriverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBlackListDriverServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		double resultD = Double.parseDouble(request.getParameter("resultD"));
		String driverNo = request.getParameter("driverNo");
		String prompt = request.getParameter("prompt");


		System.out.println("resultD in controller : " + resultD);
		System.out.println("driverNo in controller : " + driverNo);
		System.out.println("prompt in controller : " + prompt);


			ArrayList<BlackList> list = new MemberService().updateBlackListDriver(resultD, driverNo, prompt);

				String page ="";

				if(list != null) {
					page = "/semi/blackList.d";
//					request.setAttribute("list", list);
					response.sendRedirect(page);
				}else {
					page = "views/common/errorPage.jsp";
					request.setAttribute("msg", "목록 조회 실패!");
					request.getRequestDispatcher(page).forward(request, response);
				}
				System.out.println("SelectAllDriver.svl list : " + list);


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
