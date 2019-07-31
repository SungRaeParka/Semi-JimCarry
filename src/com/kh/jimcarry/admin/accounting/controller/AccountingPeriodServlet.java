package com.kh.jimcarry.admin.accounting.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.admin.accounting.model.service.AccountingService;
import com.kh.jimcarry.admin.accounting.model.vo.AccountingPeriod;

/**
 * Servlet implementation class AccountingPeriodServlet
 */
@WebServlet("/accounting.pr")
public class AccountingPeriodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountingPeriodServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String period = request.getParameter("period");
		System.out.println("period : " + period);

		ArrayList<AccountingPeriod> list = new AccountingService().period(period);

		String page ="";
		if(list != null) {
			page = "views/admin/accounting/admin_AccountPeriod.jsp";
			request.setAttribute("list", list);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "목록 조회 실패!");
		}
		System.out.println("list in servlet : " + list);

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
