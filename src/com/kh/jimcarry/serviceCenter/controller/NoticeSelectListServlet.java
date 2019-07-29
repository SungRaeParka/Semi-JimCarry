package com.kh.jimcarry.serviceCenter.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.board.model.service.BoardService;
import com.kh.jimcarry.board.model.vo.PageInfo;
import com.kh.jimcarry.serviceCenter.model.service.NoticeService;
import com.kh.jimcarry.serviceCenter.model.service.OneQService;
import com.kh.jimcarry.serviceCenter.model.service.QandAService;
import com.kh.jimcarry.serviceCenter.model.vo.Notice;
import com.kh.jimcarry.serviceCenter.model.vo.OneQ;
import com.kh.jimcarry.serviceCenter.model.vo.QandA;

/**
 * Servlet implementation class NoticeSelectServlet
 */
@WebServlet("/noticelist.no")
public class NoticeSelectListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeSelectListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage =1 ;
		
		if(request.getParameter("currentPage")!= null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		int listCount = new BoardService().getListCount();
		
		System.out.println("count : "+listCount);
		
		maxPage = (int)((double)listCount / limit + 0.9);
		
		startPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 10 + 1;
		
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage= maxPage;
		}
		
		PageInfo pi = 
				new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<Notice> list = new NoticeService().selectList(currentPage, limit);
		ArrayList<QandA> list1=new QandAService().selectList(currentPage, limit);
		ArrayList<OneQ> list2=new OneQService().selectList(currentPage, limit);
		
		String page = "";
		
		if (list != null && list1 != null && list2 != null) {
			page="views/board/user_Qna1on1List.jsp";
			request.setAttribute("list", list);
			request.setAttribute("list1", list1);
			request.setAttribute("list2", list2);
			request.setAttribute("pi", pi);
		} else {
			if (list ==null) {
				page="views/common/errorPage.jsp";
				request.setAttribute("msg", "공지사항 조회 실패!");
			} else if(list1 == null) { 
				page="views/common/errorPage.jsp";
				request.setAttribute("msg", "Q&A 조회 실패!");
			}else {
				page="views/common/errorPage.jsp";
				request.setAttribute("msg", "1:1문의 조회 실패!");
			}
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
