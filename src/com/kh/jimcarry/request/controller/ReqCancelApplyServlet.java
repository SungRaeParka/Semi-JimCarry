package com.kh.jimcarry.request.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.payment.model.service.PaymentService;
import com.kh.jimcarry.payment.model.service.RefundService;
import com.kh.jimcarry.payment.model.vo.Payment;
import com.kh.jimcarry.payment.model.vo.Refund;
import com.kh.jimcarry.request.model.service.RequestService;


@WebServlet("/reqCancelApply.jc")
public class ReqCancelApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ReqCancelApplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reqNo = request.getParameter("reqNo");
		String reason = request.getParameter("reason");
		int tempday = Integer.parseInt(request.getParameter("tempday"));
		int price = Integer.parseInt(request.getParameter("price"));
		
		System.out.println(reqNo);
		System.out.println(reason);
		System.out.println(tempday);
		System.out.println(price);
		
		int result1 = new RequestService().updateConditionReq4(reqNo);
		
		int result2 = new RequestService().updateConditionDo4(reqNo);
		
		if(result1>0 && result2>0) {
			System.out.println("취소 처리 완료");
			
		}else {
			System.out.println("취소 처리 실패");
		}
		
		int fees = 0;
		if(tempday<=0){
			fees = 0;
			
		}else if(tempday>=1 && tempday<=3){
			fees =(int)(price*0.3);
					
		}else if(tempday>=4 && tempday<=7){
			fees = (int)(price*0.7);
		}else{
			fees = price;
		}

		
		Refund ref = new RefundService().selectRefundPayInfo(reqNo);
		ref.setRefundReason(reason);
		ref.setRefundFees(fees);
		
		System.out.println("ref정보 생성 :::"+ref.toString());
		
		
		int result  = new RefundService().insertRefund(ref);
		
		if(result>0) {
			System.out.println("환불정보 입력 완료");
		}else {
			System.out.println("환불정보 입력 실패");
		}
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
