package com.kh.jimcarry.admin.accounting.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.admin.accounting.model.service.AccountingService;
import com.kh.jimcarry.admin.accounting.model.vo.AccountingMember;

/**
 * Servlet implementation class AccountingMemberUpdateServlet
 */
@WebServlet("/AccountingUpdate.mm")
public class AccountingMemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountingMemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String calCheckBtnVal = request.getParameter("calCheckBtnVal");
		String payNoVal = request.getParameter("payNoVal");
		String memberSelect = "기사";


		System.out.println("calCheckBtnVal in controller : " + calCheckBtnVal);
		System.out.println("payNoVal in controller : " + payNoVal);


			ArrayList<AccountingMember> list = new AccountingService().updateMember(calCheckBtnVal, payNoVal, memberSelect);

				String page ="";

				if(list != null) {
					page = "/semi/accounting.mm?memberSelect=기사";
//					request.setAttribute("list", list);
					response.sendRedirect(page);
				}else {
					page = "views/common/admin_errorPage.jsp";
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
