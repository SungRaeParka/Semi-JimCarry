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

	public int insertDeclaration(Declaration de) {
		// TODO Auto-generated method stub
		
		Connection con = getConnection();
		
		int result = new DeclarationDao().insertDeclaration(con,de);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		return result;
	}

	public Declaration selectOne(String num) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		
		Declaration de = new DeclarationDao().selectOne(con, num);
		
		if (de != null) {
			int result = new DeclarationDao().updateCount(con,num);
			if (result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		}
		close(con);
		return de;
	}


}
