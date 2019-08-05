package com.kh.jimcarry.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jimcarry.member.model.service.MemberService;
import com.kh.jimcarry.member.model.vo.DriverList;
import com.kh.jimcarry.member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("password");
		System.out.println(userId);
		System.out.println(userPwd);
		
		
		Member loginUser = new MemberService().loginCheck(userId, userPwd);
		Member loginDriver = new MemberService().driverLoginCheck(userId, userPwd);
		System.out.println( "테스트~ : " + loginDriver);
		String page = "";
		
		if(loginUser != null && loginUser.getStatusCheck().equals("N")) {
			if(loginUser.getUserId().contains("admin")) {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				
				response.sendRedirect("/semi/selectAll.u");
			}else if(loginUser.getSeqNo().contains("U")) {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				session.setAttribute("loginDriver", loginDriver);
				
				response.sendRedirect("views/mainPage.jsp");
			}else if(loginUser.getSeqNo().contains("D")) {
					HttpSession session = request.getSession();
					session.setAttribute("loginUser", loginUser);
					session.setAttribute("loginDriver", loginDriver);
					response.sendRedirect("views/driver_MainPage.jsp");
				}
			}else {
				request.setAttribute("msg", "로그인 실패");
      
				request.getRequestDispatcher("views/common/login_errorPage.jsp").forward(request, response);				
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
