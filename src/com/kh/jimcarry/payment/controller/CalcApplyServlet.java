package com.kh.jimcarry.payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.request.model.service.RequestService;


@WebServlet("/calcApply.py")
public class CalcApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public CalcApplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String driverNo = request.getParameter("driver");
		String reqNo = request.getParameter("reqNo");
		int price = Integer.parseInt(request.getParameter("price"));
		int calc = Integer.parseInt(request.getParameter("calc"));
		
		System.out.println("서블릿 호출...");
		System.out.println(driverNo);
		System.out.println(reqNo);
		System.out.println(price);
		System.out.println(calc);
		
		int result = new RequestService().updateConditionDo3(reqNo,driverNo);
		System.out.println("result:" + result);
		
		if(result>0) {
			System.out.println("정산신청 업데이트 성공");
		}else {
			System.out.println("정산신청 업데이트 실패");
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
