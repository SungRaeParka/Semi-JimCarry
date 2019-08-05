 package com.kh.jimcarry.serviceCenter.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jimcarry.serviceCenter.model.dao.DeclarationDao;
import com.kh.jimcarry.serviceCenter.model.vo.Declaration;

import static com.kh.jimcarry.common.JDBCTemplate.*;

public class DeclarationService {
	
	public int getListCount() {
		// TODO Auto-generated method stub
		
		Connection con = getConnection();
		
		int listCount3 = new DeclarationDao().getListCount(con);
		
		close(con);
		return listCount3;
	}

	public ArrayList<Declaration> selectList(int currentPage3, int limit3) {
		// TODO Auto-generated method stub
		
		Connection con = getConnection();
		
		ArrayList<Declaration> list = 
				new DeclarationDao().selectList(con,currentPage3,limit3);
		close(con);
		return list;
	}


}
