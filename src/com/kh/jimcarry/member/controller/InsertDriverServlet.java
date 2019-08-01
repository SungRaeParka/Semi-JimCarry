package com.kh.jimcarry.member.controller;

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

import com.kh.jimcarry.common.MyFileRenamePolicy;
import com.kh.jimcarry.member.model.service.MemberService;
import com.kh.jimcarry.member.model.vo.AttachmentMember;
import com.kh.jimcarry.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertDriverServlet
 */
@WebServlet("/insertDriver.me")
public class InsertDriverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertDriverServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			//전송 파일 용량 제한 : 10Mbyte로 제한
			int maxSize = 1024 * 1024 * 10;
			
			//웹서버 컨테이너 경로 추출
			String root = request.getSession().getServletContext().getRealPath("/");

	         System.out.println(root);
	         //파일 저장 경로(web/thumbnail_uploadFiles)
	         String savePath = root + "images_uploadFiles/";
			
			MultipartRequest multiRequest =
					new MultipartRequest(request, savePath, maxSize,
								"UTF-8", new MyFileRenamePolicy());
			
			//변경된 파일
			ArrayList<String> saveFiles = new ArrayList<String>();
			//원본 파일
			ArrayList<String> originFiles = new ArrayList<String>();
			
			//파일이 전송된 이름을 반환한다
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				System.out.println("name : " + name);
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
				
				//넘어온 파일은 역순으로 꺼내옴
				System.out.println("fileSystem name : " + multiRequest.getFilesystemName(name));
				System.out.println("originFile name : " + multiRequest.getOriginalFileName(name));
				
				
			}
			String userId = multiRequest.getParameter("userId");
			String userName = multiRequest.getParameter("userName");
			String userPwd = multiRequest.getParameter("password");
			String tel1 = multiRequest.getParameter("tel1");
			String tel2 = multiRequest.getParameter("tel2");
			String tel3 = multiRequest.getParameter("tel3");
			String phone = tel1 + "-" + tel2 + "-" + tel3;
			String agent = multiRequest.getParameter("agent");
			String businessNo = multiRequest.getParameter("businessNumber");
			String address1 = multiRequest.getParameter("address1");
			String address2 = multiRequest.getParameter("address2");
			String address3 = multiRequest.getParameter("address3");
			String businessAddress = address1 + " " + address2 +  " " + address3;
			String carType = multiRequest.getParameter("carType");
			String carSize = multiRequest.getParameter("carSize");
			String bankName = multiRequest.getParameter("bankName");
			String accountNo = multiRequest.getParameter("accountNo");
			String carNo1 = multiRequest.getParameter("carNo1");
			String carNo2 = multiRequest.getParameter("carNo2");
			String carNo = carNo1 + " " + carNo2;
			String idPhoto = multiRequest.getParameter("idPhoto");
			String certificate = multiRequest.getParameter("certificate");
			String bankBook = multiRequest.getParameter("bankBook");
			String attestation = multiRequest.getParameter("attestation");
			String attachType = "";
			int fileLevel = 1;
			String status = "N";
			System.out.println("아이디 넘어오냐? : " + userId);
			System.out.println("이건? : " + userName);
		
			Member m = new Member();
			m.setUserId(userId);
			m.setUserPwd(userPwd);
			m.setUserName(userName);
			m.setPhone(phone);
			m.setAgent(agent);
			m.setBusinessNo(businessNo);
			m.setBusinessAddress(businessAddress);
			m.setCarType(carType);
			m.setCarSize(carSize);
			m.setCarNo(carNo);
			m.setBankName(bankName);
			m.setAccountNo(accountNo);
			m.setIdPhoto(idPhoto);
			m.setCertificate(certificate);
			m.setBankBook(bankBook);
			m.setAttestation(attestation);
			
			System.out.println("회원정보 : " + m);
			
			ArrayList<AttachmentMember> fileList = new ArrayList<AttachmentMember>();
			for(int i = originFiles.size() -1; i >= 0; i--) {
				AttachmentMember am = new AttachmentMember();
				if(i == 0) {
					am.setFilePath(savePath);
					am.setOriginName(originFiles.get(i));
					am.setChangeName(saveFiles.get(i));
					am.setFileLevel(fileLevel);
					am.setStatus(status);
					attachType = "차량등록증";
					am.setAttachType(attachType);
				}else if(i == 1){
					am.setFilePath(savePath);
					am.setOriginName(originFiles.get(i));
					am.setChangeName(saveFiles.get(i));
					am.setFileLevel(fileLevel);
					am.setStatus(status);
					attachType = "통장사본";
					am.setAttachType(attachType);
				}else if(i == 2){
					am.setFilePath(savePath);
					am.setOriginName(originFiles.get(i));
					am.setChangeName(saveFiles.get(i));
					am.setFileLevel(fileLevel);
					am.setStatus(status);
					attachType = "사업자등록증";
					am.setAttachType(attachType);
				}else if(i == 3){
					am.setFilePath(savePath);
					am.setOriginName(originFiles.get(i));
					am.setChangeName(saveFiles.get(i));
					am.setFileLevel(fileLevel);
					am.setStatus(status);
					attachType = "본인사진";
					am.setAttachType(attachType);
				}
				
				fileList.add(am);
			}
			System.out.println(" member 나오냐? : " + m);
			System.out.println("attachment list 나오냐? : " + fileList);
			
			int result = new MemberService().insertDriver(m, fileList);
			
			String page = "";
			if(result > 0) {
				page = "views/member/MemberLoginForm.jsp";
				response.sendRedirect(page);
			}else {
			page = "views/common/driver_errorPage.jsp";
			request.setAttribute("msg", "회원 가입실패!");
			request.getRequestDispatcher(page).forward(request, response);
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
