package com.kh.jimcarry.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.jimcarry.board.model.service.BoardService;
import com.kh.jimcarry.board.model.vo.Attachment;
import com.kh.jimcarry.board.model.vo.Board;
import com.kh.jimcarry.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class boardUpdateServlet
 */
@WebServlet("/update.bo")
public class boardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page = "";
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
			String num = multiRequest.getParameter("pagebno");
			String attno1 = multiRequest.getParameter("attno1");
			String attno2 = multiRequest.getParameter("attno2");
			System.out.println("attno1 : attno1 : attno1 : " + attno1);
			System.out.println("attno2 : attno2 : attno2 : " + attno2);
			//String img1 = multiRequest.getParameter("img1");
		//x	String img2 = multiRequest.getParameter("img2");
			String photo1 = multiRequest.getParameter("photo1");
			String photo2 = multiRequest.getParameter("photo2");

			System.out.println("multiTitle : " + multiTitle);
			System.out.println("multiiContent" + multiiContent);
			System.out.println("pagebno : " + num);




			Board b = new Board();
			b.setPostTitle(multiTitle);
			b.setPostContents(multiiContent);
			b.setPostCode(num);

			System.out.println("updateservlet : " + b);


			// 파일이 전송된 이름을 반환한다.
			Enumeration<String> files = multiRequest.getFileNames();

			while (files.hasMoreElements()) {

				// 파일 리턴

				String name = files.nextElement();
				if (name == null) {




				} else {
					// 저장된 이름 가져올떄
					saveFiles.add(multiRequest.getFilesystemName(name));
					// 원본 파일저장할떄
					originFiles.add(multiRequest.getOriginalFileName(name));
				}
			}

			ArrayList<String> attno = new ArrayList<String>();

			attno.add(attno1);
			attno.add(attno2);

			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
				for (int i = originFiles.size() - 1; i >= 0; i--) {
					Attachment at = new Attachment();
					at.setAttachNo(attno.get(i));
					at.setFilePath(savePath);
					at.setOriginName(originFiles.get(i));
					at.setChangeName(saveFiles.get(i));
					fileList.add(at);
				}
				System.out.println("서블릿 : update  : fileList : " + fileList);
				int result = new BoardService().updateBoard(b, fileList);


				if (result > 0) {
					//equest.setNextPath("selectBoard.bo?num=" + b.getPostCode();
					//forward.setNextPath("BoardListAction.bo?page="+pageNum);
					page = "/selectOne.bo?num="+num;
					request.setAttribute("b", b);
					request.setAttribute("fileList", fileList);
				} else {
					page = "views/common/Review_errorPage.jsp";
					request.setAttribute("msg", "게시판 업데이트 실패!!!");
					// 실패시 저장된 사진 삭제
					/*for (int i = 0; i < saveFiles.size(); i++) {
						File failedFile = new File(savePath + saveFiles.get(i));
						failedFile.delete();
					}*/
				}

		}
		request.getRequestDispatcher(page).forward(request, response);

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
