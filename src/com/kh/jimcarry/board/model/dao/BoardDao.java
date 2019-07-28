package com.kh.jimcarry.board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.jimcarry.board.model.vo.Attachment;
import com.kh.jimcarry.board.model.vo.Board;


import static com.kh.jimcarry.common.JDBCTemplate.*;

public class BoardDao {
	private Properties prop = new Properties();

	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 게시판 조회 메소드
	public ArrayList<Board> selectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		Board b = null;
		String query = prop.getProperty("selectList");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			list = new ArrayList<Board>();

			while (rset.next()) {
				b = new Board();

				b.setPostCode(rset.getString("POST_CODE"));
				b.setUserNo(rset.getString("MEMBER_NO"));
				b.setPostDate(rset.getDate("POST_DATE"));
				b.setPostTitle(rset.getString("POST_TITLE"));
				b.setWriter(rset.getString("MEMBER_ID"));
				b.setPostContents(rset.getString("POST_CONTENTS"));
				b.setAttachments(rset.getString("ATTACHMENTS"));
				b.setDelDate(rset.getDate("DEL_DATE"));
				b.setPostType(rset.getString("POST_TYPE"));
				b.setQuestionType(rset.getString("QUESTION_TYPE"));
				b.setPostNo(rset.getInt("POST_NO"));
				b.setbCount(rset.getInt("B_COUNT"));

				list.add(b);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		System.out.println("DAp : " + list);
		return list;
	}

	// 페이징
	public ArrayList<Board> selectList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		Board b = null;
		String query = prop.getProperty("selectListWithPageing");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Board>();

			while (rset.next()) {
				b = new Board();

				b.setPostCode(rset.getString("POST_CODE"));
				b.setUserNo(rset.getString("MEMBER_NO"));
				b.setPostDate(rset.getDate("POST_DATE"));
				b.setPostTitle(rset.getString("POST_TITLE"));
				b.setWriter(rset.getString("MEMBER_ID"));
				b.setPostContents(rset.getString("POST_CONTENTS"));
				b.setAttachments(rset.getString("ATTACHMENTS"));
				b.setDelDate(rset.getDate("DEL_DATE"));
				b.setPostType(rset.getString("POST_TYPE"));
				b.setQuestionType(rset.getString("QUESTION_TYPE"));
				b.setPostNo(rset.getInt("POST_NO"));
				b.setbCount(rset.getInt("B_COUNT"));

				list.add(b);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);

		}
		return list;
	}

	//게시물 카운터
	public int getListCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("selectListCount");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			if(rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}


		return listCount;
	}


	//조회수 카운터
	public int updateCount(Connection con, String num) {
		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("updateCount");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,num);
			pstmt.setString(2, num);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}

	//게시판 상세보기
	public HashMap<String, Object> selectBoardMap(Connection con, String num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		Board b = null;
		Attachment at = null;
		ArrayList<Attachment> list = null;

		String query = prop.getProperty("selectBoardOne");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);

			rset = pstmt.executeQuery();

			list = new ArrayList<Attachment>();

			while(rset.next()) {
				b = new Board();
				b.setPostCode(rset.getString("POST_CODE"));
				b.setPostNo(rset.getInt("POST_NO"));
				b.setPostTitle(rset.getString("POST_TITLE"));
				b.setPostContents(rset.getString("POST_CONTENTS"));
				b.setbCount(rset.getInt("B_COUNT"));
				b.setPostDate(rset.getDate("POST_DATE"));
				b.setWriter(rset.getString("MEMBER_ID"));

				at = new Attachment();
				at.setAttachNo(rset.getString("ATTACH_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
				at.setUploadDate(rset.getDate("UPLOAD_DATE"));

				System.out.println("상세보기 DB : " + b);
				list.add(at);
			}

			hmap = new HashMap<String, Object>();
			hmap.put("board", b);
			hmap.put("attachment", list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("상세보기DB : " + hmap);
		return hmap;
	}



	// 게시판 삽입용메소드
	public int insertBoardContent(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("inserBoard");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getUserNo());
			pstmt.setString(2, b.getPostTitle());
			pstmt.setString(3, b.getPostContents());
			pstmt.setString(4, b.getPostType());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("insertBoardContent 나와라 : " + result);
		return result;
	}

	// Board테이블의 현재 sequence값을 가져오는 메소드
	public String selectCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;

		String postCode = "";

		String querty = prop.getProperty("selectCurrval");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(querty);

			if (rset.next()) {
				postCode = rset.getString("CURRVAL");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}

		System.out.println("insertBoardContent 커발 : " + postCode);
		return postCode;
	}

	// 첨부파일정보 insert용 메소드 insertAttachment
	public int inserAttachment(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertAttachment");

		for (int i = 0; i < fileList.size(); i++) {
			try {
				pstmt = con.prepareStatement(query);

				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getFilePath());

				int level = 0;
				if (i == 0) {
					level = 0;
				} else {
					level = 1;
				}
				pstmt.setInt(4, level);
				pstmt.setString(5, fileList.get(i).getAttachType());

				result += pstmt.executeUpdate();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		}

		System.out.println("insertAttachment" + result);
		return result;
	}
	//검색 기능 메소드
	public ArrayList<Board> searchList(Connection con, int currentPage, int limit, String searchCondition,
			String word) {
		PreparedStatement pstmt = null;
		ArrayList<Board> list = null;
		Board b = null;
		String query = prop.getProperty("selectListWithPageing");

		String search= "%" + word + "%";
		try {
			if(searchCondition.equals("title")) {
				pstmt = con.prepareStatement(query);
				

			}


		} catch (SQLException e) {

			e.printStackTrace();
		}





		return null;
	}


}
