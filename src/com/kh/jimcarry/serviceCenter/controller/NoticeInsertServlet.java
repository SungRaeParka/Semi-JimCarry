package com.kh.jimcarry.serviceCenter.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jimcarry.common.MyFileRenamePolicy;
import com.kh.jimcarry.member.model.vo.Member;
import com.kh.jimcarry.serviceCenter.model.service.OneQService;
import com.kh.jimcarry.serviceCenter.model.vo.Attachment;
import com.kh.jimcarry.serviceCenter.model.vo.OneQ;
import com.oreilly.servlet.MultipartRequest;

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
		
		/*String memberNo = request.getParameter("name");
		System.out.println(memberNo);*/
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		int maxSize = 1024*1024*10;
		
		String root = request.getSession().getServletContext().getRealPath("/");
		
		System.out.println("root : "+root);
		
		String savePath = root + "images_uploadFiles/";
		
		MultipartRequest multiRequest = 
				new MultipartRequest(request, savePath, maxSize,"UTF-8", new MyFileRenamePolicy());
		
		
		ArrayList<String> saveFiles = new ArrayList<String>();
		
		ArrayList<String> originFiles = new ArrayList<String>();
		
		
		
		Enumeration<String> files=multiRequest.getFileNames();
		
		while (files.hasMoreElements()) {
			String name = files.nextElement();
			
			saveFiles.add(multiRequest.getFilesystemName(name));
			originFiles.add(multiRequest.getOriginalFileName(name));
			
		}
		String answer = multiRequest.getParameter("answerCheck");
		String member=multiRequest.getParameter("name");
		System.out.println("유저넘버 ::: " + member);
		String postTitle = multiRequest.getParameter("postTitle");
		System.out.println("제목 ::::" + postTitle);
		String postContent=multiRequest.getParameter("postContent");
		String postType=multiRequest.getParameter("postType");
		String question=multiRequest.getParameter("questionCheck");
		String attachment = multiRequest.getParameter("attachment");
		
		System.out.println("유형 : "+postType);
		System.out.println("라디오버튼"+question);
		OneQ one = new OneQ();
		
		one.setMemberNo(member);
		one.setAnswerCheck(answer);
		one.setPostTitle(postTitle);
		one.setPostContent(postContent);
		postType="1:1문의";
		one.setPostType(postType);
		one.setQuestionType(question);
		one.setAttachment(attachment);
		
		
		ArrayList<Attachment> fileList = new ArrayList<Attachment>();
		
		for (int i = originFiles.size() - 1; i >= 0; i--) {
			Attachment tm = new Attachment();
			
			tm.setFilePath(savePath);
			tm.setOriginName(originFiles.get(i));
			tm.setChangeName(saveFiles.get(i));
			tm.setAttachType(question);
			
			fileList.add(tm);
		}
		
		int result = new OneQService().insertOneQ(one,fileList);
		
		 if (result > 0) {
				response.sendRedirect(request.getContextPath() + "/noticelist.no");
			} else {
				
				for (int i = 0; i < saveFiles.size(); i++) {
					File failed = new File(savePath + saveFiles.get(i));
					failed.delete();
				}
				request.setAttribute("msg", "1:1문의 등록 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		
/*		 String ques*ionType=request.getParameter("questType");
		 String postTitle=request.getParameter("postTitle")*;
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
		 //one.setPostDate(day);
		// one.setAnswer(answer);
		 
		 System.out.println("insert 1:1" +one);
	
		 int result = new OneQService().insertOneQ(one);
		 
		 String page="";
	
		 if (result > 0) {
			response.sendRedirect("/jimcarry/selectList.no");
		} else {
			page="view/common/errorPage.jsp";
			request.setAttribute("msg", "1:1문의 등록 실패");
			request.getRequestDispatcher(page).forward(request, response);
		}*/
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
