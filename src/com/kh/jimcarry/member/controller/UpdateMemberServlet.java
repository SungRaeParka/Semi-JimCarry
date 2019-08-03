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
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet("/update.me")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String seqNo = request.getParameter("seqNo");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("password");
		String userName = request.getParameter("userName");
		String tel4 = request.getParameter("tel4");
		String tel5 = request.getParameter("tel5");
		String tel6 = request.getParameter("tel6");
		String phone = tel4 + "-" + tel5 + "-" + tel6;
		System.out.println(userPwd);
		System.out.println(phone);
		
		Member m = new Member();
		m.setUserId(userId);
		m.setUserPwd(userPwd);
		m.setPhone(phone);
		m.setUserName(userName);
		m.setSeqNo(seqNo);
		System.out.println(m);
		
		
		int result = new MemberService().updateMember(m);
		
		String page = "";
		
		if(result > 0) {
			page = "views/member/UserMyPage.jsp";
			response.sendRedirect(page);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "회원정보 수정 실패");
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
