package com.kh.jimcarry.board.model.service;

import static com.kh.jimcarry.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.jimcarry.board.model.dao.DPDao;
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

}
