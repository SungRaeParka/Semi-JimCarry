package com.kh.jimcarry.board.model.service;

import static com.kh.jimcarry.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.jimcarry.board.model.dao.DPDao;
import com.kh.jimcarry.board.model.vo.Attachment;
import com.kh.jimcarry.board.model.vo.DP;

public class DPService {

	public ArrayList<DP> selectDPList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<DP> dpList = new DPDao().selectDPList(con, currentPage, limit);
		
		close(con);
		
		return dpList;
	}

	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new DPDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	public DP selectdpOne(int num) {
		Connection con = getConnection();
		DP dpOne = null;
		
		int result = new DPDao().updatedpCount(con, num);
		
		if(result > 0) {
			commit(con);
			dpOne = new DPDao().selectdpOne(con, num);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return dpOne;
	}

	public int insertAdminDPContent(DP dp, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		
		int result = 0;
		
		int result1 = new DPDao().insertAdminDPContent(con, dp);
		
		if(result1 > 0) {
			String postCode = new DPDao().selectDPCurrval(con);
			
			System.out.println("postCode ::: "+postCode);
			
			for(int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setPostCode("B"+postCode);
			}
		}
		
		int result2 = new DPDao().insertAttachment(con, fileList);
		
		if(result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int deleteDP(int num) {
		Connection con = getConnection();
		
		int result = 0;
		
		result = new DPDao().deleteDP(con, num);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<DP> selectDPList(int num) {
		Connection con = getConnection();
		
		ArrayList<DP> selectDPList = new DPDao().selectDPUpdatePre(con, num);
		
		close(con);
		
		return selectDPList;
	}

	public int updateAdminDPContent(DP dp, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		
		int result = 0;
		
		int result1 = new DPDao().updatetAdminDPContent(con, dp);		
		
		int result2 = new DPDao().updateAttachment(con, fileList, dp);
		
		if(result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

}
