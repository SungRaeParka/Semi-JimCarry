package com.kh.jimcarry.member.model.dao;

import java.sql.Statement;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jimcarry.member.model.vo.AttachmentMember;
import com.kh.jimcarry.member.model.vo.DriverList;
import com.kh.jimcarry.member.model.vo.Member;
import com.kh.jimcarry.member.model.vo.UserList;

import static com.kh.jimcarry.common.JDBCTemplate.*;

public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int insertMember(Connection con, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getPhone());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Member loginCheck(Connection con, String userId, String userPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("loginSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				System.out.println(rset.getString("MEMBER_ID"));
				
				loginUser = new Member();
				
				loginUser.setSeqNo(rset.getString("MEMBER_NO"));
				loginUser.setUserId(rset.getString("MEMBER_ID"));
				loginUser.setUserPwd(rset.getString("MEMBER_PWD"));
				loginUser.setUserName(rset.getString("MEMBER_NAME"));
				loginUser.setPhone(rset.getString("PHONE"));
				loginUser.setEnrollDate(rset.getDate("ENROLL_DATE"));
				loginUser.setStatusCheck(rset.getString("STATUS_CHECK"));
				loginUser.setUdCheck(rset.getString("UD_CHECK"));		
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return loginUser;
	}

	public int userIdCheck(Connection con, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("userIdCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}


	public int insertDriver(Connection con, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertDriver");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getAgent());
			pstmt.setString(6, m.getBusinessNo());
			pstmt.setString(7, m.getBusinessAddress());
			pstmt.setString(8, m.getCarType());
			pstmt.setString(9, m.getCarNo());
			pstmt.setString(10, m.getBankName());
			pstmt.setString(11, m.getAccountNo());
			pstmt.setString(12, m.getCarSize());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public String selectCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		
		String attachType = "";
		
		String query = prop.getProperty("selectCurrval");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				attachType = rset.getString("currval");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return attachType;
	}

	public int insertAttachment(Connection con, ArrayList<AttachmentMember> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertArrachment");
		
			try {
				for(int i = 0; i < fileList.size(); i++) {
					pstmt = con.prepareStatement(query);
					
					
					pstmt.setString(1, fileList.get(i).getOriginName());
					pstmt.setString(2, fileList.get(i).getChangeName());
					pstmt.setString(3, fileList.get(i).getFilePath());
					pstmt.setInt(4, fileList.get(i).getFileLevel());
					pstmt.setString(5, fileList.get(i).getAttachType());

					result += pstmt.executeUpdate();
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		System.out.println("마지막~ : " + result);
		return result;
	}

	public int updateMember(Connection con, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("updateMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserPwd());
			pstmt.setString(2, m.getPhone());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getSeqNo());
			
			System.out.println("1111 : "+pstmt);
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println( "2222 : "+ result);
		return result;
	}

	public Member driverLoginCheck(Connection con, String userId, String userPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginDriver = null;
		
		String query = prop.getProperty("driverLoginCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				System.out.println(rset.getString("MEMBER_ID"));
				
				loginDriver = new Member();
				
				loginDriver.setSeqNo(rset.getString("MEMBER_NO"));
				loginDriver.setUserId(rset.getString("MEMBER_ID"));
				loginDriver.setUserPwd(rset.getString("MEMBER_PWD"));
				loginDriver.setUserName(rset.getString("MEMBER_NAME"));
				loginDriver.setPhone(rset.getString("PHONE"));
				loginDriver.setEnrollDate(rset.getDate("ENROLL_DATE"));
				loginDriver.setStatusCheck(rset.getString("STATUS_CHECK"));
				loginDriver.setUdCheck(rset.getString("UD_CHECK"));
				loginDriver.setAgent(rset.getString("AGENT_NAME"));
				loginDriver.setBusinessNo(rset.getString("BUSINESS_NO"));
				loginDriver.setBusinessAddress(rset.getString("BUSINESS_ADDRESS"));
				loginDriver.setCarType(rset.getString("CAR_TYPE"));
				loginDriver.setCarNo(rset.getString("CAR_NO"));
				loginDriver.setBlacklistCheck(rset.getString("BLACK_CHECK"));			
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return loginDriver;
	}

	public int updateDriver(Connection con, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateDriver");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getAgent());
			pstmt.setString(2, m.getBusinessNo());
			pstmt.setString(3, m.getBusinessAddress());
			pstmt.setString(4, m.getCarType());
			pstmt.setString(5, m.getCarNo());
			pstmt.setString(6, m.getSeqNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateAttachment(Connection con, ArrayList<AttachmentMember> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateArrachment");
		
		System.out.println("3333 : "+fileList.size());
		System.out.println("4444 : " + fileList);
			try {
				for(int i = 0; i < fileList.size(); i++) {
					pstmt = con.prepareStatement(query);
					
					pstmt.setString(1, fileList.get(i).getOriginName());
					pstmt.setString(2, fileList.get(i).getChangeName());
					pstmt.setString(3, fileList.get(i).getFilePath());
					pstmt.setString(4, fileList.get(i).getAttachNo());
					/*System.out.println(fileList.get(i).getChangeName() + ":::::::::::dsabhjdba");*/
					
					result = pstmt.executeUpdate();
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			System.out.println("5555~ : " + result);
			return result;
	}

	public ArrayList<AttachmentMember> attachnoSelect(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AttachmentMember> fileList = null;
		
		String query = prop.getProperty("attachnoSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, m.getSeqNo());
			
			rset = pstmt.executeQuery();
			
			fileList = new ArrayList<AttachmentMember>();
				while(rset.next()) {
				
				AttachmentMember am = new AttachmentMember();
				
				am.setAttachNo(rset.getString("ATTACH_NO"));
				
				fileList.add(am);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return fileList;
	}

	public ArrayList<DriverList> driverList(Connection con, String seqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<DriverList> list = null;
		
		System.out.println("여긴 ? : " + list);
		System.out.println("이건 ? : " + seqNo);
		String query = prop.getProperty("driverList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, seqNo);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<DriverList>();
			while(rset.next()) {
				System.out.println("seqNo 넘어오냐? : " + seqNo);
				DriverList dl= new DriverList();
				
				
				dl.setReqNo(rset.getString("REQ_NO"));
				dl.setUserName(rset.getString("MEMBER_NAME"));
				dl.setMatchingDate(rset.getDate("MATCHING_DATE"));
				dl.setReservattonDate(rset.getString("RESERVATION_DATE"));
				dl.setOrderPrice(rset.getInt("ORDER_PRICE"));
				dl.setDriverPay(rset.getInt("DRIVER_PAY"));
				dl.setConditionReq(rset.getString("CONDITION_DO"));
				
				list.add(dl);
				System.out.println(list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	public ArrayList<UserList> UserList(Connection con, String seqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<UserList> list = null;
		
		System.out.println("여긴 ? : " + list);
		System.out.println("이건 ? : " + seqNo);
		String query = prop.getProperty("userList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, seqNo);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<UserList>();
			while(rset.next()) {
				System.out.println("seqNo 넘어오냐? : " + seqNo);
				UserList ul= new UserList();
				
				
				ul.setReqNo(rset.getString("REQ_NO"));
				ul.setUserName(rset.getString("MEMBER_NAME"));
				ul.setMatchingDate(rset.getDate("MATCHING_DATE"));
				ul.setReservattonDate(rset.getString("RESERVATION_DATE"));
				ul.setOrderPrice(rset.getInt("ORDER_PRICE"));
				ul.setConditionReq(rset.getString("CONDITION_REQ"));
				
				list.add(ul);
				System.out.println(list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	public int userDelete(Connection con, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("userDelete");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<AttachmentMember> driverAttachment(Connection con, String userId, String userPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AttachmentMember> attachment = null;
		
		String query = prop.getProperty("attachment");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			attachment = new ArrayList<AttachmentMember>();
			while(rset.next()) {
				
				AttachmentMember am = new AttachmentMember();
				
				am.setAttachNo(rset.getString("ATTACH_NO"));
				
				attachment.add(am);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return attachment;
	}

	public Member idSelect(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member idSelect = null;
		
		String query = prop.getProperty("idSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, m.getUserName());
			
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				System.out.println(rset.getString("MEMBER_ID"));
				
				idSelect = new Member();
				
				idSelect.setUserId(rset.getString("MEMBER_ID"));			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return idSelect;
		
	}

}













