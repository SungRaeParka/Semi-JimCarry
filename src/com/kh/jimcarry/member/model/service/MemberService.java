package com.kh.jimcarry.member.model.service;

import com.kh.jimcarry.member.model.dao.MemberDao;
import com.kh.jimcarry.member.model.vo.AttachmentMember;
import com.kh.jimcarry.member.model.vo.Member;
import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.jimcarry.common.JDBCTemplate.*;

public class MemberService {
	
	public int insertMember(Member m) {
		Connection con = getConnection();
		
		int result = new MemberDao().insertMember(con, m);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public Member loginCheck(String userId, String userPwd) {
		Connection con = getConnection();
		
		Member loginUser = new MemberDao().loginCheck(con, userId, userPwd);
		
		close(con);
		
		return loginUser;
	}
	//기사 회원가입
	/*public int insertDriver(Member m, ArrayList<AttachmentMember> fileList) {
		Connection con = getConnection();
		int result = 0;
		
		int result1 = new MemberDao().insertDriver(con, m);
		
		if(result1 > 0) {
			String seqNo = new MemberDao().selectCurrval(con);
			for(int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setDriverNo(seqNo);
			}
		}
		
		
		return 0;
	}*/
}














