package com.kh.jimcarry.admin.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.admin.member.model.service.MemberService;
import com.kh.jimcarry.admin.member.model.vo.Member;

/**
 * Servlet implementation class SelectAllUser
 */
@WebServlet("/selectAll.u")
public class SelectAllUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAllUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Member> list = new MemberService().selectAll();

		String page ="";

		if(list != null) {
			page = "views/admin/memberMng/admin_UserMng.jsp";
			request.setAttribute("list", list);
		}else {
			page = "views/common/erroPage.jsp";
			request.setAttribute("msg", "목록 조회 실패!");
		}
		System.out.println("SelectAllUser.svl list : " + list);

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
