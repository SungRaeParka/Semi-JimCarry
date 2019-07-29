package com.kh.jimcarry.request.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jimcarry.request.model.service.RequestService;
import com.kh.jimcarry.request.model.vo.Request;
import com.kh.jimcarry.request.model.vo.ShowRP;

@WebServlet("/insertreq.rq")
public class InsertRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Request r = new Request();
		
		String reservDate = request.getParameter("dateInfo");	 
		String spInfo = request.getParameter("spInfo");
		String apInfo = request.getParameter("apInfo");
		System.out.println(apInfo);
		String memberNo = request.getParameter("memberNo");
		String reqNo = request.getParameter("reqNo");
		String proNo = request.getParameter("proNo");
		String memo = request.getParameter("memo");	
		
		int finishDate = Integer.parseInt(request.getParameter("finishDate"));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");		
		
		System.out.println("서블릿 reservDate :: " + reservDate);
		
		Calendar now = Calendar.getInstance();
		now.setTime(new Date());
		now.add(Calendar.DATE, finishDate);
		
		String now2 = sdf.format(now.getTime());
		
		Date reqFinish;
		try {
			reqFinish = sdf.parse(now2);
			r.setReqFinish(reqFinish);
		} catch (ParseException e) {
			e.printStackTrace();
		}		
		
		r.setReservationDate(reservDate);
		System.out.println("서블릿 r.getReservatedate :: " + r.getReservationDate());
		r.setStartPoint(spInfo);
		r.setArrivalPoint(apInfo);
		r.setUserNo(memberNo);
		r.setReqNo(reqNo);
		r.setProNo(proNo);
		r.setMemo(memo);		
		
		int result = new RequestService().insertRequest(r);	
		
		
		ShowRP requestInfo = new RequestService().selectRequestInfo(reqNo);
		ArrayList<HashMap<String, Object>> requestImg = new RequestService().selectRequestImg(reqNo);
		ArrayList<HashMap<String, Object>> productInfo = new RequestService().selectProductInfo(reqNo);
		
		System.out.println("서블릿 requestImg:::" + requestImg);
		System.out.println("서블릿 ProductInfo ::: " + productInfo);
		
		String page = "";
		
		if(result > 0) {
			page = "/semi/views/request/req_lastReq.jsp";
			
			HttpSession session = request.getSession();
			
			session.setAttribute("requestInfo", requestInfo);		
			session.setAttribute("requestImg", requestImg);
			session.setAttribute("productInfo", productInfo);
			
			response.sendRedirect(page);
		}else {
			page = "views/common/errorPage.jsp";
			
			request.setAttribute("msg", "견적 생성 실패!");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
