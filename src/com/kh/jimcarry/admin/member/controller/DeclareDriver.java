package com.kh.jimcarry.admin.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.admin.member.model.service.MemberService;
import com.kh.jimcarry.admin.member.model.vo.Declaration;

/**
 * Servlet implementation class DeclareDriver
 */
@WebServlet("/dclare.d")
public class DeclareDriver extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeclareDriver() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Declaration> list = new MemberService().selectAllDc();

		String page ="";

		if(list != null) {
			page = "views/admin/memberMng/admin_DeclareDriverMng.jsp";
			request.setAttribute("list", list);
		}else {
			page = "views/common/erroPage.jsp";
			request.setAttribute("msg", "목록 조회 실패!");
		}
		System.out.println("SelectAllDc.svl list : " + list);

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
