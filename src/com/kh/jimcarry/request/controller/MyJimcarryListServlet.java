package com.kh.jimcarry.request.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jimcarry.member.model.vo.Member;
import com.kh.jimcarry.request.model.service.RequestService;
import com.kh.jimcarry.request.model.vo.PageInfo;
import com.kh.jimcarry.request.model.vo.Request;


@WebServlet("/myJcarrylist.jc")
public class MyJimcarryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MyJimcarryListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage=1;
		
		if(request.getParameter("currentPage") !=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			
		}
		
		
		limit=5;
		
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println(loginUser);
		String logUserNo = loginUser.getSeqNo();
		System.out.println(logUserNo);
		
		//전체목록갯수 리턴
		int listCount = new RequestService().getListCount(logUserNo);
		
		System.out.println("listcount : "+listCount);
		
		maxPage = (int)((double)listCount/limit+0.95);
		
		startPage = (((int)((double)currentPage/limit + 0.95))-1)*5+1;
		endPage = startPage+5-1;
		
		if(maxPage<endPage) {
			endPage=maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
		System.out.println(pi);
		
		ArrayList<Request> list = new RequestService().selectList(currentPage,limit,logUserNo);
		
		System.out.println("리스트 사이즈 : "+list.size());
		System.out.println("유저번호 : "+list.get(0).getUserNo());
		System.out.println("매칭상태 : "+list.get(0).getCondition());
		System.out.println("입찰 견적수 : "+list.get(0).getReqCount());
		System.out.println("예약시간  :"+list.get(0).getReservationTime());
		System.out.println("오더데이트  :" + list.get(0).getOrderDate());
		System.out.println(list.get(0).toString());
		
		String page="";
		
		if(list != null) {
			page = "views/request/jim_CarryList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "짐캐리 리스트 조회 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
