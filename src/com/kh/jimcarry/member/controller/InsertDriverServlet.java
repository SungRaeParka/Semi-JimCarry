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
		String userId = request.getParameter("userId");
		System.out.println(userId);
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			System.out.println(root);
			
			String savePath = root + "images_uploadFiles";
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			//저장된 파일
			ArrayList<String> saveFiles = new ArrayList<String>();
			//원본
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				System.out.println("name : " + name);
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
				System.out.println("saveFiles : " + multiRequest.getFilesystemName(name));
				System.out.println("originFiles : " + multiRequest.getOriginalFileName(name));		
			}
			String multiIdPhoto = multiRequest.getParameter("idPhoto");
			String multiCrtificate = multiRequest.getParameter("certificate");
			String multiBankBook = multiRequest.getParameter("bankBook");
			String multiAttestation = multiRequest.getParameter("attestation");
			String seqNo = ((Member)(request.getSession().getAttribute("loginUser"))).getSeqNo();
			String userName = request.getParameter("userName");
			String userPwd = request.getParameter("password");
			String tel1 = request.getParameter("tel1");
			String tel2 = request.getParameter("tel2");
			String tel3 = request.getParameter("tel3");
			String phone = tel1 + "-" + tel2 + "-" + tel3;
			String agent = request.getParameter("agent");
			String businessNo = request.getParameter("businessNumber");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String address3 = request.getParameter("address3");
			String businessAddress = address1 + address2 + address3;
			String carType = request.getParameter("carType");
			String carSize = request.getParameter("carSize");
			String bankName = request.getParameter("bankName");
			String accountNo = request.getParameter("accountNo");
			String carNo = request.getParameter("carNo");
			System.out.println(userName);
			
			
			Member m = new Member();
			m.setIdPhoto(multiIdPhoto);
			m.setCertificate(multiCrtificate);
			m.setBankBook(multiBankBook);
			m.setAttestation(multiAttestation);
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
			/*ArrayList<AttachmentMember> fileList = new ArrayList<AttachmentMember>();
			for(int i = originFiles.size() -1; i >= 0; i--) {
				AttachmentMember am = new AttachmentMember();
				am.setFilePath(savePath);
				am.setOriginName(originFiles.get(i));
				am.setChangeName(saveFiles.get(i));
				
				fileList.add(am);
				System.out.println(am);
			}
			System.out.println("controller Member : " + m);
			System.out.println("controller attachmentMember list : " + fileList);*/
			
			/*int result = new MemberService().insertDriver(m, fileList);
			
			String page = "";
			if(result > 0) {
				page = "views/member/MemberLoginForm.jsp";
				response.sendRedirect(page);
			}else {
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();
				}
				
			}*/
		
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
