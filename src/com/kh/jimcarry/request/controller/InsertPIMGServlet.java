package com.kh.jimcarry.request.controller;

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
import com.kh.jimcarry.request.model.service.ProductService;
import com.kh.jimcarry.request.model.service.RequestService;
import com.kh.jimcarry.request.model.vo.RequestAttachment;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/insertPIMG.rq")
public class InsertPIMGServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reqNo = new ProductService().SelectPimgReqno();		
		System.out.println("PIMG insert용 reqNo :: " + reqNo);
		
		String proNo = new ProductService().selectProNo(reqNo);
		System.out.println("PIMG insert용 proNo :: " + proNo);
		
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			System.out.println("root :: " + root);
			
			String savePath = root + "images_uploadFiles/";
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
				
				System.out.println("fileSystem name ::" + multiRequest.getFilesystemName(name));
				System.out.println("Origin name :: " + multiRequest.getOriginalFileName(name));
			}
			
			ArrayList<RequestAttachment> fileList = new ArrayList<RequestAttachment>();
			
			for(int i = originFiles.size() - 1; i >= 0; i--) {
				RequestAttachment ra = new RequestAttachment();
				
				ra.setFilePath(savePath);
				ra.setOriginName(originFiles.get(i));
				ra.setChangeName(saveFiles.get(i));				
				
				fileList.add(ra);
			}
			System.out.println("requestAttachment list :: " + fileList);
			
			int result = new RequestService().insertPIMG(fileList, reqNo, proNo);
			
			String page = "";
			
			if(result > 0) {
				page = "/semi/views/request/req_PlaceSelect.jsp";
				
				response.sendRedirect(page);
			}else {
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();
				}
				page = "/semi/views/common/errorPage.jsp";
				
				request.setAttribute("msg", "물품 사진 등록 실패!");
				request.getRequestDispatcher(page).forward(request, response);
			}			
		}		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
