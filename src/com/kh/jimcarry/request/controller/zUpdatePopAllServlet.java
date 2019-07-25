package com.kh.jimcarry.request.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateAll.pr")
public class zUpdatePopAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String proNo_Ref = request.getParameter("proNo_Ref2");
		String[] proTyperr = request.getParameterValues("proType_Ref2");
		String[] proSizerr = request.getParameterValues("proSize_Ref2");
		
		System.out.println("hiddentag no 값 : "+proNo_Ref);
		
		for(int i = 0; i < proTyperr.length; i++) {
			System.out.println("hiddentag type 값 : " + proTyperr[i]);
			System.out.println("hiddentag size 값 : " + proSizerr[i]);			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
