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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String resultD = request.getParameter("resultD");
		String driverNo = request.getParameter("driverNo");
		String prompt = request.getParameter("prompt");
		String refundSelect = request.getParameter("refundSelect");


		System.out.println("resultD in controller : " + resultD);
		System.out.println("driverNo in controller : " + driverNo);
		System.out.println("prompt in controller : " + prompt);

		ArrayList<AccountingRefund> list = new AccountingService().updateRefund(resultD, driverNo, prompt,refundSelect);

		String page ="";

		if(list != null) {
			page = "/semi/accounting.rf";
//			request.setAttribute("list", list);
			response.sendRedirect(page);
		}else {
			page = "views/common/errorPage.jsp";
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
