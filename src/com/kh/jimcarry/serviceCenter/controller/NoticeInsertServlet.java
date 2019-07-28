package com.kh.jimcarry.serviceCenter.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.serviceCenter.model.service.OneQService;
import com.kh.jimcarry.serviceCenter.model.vo.OneQ;

/**
 * Servlet implementation class NoticieInsertServlet
 */
@WebServlet("/notice.no")
public class NoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String questionType=request.getParameter("questType");
		 String postTitle=request.getParameter("postTitle");
		 String postContent=request.getParameter("postContent");
		 String date=request.getParameter("date");
		 String answer=request.getParameter("answer");
		 
		 System.out.println("date : " + date);
	
		 java.sql.Date day=null;
		 
		 if(!date.equals("")) {
			 
			 day=java.sql.Date.valueOf(date);
		 }else {
			 day=new java.sql.Date(new GregorianCalendar().getTimeInMillis());
		 }
		 
		 System.out.println("day :  "+day);
		 
		 OneQ one = new OneQ();
		 one.setQuestionType(questionType);
		 one.setPostTitle(postTitle);
		 one.setPostDate(day);
		 one.setAnswer(answer);
		 
		 System.out.println("insert 1:1" +one);
	
		 int result = new OneQService().insertOneQ(one);
		 
		 String page="";
	
		 if (result > 0) {
			response.sendRedirect("/jimcarry/notice.no");
		} else {
			page="view/common/errorPage.jsp";
			request.setAttribute("msg", "1:1문의 등록 실패");
			request.getRequestDispatcher(page).forward(request, response);
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
