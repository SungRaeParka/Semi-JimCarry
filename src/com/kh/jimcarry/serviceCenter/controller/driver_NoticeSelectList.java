package com.kh.jimcarry.serviceCenter.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.serviceCenter.model.service.DeclarationService;
import com.kh.jimcarry.serviceCenter.model.service.NoticeService;
import com.kh.jimcarry.serviceCenter.model.service.OneQService;
import com.kh.jimcarry.serviceCenter.model.service.QandAService;
import com.kh.jimcarry.serviceCenter.model.vo.Declaration;
import com.kh.jimcarry.serviceCenter.model.vo.Notice;
import com.kh.jimcarry.serviceCenter.model.vo.OneQ;
import com.kh.jimcarry.serviceCenter.model.vo.PageInfo;
import com.kh.jimcarry.serviceCenter.model.vo.QandA;

@WebServlet("/driverNoticeSelect.de")
public class driver_NoticeSelectList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;
		int currentPage1;
		int currentPage2;
		int currentPage3;
		int limit;
		int limit1;
		int limit2;
		int limit3;
		int maxPage;
		int maxPage1;
		int maxPage2;
		int maxPage3;
		int startPage;
		int startPage1;
		int startPage2;
		int startPage3;
		int endPage;
		int endPage1;
		int endPage2;
		int endPage3;
		
		
		currentPage =1 ;
		currentPage1 =1 ;
		currentPage2 =1 ;
		currentPage3 =1 ;
		
		/*if(request.getParameter("currentPage")!= null 
				&& request.getParameter("currentPage1")!= null 
				&& request.getParameter("currentPage2")!= null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			currentPage1 = Integer.parseInt(request.getParameter("currentPage1"));
			currentPage2 = Integer.parseInt(request.getParameter("currentPage2"));
		}*/
		
		if (request.getParameter("currentPage")!= null ) 
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		if (request.getParameter("currentPage1")!= null ) 
			currentPage1 = Integer.parseInt(request.getParameter("currentPage1"));
		if (request.getParameter("currentPage2")!= null ) 
			currentPage2 = Integer.parseInt(request.getParameter("currentPage2"));
		if (request.getParameter("currentPage3")!= null ) 
			currentPage3 = Integer.parseInt(request.getParameter("currentPage3"));
		
		limit = 10;
		limit1 = 10;
		limit2 = 10;
		limit3 = 10;
		
		int listCount = new NoticeService().getListCount();
		int listCount1 = new QandAService().getListCount();
		int listCount2=new OneQService().getListCount();
		int listCount3=new DeclarationService().getListCount();
		
		System.out.println("count : "+listCount);
		System.out.println("count1 : "+listCount1);
		System.out.println("count2 : "+listCount2);
		System.out.println("count3 : "+listCount3);
		
		maxPage = (int)((double)listCount / limit + 0.9);
		maxPage1 = (int)((double)listCount1/ limit1 + 0.9);
		maxPage2=  (int)((double)listCount2 / limit2 + 0.9);
		maxPage3=  (int)((double)listCount3 / limit3 + 0.9);
		
		startPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 10 + 1;
		startPage1 = (((int)((double) currentPage1 / limit1 + 0.9)) - 1) * 10 + 1;
		startPage2 = (((int)((double) currentPage2 / limit2 + 0.9)) - 1) * 10 + 1;
		startPage3 = (((int)((double) currentPage3 / limit3 + 0.9)) - 1) * 10 + 1;
		
		endPage = startPage + 10 - 1;
		endPage1 = startPage1 + 10 - 1;
		endPage2 = startPage2 + 10 - 1;
		endPage3 = startPage3 + 10 - 1;
		
		if(maxPage < endPage&& maxPage1 < endPage1 && maxPage2 < endPage2 && maxPage3 < endPage3) {
			endPage= maxPage;
			endPage1= maxPage1;
			endPage2= maxPage2;
			endPage3= maxPage3;
		}
		
		PageInfo pi = 
				new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		PageInfo pi1 = 
				new PageInfo(currentPage1, listCount1, limit1, maxPage1, startPage1, endPage1);
		PageInfo pi2=
				new PageInfo(currentPage2, listCount2, limit2, maxPage2, startPage2, endPage2);
		PageInfo pi3=
				new PageInfo(currentPage3, listCount3, limit3, maxPage3, startPage3, endPage3);
		
		
		ArrayList<Notice> list = new NoticeService().selectList(currentPage, limit);
		ArrayList<QandA> list1=new QandAService().selectList(currentPage1, limit1);
		ArrayList<OneQ> list2=new OneQService().selectList(currentPage2, limit2);
		ArrayList<Declaration> list3=new DeclarationService().selectList(currentPage3, limit3);
		
		
		System.out.println("list1 : " + list1.size());
		System.out.println("list2 : " + list2.size());
		
		
		String page = "";
		
		if (list != null || list1 != null || list2 != null || list3 != null) {
			page="views/board/driver_Qna1on1List.jsp";
			request.setAttribute("list", list);
			request.setAttribute("list1", list1);
			request.setAttribute("list2", list2);
			request.setAttribute("list3", list3);
			request.setAttribute("pi", pi);
			request.setAttribute("pi1", pi1);
			request.setAttribute("pi2", pi2);
			request.setAttribute("pi3", pi3);
		} else {
			if (list ==null) {
				page="views/common/errorPage.jsp";
				request.setAttribute("msg", "공지사항 조회 실패!");
				} else if(list1 == null) { 
				page="views/common/errorPage.jsp";
				request.setAttribute("msg", "Q&A 조회 실패!");
			}else if(list2 == null){
				page="views/common/errorPage.jsp";
				request.setAttribute("msg", "1:1문의 조회 실패!");
			}else {
				page="views/common/errorPage.jsp";
				request.setAttribute("msg", "신고 합니다 조회 실패!");
			}
		}
		
		
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
