package com.kh.jimcarry.request.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updatePopup.rq")
public class UpdateProPopupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] reqNorr = request.getParameterValues("rNo[]");
		String[] proNorr = request.getParameterValues("pNo[]");
		String[] proNamerr = request.getParameterValues("pName[]");	
		
		String reqNo = "";
		String proNo = "";
		String proName = "";
		
		
		if(reqNorr != null) {
			for(int i = 0; i < reqNorr.length; i++) {
				if(i == 0) {
					reqNo += reqNorr[i]; 
				}else {
					reqNo += ", " + reqNorr[i];
				}
			}
		}
		
		if(proNorr != null) {
			for(int i = 0; i < proNorr.length; i++) {
				if(i == 0) {
					proNo += proNorr[i];
				}else {
					proNo += ", " + proNorr[i];
				}
			}
		}
		
		if(proNamerr != null) {
			for(int i = 0; i < proNamerr.length; i++) {
				if(i == 0) {
					proName += proNamerr[i];
				}else {
					proName += ", " + proNamerr[i];
				}
			}
		}
		
		System.out.println("reqNo :::" + reqNo);
		System.out.println("proNo :::" + proNo);
		System.out.println("proName :::" + proName);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
