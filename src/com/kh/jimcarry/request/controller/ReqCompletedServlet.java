package com.kh.jimcarry.request.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/reqCompleted.jc")
public class ReqCompletedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ReqCompletedServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int grade = Integer.parseInt(request.getParameter("grade"));
		String review = request.getParameter("review");
		
		System.out.println(grade);
		System.out.println(review);
		
		/*int result1 = new RequestService().update*/
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
