package com.kh.jimcarry.request.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.HashMap;

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
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String logUserNo = loginUser.getSeqNo();
		
		/*ArrayList<Request> list = new RequestService().selectList(logUserNo);
		System.out.println("견적리스트 조회"+list.size());
		
		Request req = null;
		
		Date startDay = new Date();
		Date finishDay = new Date(); 
		Date nowDay = new Date(); 
		
		long startTime;  
		long finishTime;  
		long nowTime;  
		
		for(int i=0 ; i<=list.size() ; i++) {
			req = list.get(i);
			
			startDay = req.getReqStart();
			finishDay = req.getReqFinish();
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			try {
				startDay = dateFormat.parse(dateFormat.format(startDay));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			startTime = startDay.getTime();
			
			try {
				finishDay = dateFormat.parse(dateFormat.format(finishDay));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finishTime = finishDay.getTime();
			
			try {
				nowDay = dateFormat.parse(dateFormat.format(nowDay));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			nowTime = nowDay.getTime();
			
			//견적매칭 종료일이 지났는데 매칭 대기상태일때 취소로 업데이트
			if(req.getConditionReq().equals("매칭대기") && nowTime >= finishTime) {
				
			}
			
			//매칭완료후 다음날지나면 이용완료로 업데이트
			if(req.getConditionReq().equals("매칭완료") && nowTime >= startTime) {
				
			}
		}
		*/
		
		
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage=1;
		
		if(request.getParameter("currentPage") !=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		
		//전체목록 갯수 리턴
		int listCount = new RequestService().getListCount(logUserNo);
		
		System.out.println("가가가listcount : "+listCount);
		
		
		String page="";
		
		if(listCount==0) {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "짐캐리 리스트가 없어요!");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
		
		limit=5;
		
		maxPage = (int)((double)listCount/limit+0.8);
		
		startPage = (((int)((double)currentPage/limit + 0.8))-1)*5+1;
		endPage = startPage+5-1;
		
		if(maxPage<endPage) {
			endPage=maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
		
		//리스트 조회(견적리스트)
		ArrayList<Request> jimList = new RequestService().selectList(currentPage,limit,logUserNo);
		System.out.println("견적리스트 조회"+jimList.get(0));
		
		
		
		//오더리스트 조회
		HashMap<String,Request> orderMap = new RequestService().selectOrderList(logUserNo);	
			
		
		if(jimList != null) {
			page = "views/request/jim_CarryList.jsp";
			request.setAttribute("jimList", jimList);
			request.setAttribute("pi", pi);
			request.setAttribute("orderMap", orderMap);
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "짐캐리 리스트 조회실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
