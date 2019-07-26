package com.kh.jimcarry.request.model.service;

import static com.kh.jimcarry.common.JDBCTemplate.close;
import static com.kh.jimcarry.common.JDBCTemplate.commit;
import static com.kh.jimcarry.common.JDBCTemplate.getConnection;
import static com.kh.jimcarry.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jimcarry.request.model.dao.ProductDao;
import com.kh.jimcarry.request.model.vo.Product;

public class ProductService {	

	public int insertRequest(Product r) {
		Connection con = getConnection();
		
		int result = new ProductDao().insertRequest(con, r);
		
		if(result > 0) {
			commit(con);			
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}	
	
	public int insertBoxCount(Product r) {
		Connection con = getConnection();
		
		int result = new ProductDao().insertBoxCount(con, r);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}	
	
	public int insertBookCount(Product r) {
		Connection con = getConnection();
		
		int result = new ProductDao().insertBookCount(con, r);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public String selectReqNo() {		
		Connection con = getConnection();
		
		String reqNo = new ProductDao().selectReqNo(con);
		
		close(con);
		
		return reqNo;
	}

	public String selectProNo(String reqNo) {
		Connection con = getConnection();
		
		String proNo = new ProductDao().selectProNo(con, reqNo);
		
		close(con);
		
		return proNo;
	}

	public String selectRefNo(String reqNo) {
		Connection con = getConnection();
		
		String refNo = new ProductDao().selectRefNo(con, reqNo);
		
		close(con);
				
		return refNo;
	}

	public String selectWashNo(String reqNo) {
		Connection con = getConnection();
		
		String washNo = new ProductDao().selectWashNo(con, reqNo);
		
		close(con);
				
		return washNo;
	}

	public String selectTvNo(String reqNo) {
		Connection con = getConnection();
		
		String tvNo = new ProductDao().selectTvNo(con, reqNo);
		
		close(con);
				
		return tvNo;
	}

	public String selectAirNo(String reqNo) {
		Connection con = getConnection();
		
		String airNo = new ProductDao().selectAirNo(con, reqNo);
		
		close(con);
				
		return airNo;
	}

	public String selectWaterNo(String reqNo) {
		Connection con = getConnection();
		
		String waterNo = new ProductDao().selectWaterNo(con, reqNo);
		
		close(con);
				
		return waterNo;
	}

	public String selectPcNo(String reqNo) {
		Connection con = getConnection();
		
		String pcNo = new ProductDao().selectPcNo(con, reqNo);
		
		close(con);
				
		return pcNo;
	}

	public String selectOvenNo(String reqNo) {
		Connection con = getConnection();
		
		String ovenNo = new ProductDao().selectOvenNo(con, reqNo);
		
		close(con);
				
		return ovenNo;
	}

	public String selectBedNo(String reqNo) {
		Connection con = getConnection();
		
		String bedNo = new ProductDao().selectBedNo(con, reqNo);
		
		close(con);
				
		return bedNo;
	}

	public String selectChairNo(String reqNo) {
		Connection con = getConnection();
		
		String chairNo = new ProductDao().selectChairNo(con, reqNo);
		
		close(con);
				
		return chairNo;
	}

	public String selectTableNo(String reqNo) {
		Connection con = getConnection();
		
		String tableNo = new ProductDao().selectTableNo(con, reqNo);
		
		close(con);
				
		return tableNo;
	}

	public String selectBcNo(String reqNo) {
		Connection con = getConnection();
		
		String bcNo = new ProductDao().selectBcNo(con, reqNo);
		
		close(con);
				
		return bcNo;	
	}

	public String selectCloNo(String reqNo) {
		Connection con = getConnection();
		
		String cloNo = new ProductDao().selectCloNo(con, reqNo);
		
		close(con);
				
		return cloNo;
	}

	public String selectScNo(String reqNo) {
		Connection con = getConnection();
		
		String scNo = new ProductDao().selectScNo(con, reqNo);
		
		close(con);
				
		return scNo;
	}

	public String selectSofaNo(String reqNo) {
		Connection con = getConnection();
		
		String sofaNo = new ProductDao().selectSofaNo(con, reqNo);
		
		close(con);
				
		return sofaNo;
	}

	public String selectHangNo(String reqNo) {
		Connection con = getConnection();
		
		String hangNo = new ProductDao().selectHangNo(con, reqNo);
		
		close(con);
				
		return hangNo;
	}

	public String selectMirNo(String reqNo) {
		Connection con = getConnection();
		
		String mirNo = new ProductDao().selectMirNo(con, reqNo);
		
		close(con);
				
		return mirNo;
	}

	public String selectMakeNo(String reqNo) {
		Connection con = getConnection();
		
		String makeNo = new ProductDao().selectMakeNo(con, reqNo);
		
		close(con);
				
		return makeNo;
	}

	public String selectPianoNo(String reqNo) {
		Connection con = getConnection();
		
		String pianoNo = new ProductDao().selectPianoNo(con, reqNo);
		
		close(con);
				
		return pianoNo;
	}

	public int updateAll(String reqNo, String[] refTyperr, String[] refSizerr, String[] washTyperr, String[] washSizerr,
			String[] tvSizerr, String[] airTyperr, String[] airUnirr, String[] waterSizerr, String[] waterUnirr,
			String[] pcTyperr, String[] ovenTyperr, String[] bedTyperr, String[] bedSizerr, String[] chairTyperr,
			String[] tableTyperr, String[] tableSizerr, String[] tableMatrr, String[] tableWidthrr, String[] bcWidthrr,
			String[] bcHeightrr, String[] cloTyperr, String[] cloUnirr, String[] cloWidthrr, String[] scGckrr,
			String[] scWidthrr, String[] scHeightrr, String[] sofaSizerr, String[] hangTyperr, String[] hangWidthrr,
			String[] mirTyperr, String[] mirSizerr, String[] makeTyperr, String[] makeMatrr, String[] pianoTyperr,
			String refNo, String washNo, String tvNo, String airNo, String waterNo, String pcNo, String ovenNo,
			String bedNo, String chairNo, String tableNo, String bcNo, String cloNo, String scNo, String sofaNo,
			String hangNo, String mirNo, String makeNo, String pianoNo) {
		
		Connection con = getConnection();
		
		int result = new ProductDao().updateAll(con, reqNo, refTyperr, refSizerr, washTyperr, washSizerr, tvSizerr, airTyperr, airUnirr, waterSizerr, waterUnirr, pcTyperr, ovenTyperr, bedTyperr, bedSizerr,
													chairTyperr, tableTyperr, tableSizerr, tableMatrr, tableWidthrr, bcWidthrr, bcHeightrr, cloTyperr, cloUnirr, cloWidthrr, scGckrr, scWidthrr, scHeightrr,
													sofaSizerr, hangTyperr, hangWidthrr, mirTyperr, mirSizerr, makeTyperr, makeMatrr, pianoTyperr, refNo, washNo, tvNo, airNo, waterNo, pcNo, ovenNo, bedNo,
													chairNo, tableNo, bcNo, cloNo, scNo, sofaNo, hangNo, mirNo, makeNo, pianoNo);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	/*public int updateRef(String reqNo, String refNo, String[] refTyperr, String[] refSizerr) {
		Connection con = getConnection();
		
		int result = new ProductDao().updateRef(con, reqNo, refNo, refTyperr, refSizerr);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int updateWash(String reqNo, String washNo, String[] washTyperr, String[] washSizerr) {
		Connection con = getConnection();
		
		int result2 = new ProductDao().updateWash(con, reqNo, washNo, washTyperr, washSizerr);
		
		if(result2 > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result2;
	}

	public int updateTv(String reqNo, String tvNo, String[] tvSizerr) {
		Connection con = getConnection();
		
		int result3 = new ProductDao().updateTv(con, reqNo, tvNo, tvSizerr);
		
		if(result3 > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result3;
	}*/

	

}
