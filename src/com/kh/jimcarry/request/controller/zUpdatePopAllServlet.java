package com.kh.jimcarry.request.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jimcarry.request.model.service.ProductService;
import com.kh.jimcarry.request.model.vo.Product;

@WebServlet("/updateAll.pr")
public class zUpdatePopAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L; 
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reqNo = request.getParameter("reqNo");
		
		String proNo = request.getParameter("proNo");
		String[] proNorr = proNo.split(",");		
		
		String proName = request.getParameter("proName");
		String[] proNamerr = proName.split(", ");
		
		String[] refTyperr = request.getParameterValues("proType_Ref2");
		String[] refSizerr = request.getParameterValues("proSize_Ref2");		
		
		String[] washTyperr = request.getParameterValues("proType_Wash2");
		String[] washSizerr = request.getParameterValues("proSize_Wash2");		
		
		String[] tvSizerr = request.getParameterValues("proSize_Tv2");
		
		String[] airTyperr = request.getParameterValues("proType_Air2");
		String[] airUnirr = request.getParameterValues("proUni_Air2");
		
		String[] waterSizerr = request.getParameterValues("proSize_Water2");
		String[] waterUnirr = request.getParameterValues("proUni_Water2");
		
		String[] pcTyperr = request.getParameterValues("proType_Pc2");
		
		String[] ovenTyperr = request.getParameterValues("proType_Oven2");
		
		String[] bedTyperr = request.getParameterValues("proType_Bed2");
		String[] bedSizerr = request.getParameterValues("proSize_Bed2");
		
		String[] chairTyperr = request.getParameterValues("proType_Chair2");
		
		String[] tableTyperr = request.getParameterValues("proType_Table2");
		String[] tableSizerr = request.getParameterValues("proSize_Table2");
		String[] tableMatrr = request.getParameterValues("proMat_Table2");
		String[] tableWidthrr = request.getParameterValues("proWidth_Table2");
		
		String[] bcWidthrr = request.getParameterValues("proWidth_Bc2");
		String[] bcHeightrr = request.getParameterValues("proHeight_Bc2");
		
		String[] cloTyperr = request.getParameterValues("proType_Clo2");
		String[] cloUnirr = request.getParameterValues("proUni_Clo2");
		String[] cloWidthrr = request.getParameterValues("proWidth_Clo2");
		
		String[] scGckrr = request.getParameterValues("proGck_Sc2");
		String[] scWidthrr = request.getParameterValues("proWidth_Sc2");
		String[] scHeightrr = request.getParameterValues("proHeight_Sc2");
		
		String[] sofaSizerr = request.getParameterValues("proSize_Sofa2");
		
		String[] hangTyperr = request.getParameterValues("proType_Hang2");
		String[] hangWidthrr = request.getParameterValues("proWidth_Hang2");
		
		String[] mirTyperr = request.getParameterValues("proType_Mir2");
		String[] mirSizerr = request.getParameterValues("proSize_Mir2");
		
		String[] makeTyperr = request.getParameterValues("proType_Make2");
		String[] makeMatrr = request.getParameterValues("proMat_Make2");
		
		String[] pianoTyperr = request.getParameterValues("proType_Piano2"); 
		
		String memo = request.getParameter("memo");
		
		String refNo = new ProductService().selectRefNo(reqNo);
		
		String washNo = new ProductService().selectWashNo(reqNo);
		
		String tvNo = new ProductService().selectTvNo(reqNo);
		
		String airNo = new ProductService().selectAirNo(reqNo);
		
		String waterNo = new ProductService().selectWaterNo(reqNo);
		
		String pcNo = new ProductService().selectPcNo(reqNo);
		
		String ovenNo = new ProductService().selectOvenNo(reqNo);
		
		String bedNo = new ProductService().selectBedNo(reqNo);
		
		String chairNo = new ProductService().selectChairNo(reqNo);
		
		String tableNo = new ProductService().selectTableNo(reqNo);
		
		String bcNo = new ProductService().selectBcNo(reqNo);
		
		String cloNo = new ProductService().selectCloNo(reqNo);
		
		String scNo = new ProductService().selectScNo(reqNo);
		
		String sofaNo = new ProductService().selectSofaNo(reqNo);
		
		String hangNo = new ProductService().selectHangNo(reqNo);
		
		String mirNo = new ProductService().selectMirNo(reqNo);
		
		String makeNo = new ProductService().selectMakeNo(reqNo);
		
		String pianoNo = new ProductService().selectPianoNo(reqNo);		
		
		//각각 물품 번호, reqNo, 물품별 상세선택 내역 넘겨서 물품마다 업데이트
		
		int result = new ProductService().updateAll(reqNo, proNamerr, refTyperr, refSizerr, washTyperr, washSizerr, tvSizerr, airTyperr, airUnirr, waterSizerr, waterUnirr, pcTyperr, ovenTyperr, bedTyperr, bedSizerr,
													chairTyperr, tableTyperr, tableSizerr, tableMatrr, tableWidthrr, bcWidthrr, bcHeightrr, cloTyperr, cloUnirr, cloWidthrr, scGckrr, scWidthrr, scHeightrr,
													sofaSizerr, hangTyperr, hangWidthrr, mirTyperr, mirSizerr, makeTyperr, makeMatrr, pianoTyperr, refNo, washNo, tvNo, airNo, waterNo, pcNo, ovenNo, bedNo,
													chairNo, tableNo, bcNo, cloNo, scNo, sofaNo, hangNo, mirNo, makeNo, pianoNo);
		
		Product p = new Product();
		
		p.setReqNo(reqNo);
		p.setProNo(proNo);
		p.setMemo(memo);
		
		
		String page = "";
		
		if(result > 0 ) {
			page = "views/request/req_PlaceSelect.jsp";
			
			HttpSession session = request.getSession();
			
			session.setAttribute("p", p);
			
			response.sendRedirect(page);
			
		}else {
			page = "views/common/errorPage.jsp";
			
			request.setAttribute("msg", "물품 정보 수정 실패!");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
