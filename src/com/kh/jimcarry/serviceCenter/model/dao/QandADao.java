package com.kh.jimcarry.serviceCenter.model.dao;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jimcarry.serviceCenter.model.vo.QandA;
import com.sun.xml.internal.fastinfoset.sax.Properties;

public class QandADao {
	private Properties prop = new Properties();
	
	public QandADao() {
		String fileName=
				QandADao.class.getResource("/sql/Notice/qanda-query.properties").getPath();
	}

	public ArrayList<QandA> selectList(Connection con) {
		// TODO Auto-generated method stub
		return null;
	}

}
