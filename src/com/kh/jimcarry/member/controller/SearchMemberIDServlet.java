package com.kh.jimcarry.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.member.model.service.MemberService;
import com.kh.jimcarry.member.model.vo.Member;

@WebServlet("/searchID.me")
public class SearchMemberIDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("아이디 찾기 서블릿 들어옴");
		String phone = request.getParameter("allPhone");
		String userName = request.getParameter("userName");
		
		System.out.println("phone :::: " + phone);
		System.out.println("userName :::: " + userName);
		
		Member m = new MemberService().searchId(phone, userName);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String userId = m.getUserId();		
	        
	    System.out.println("check :::: " + userId);	        
	        
	    response.setContentType("application/json");
	        
	    PrintWriter a = response.getWriter();
	        
	    a.print(userId); 
	        
	    a.flush();
	    a.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
