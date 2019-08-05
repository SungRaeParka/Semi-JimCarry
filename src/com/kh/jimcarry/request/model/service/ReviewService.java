package com.kh.jimcarry.request.model.service;

import static com.kh.jimcarry.common.JDBCTemplate.commit;
import static com.kh.jimcarry.common.JDBCTemplate.getConnection;
import static com.kh.jimcarry.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.jimcarry.request.model.dao.ReviewDao;
import com.kh.jimcarry.request.model.vo.Reviews;

public class ReviewService {

	public int insertReviews(Reviews rev) {
		Connection con = getConnection();
		
		int result = new ReviewDao().insertReviews(con,rev);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}

}


