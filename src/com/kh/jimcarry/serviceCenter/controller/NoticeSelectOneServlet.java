package com.kh.jimcarry.serviceCenter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.serviceCenter.model.service.NoticeService;
import com.kh.jimcarry.serviceCenter.model.service.OneQService;
import com.kh.jimcarry.serviceCenter.model.service.QandAService;
import com.kh.jimcarry.serviceCenter.model.vo.Notice;
import com.kh.jimcarry.serviceCenter.model.vo.OneQ;
import com.kh.jimcarry.serviceCenter.model.vo.QandA;

/**
 * Servlet implementation class NoticeSelectOneServlet
 */
@WebServlet("/selectOne.no")
public class NoticeSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("num"));

		Notice n = new NoticeService().selectOne(num);
		QandA qa = new QandAService().selectOneQA(num);
		OneQ one = new OneQService().selectOneQ(num);
		
		String page="";
		
		if(n !=null) {
			//나중에 페이지 바꾸기
			page="view/board/user_Insert1on1.jsp";
			request.setAttribute("n", n);
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 상세보기 실패!");
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
