package com.kh.jimcarry.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.member.model.service.MemberService;
import com.kh.jimcarry.member.model.vo.Member;

/**
 * Servlet implementation class DeleteMemberServlet
 */
@WebServlet("/delete.me")
public class DeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String status = "Y";
		System.out.println(status);
		String userId = request.getParameter("hid");
		System.out.println(userId);
		
		Member m = new Member();
		m.setStatusCheck(status);
		m.setUserId(userId);
		
		int result = new MemberService().userDelete(m);
		
		String page = "";
		if(result > 0) {
			page = "index.jsp";
			response.sendRedirect(page);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "회원탈퇴 실패!");
			request.getRequestDispatcher(page).forward(request, response);
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
