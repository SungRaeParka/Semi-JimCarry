package com.kh.jimcarry.request.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.request.model.service.RequestService;
import com.kh.jimcarry.request.model.service.ReviewService;
import com.kh.jimcarry.request.model.vo.Reviews;


@WebServlet("/reqCompleted.jc")
public class ReqCompletedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ReqCompletedServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userNo = request.getParameter("userNo");
		String reqNo = request.getParameter("reqNo");
		String driverNo = request.getParameter("driverNo");
		
		int grade = Integer.parseInt(request.getParameter("grade"));
		String review = request.getParameter("review");
		
		System.out.println("서블릿 호출...");
		System.out.println(userNo);
		System.out.println(reqNo);
		System.out.println(driverNo);
		
		System.out.println(grade);
		System.out.println(review);
		
		Reviews rev = new Reviews();
		rev.setUserNo(userNo);
		rev.setDriverNo(driverNo);
		rev.setGrade(grade);
		rev.setReview(review);
		rev.setReqNo(reqNo);
		
		int result = new ReviewService().insertReviews(rev);
		
		if(result>0) {
			System.out.println("review정보 입력 성공");
		}else {
			System.out.println("review정보 입력 실패");
		}
		
		//기사 평점 구하기
		double gradeAvg = new ReviewService().countGrade(driverNo);
		System.out.println("기사 평점 : "+gradeAvg);
		
		//기사평점 업데이트
		double result3 = new ReviewService().updateGrade(driverNo,gradeAvg);
		
		if(result3>0) {
			System.out.println("기사 평점 평균 업데이트 성공");
		}else {
			System.out.println("기사 평점 평균 업데이트 실패");
		}
		
		
		
		int result1 = new RequestService().updateConditionReq2(reqNo);
		System.out.println("result1:"+result1);
		
		int result2 = new RequestService().updateConditionDo2(reqNo,driverNo);
		System.out.println("result1:"+result1);
		
		if(result1>0 && result2>0) {
			System.out.println("이용완료 업데이트 성공");
		}else {
			System.out.println("이용완료 업데이트 실패");
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
