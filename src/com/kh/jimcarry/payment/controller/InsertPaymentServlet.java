package com.kh.jimcarry.payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.request.model.service.RequestService;
import com.kh.jimcarry.request.model.vo.Request;


@WebServlet("/insert.py")
public class InsertPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public InsertPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reqNo = request.getParameter("reqNo");
		String driverNo = request.getParameter("driverNo");
		
		System.out.println(reqNo);
		System.out.println(driverNo);
		
		
		
		int result1 = new RequestService().updateConditionReq(reqNo);
		System.out.println("result1:"+result1);
		
		int result2 = new RequestService().updateConditionDo(reqNo,driverNo);
		System.out.println("result2:"+result2);
		
		int result3 = new RequestService().updateConditionCancel(reqNo,driverNo);
		System.out.println("result3:"+result3);
		
		String page="";
		
		if(result1>0 && result2>0 && result3>=0) {
			System.out.println("로직처리 완료");
		}else {
			System.out.println("로직처리 실패");
		}
		
	
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
