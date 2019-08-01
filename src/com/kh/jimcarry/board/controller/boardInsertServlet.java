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
import com.kh.jimcarry.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;



@WebServlet("/insert.bo")
public class boardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(ServletFileUpload.isMultipartContent(request)) {
			//전송 파일 용량 제한 : 10Mbyte로 제한
			int maxSize = 1024 * 1024 * 10;

			//웹서버 컨테이너 경로 추출
			String root = request.getSession().getServletContext().getRealPath("/");

			System.out.println(root);
			//파일 저장 경로(web/thumbnail_uploadFiles)
			String savePath = root + "images_uploadFiles/";

			System.out.println("root" + root);
			//FileRenamePolicy 상속 후 오버라이딩
			MultipartRequest multiRequest =
					new MultipartRequest(request, savePath, maxSize,
										"UTF-8", new MyFileRenamePolicy());

			//다중파일을 묶어서 업로드를 하기 위해 컬렉션 이용
			//저저장한 파일(변경된 파일의) 이름을 저장할 ArrayLIst 객체 생성
			ArrayList<String> saveFiles = new ArrayList<String>();
			//원본 파일의 이름을 저장할 ArrayList 생성
			ArrayList<String> originFiles = new ArrayList<String>();

			//파일이 전송된 이름을 반환한다.
			Enumeration<String> files = multiRequest.getFileNames();

			while(files.hasMoreElements()) {
				//파일 리턴
				String name = files.nextElement();

				System.out.println("name " + name);

				//저장된 이름 가져올떄
				saveFiles.add(multiRequest.getFilesystemName(name));
				//원본 파일저장할떄
				originFiles.add(multiRequest.getOriginalFileName(name));

				//넘어온 파일은 역순으로 꺼내온다.
				System.out.println("filesSystem name : " + multiRequest.getFilesystemName(name));
				System.out.println("OriginalFile name : " + multiRequest.getOriginalFileName(name));


			}
			//MultipartRequest 객체를 이용하여 파일 외의 값들도 꺼낼 수 있다.

			String multiTitle = multiRequest.getParameter("btitle");
			String multiiContent = multiRequest.getParameter("bcontent");
			String userNo = ((Member)(request.getSession().getAttribute("loginUser"))).getSeqNo();

			System.out.println("multiTitle : " + multiTitle);
			System.out.println("multiiContent : " + multiiContent);
			System.out.println("userNo : " + userNo);


			//Board객체 생성
			Board b = new Board();
			b.setPostTitle(multiTitle);
			b.setPostContents(multiiContent);
			b.setUserNo(userNo);
			String reViews = "사용후기";
			b.setPostType(reViews);


			System.out.println("servlet b " + b);



			//Attachment 객체생성하여 ArrayList 객체에 저장
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			//전송순서 역순으로 저장되기 떄문에 반복문을 역으로 돌려 list에 저장
			for(int i = originFiles.size() -1; i >= 0; i--) {
				Attachment at = new Attachment();
				at.setFilePath(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				at.setAttachType(reViews);

				fileList.add(at);
			}

				System.out.println("controller board 나와라 : " + b);
				System.out.println("controller attachment list : " + fileList);

				int result = new BoardService().insertBoard(b,fileList);

				if(result > 0) {
					response.sendRedirect(request.getContextPath() + "/selectList.bo");
				}else {
					//실패시 저장된 사진 삭제
					for(int i = 0; i < saveFiles.size(); i++) {
						File failedFile = new File(savePath + saveFiles.get(i));
						failedFile.delete();
					}
					request.setAttribute("msg", "게시판  등록 실패");
					request.getRequestDispatcher("views/common/Review_errorPage.jsp").forward(request, response);
				}

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












