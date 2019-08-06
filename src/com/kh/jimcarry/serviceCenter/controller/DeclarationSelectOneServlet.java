package com.kh.jimcarry.serviceCenter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.serviceCenter.model.service.DeclarationService;
import com.kh.jimcarry.serviceCenter.model.vo.Declaration;

/**
 * Servlet implementation class DeclarationSelectOneServlet
 */
@WebServlet("/SelectOne.de")
public class DeclarationSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeclarationSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String num = request.getParameter("num3");
		
		Declaration de = new DeclarationService().selectOne(num);
		
		String page = "";
		
		if (de != null) {
			page="views/board/user_DetailDe.jsp";
			request.setAttribute("de", de);
		} else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "신고합니다 상세보기 실패");
		}
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
