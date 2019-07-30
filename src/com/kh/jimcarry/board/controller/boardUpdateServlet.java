package com.kh.jimcarry.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSpinnerUI;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.jimcarry.board.model.vo.Board;
import com.kh.jimcarry.common.MyFileRenamePolicy;
import com.kh.jimcarry.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;
import com.sun.org.apache.bcel.internal.generic.CPInstruction;

/**
 * Servlet implementation class boardUpdateServlet
 */
@WebServlet("/update.bo")
public class boardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (ServletFileUpload.isMultipartContent(request)) {
			// 전송 파일 용량 제한 : 10Mbyte로 제한
			int maxSize = 1024 * 1024 * 10;

			// 웹서버 컨테이너 경로 추출
			String root = request.getSession().getServletContext().getRealPath("/");

			System.out.println(root);
			// 파일 저장 경로(web/thumbnail_uploadFiles)
			String savePath = root + "images_uploadFiles/";

			System.out.println("root" + root);
			// FileRenamePolicy 상속 후 오버라이딩
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			// 다중파일을 묶어서 업로드를 하기 위해 컬렉션 이용
			// 저저장한 파일(변경된 파일의) 이름을 저장할 ArrayLIst 객체 생성
			ArrayList<String> saveFiles = new ArrayList<String>();
			// 원본 파일의 이름을 저장할 ArrayList 생성
			ArrayList<String> originFiles = new ArrayList<String>();

			String multiTitle = multiRequest.getParameter("btitle");
			String multiiContent = multiRequest.getParameter("bcontent");
			String pagebno = multiRequest.getParameter("pagebno");
			String img1 =  multiRequest.getParameter("img1");
			String img2 =  multiRequest.getParameter("img2");

			System.out.println("img1 : " + img1);
			System.out.println("img2 : " + img2);
			System.out.println("multiTitle : "  + multiTitle);
			System.out.println("multiiContent" + multiiContent);
			System.out.println("pagebno : " + pagebno);



			Board b = new Board();
			b.setPostTitle(multiTitle);
			b.setPostContents(multiiContent);
			b.setPostCode(pagebno);

			System.out.println("updateservlet : " + b);


			// 파일이 전송된 이름을 반환한다.
			Enumeration<String> files = multiRequest.getFileNames();

			while (files.hasMoreElements()) {

				// 파일 리턴
				String name = files.nextElement();

				if(name == null) {
					String str1 = img1;
					String str2 = img2;

				}else if(name != null)

				System.out.println("name " + name);

				// 저장된 이름 가져올떄
				saveFiles.add(multiRequest.getFilesystemName(name));
				// 원본 파일저장할떄
				originFiles.add(multiRequest.getOriginalFileName(name));


				System.out.println("filesSystem name : " + multiRequest.getFilesystemName(name));
				System.out.println("OriginalFile name : " + multiRequest.getOriginalFileName(name));
			}






		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
