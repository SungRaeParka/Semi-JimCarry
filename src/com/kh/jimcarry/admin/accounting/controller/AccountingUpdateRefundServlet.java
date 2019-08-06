package com.kh.jimcarry.admin.accounting.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.admin.accounting.model.service.AccountingService;
import com.kh.jimcarry.admin.accounting.model.vo.AccountingRefund;

/**
 * Servlet implementation class AccountingUpdateRefundServlet
 */
@WebServlet("/accountingUpdate.rf")
public class AccountingUpdateRefundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AccountingUpdateRefundServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String refundBtnVal = request.getParameter("refundBtnVal");
		String payNoVal = request.getParameter("payNoVal");
		String promptVal = request.getParameter("promptVal");
		String refundSelect = request.getParameter("refundSelect");

		System.out.println("refundBtnVal in controller : " + refundBtnVal);
		System.out.println("payNoVal in controller : " + payNoVal);
		System.out.println("promptVal in controller : " + promptVal);
		System.out.println("refundSelect in controller : " + refundSelect);

		if (promptVal != null) {
			ArrayList<AccountingRefund> list = new AccountingService().updateNoRefund(refundBtnVal, payNoVal, promptVal,
					refundSelect);

			String page = "";

			if (list != null) {
				page = "/semi/accounting.rf";
				// request.setAttribute("list", list);
				response.sendRedirect(page);
			} else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "목록 조회 실패!");
				request.getRequestDispatcher(page).forward(request, response);
			}
			System.out.println("SelectAllDriver.svl list : " + list);
		} else {

			ArrayList<AccountingRefund> list = new AccountingService().updateYesRefund(refundBtnVal, payNoVal,
					refundSelect);

			String page = "";

			if (list != null) {
				page = "/semi/accounting.rf";
				// request.setAttribute("list", list);
				response.sendRedirect(page);
			} else {
				page = "views/common/admin_errorPage.jsp";
				request.setAttribute("msg", "목록 조회 실패!");
				request.getRequestDispatcher(page).forward(request, response);
			}
			System.out.println("SelectAllDriver.svl list : " + list);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
