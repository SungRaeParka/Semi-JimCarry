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
 * Servlet implementation class InsertMemberServlet
 */
@WebServlet("/insert.me")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//	request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("password");
		String userName = request.getParameter("userName");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String phone = tel1 + "-" + tel2 + "-" + tel3;
		
		System.out.println(userId);
		System.out.println(userPwd);
		System.out.println(userName);
		System.out.println(phone);
		
		Member m = new Member();
		m.setUserId(userId);
		m.setUserPwd(userPwd);
		m.setUserName(userName);
		m.setPhone(phone);
		
		int result = new MemberService().insertMember(m);
		System.out.println(m);
		
		String page = "";
		
		if(result > 0) {
			page = "views/member/MemberLoginForm.jsp";
			
			response.sendRedirect(page);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "회원 가입실패!");
			
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
