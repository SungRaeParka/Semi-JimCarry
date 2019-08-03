package com.kh.jimcarry.board.model.dao;

import static com.kh.jimcarry.common.JDBCTemplate.close;

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
import com.kh.jimcarry.board.model.vo.Comments;

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

	// 게시물 카운터
	public int getListCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("selectListCount");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}

		return listCount;
	}

	// 조회수 카운터
	public int updateCount(Connection con, String num) {
		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("updateCount");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);
			pstmt.setString(2, num);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 게시판 상세보기
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

			while (rset.next()) {
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
		} finally {
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

	// 검색 기능 메소드

	public ArrayList<Board> searchList(Connection con, String searchCondition,
			String word, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		Board b = null;
		String search = "%" + word + "%";
		String sql = "";
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		try {

			// 제목으로 검색
			if (searchCondition.equals("title")) {
				sql = prop.getProperty("searchTitle");
				// 작정자로 검색
			} else if (searchCondition.equals("writer")) {
				sql = prop.getProperty("searchWriter");
				System.out.println("searchCondition 어디 : " + searchCondition);
				System.out.println("word 어디여 : " + word);

				// 내용으로 검색
			} else {

			}

			System.out.println( sql );

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Board>();

			while (rset.next()) {
				b = new Board();

				b.setPostNo(rset.getInt("POST_NO"));
				b.setPostTitle(rset.getString("POST_TITLE"));
				b.setPostCode(rset.getString("POST_CODE"));
				b.setPostContents(rset.getString("POST_CONTENTS"));
				b.setPostDate(rset.getDate("POST_DATE"));
				b.setbCount(rset.getInt("B_COUNT"));
				b.setWriter(rset.getString("MEMBER_ID"));

				list.add(b);
				System.out.println("나는 리스트다 : ::: " + list);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	/*//검색 페이징
	public ArrayList<Board> searchPage(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		Board b = null;
		String query = prop.getProperty("selectListWithPageing2");

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
	}*/

	//게시글 업데이트
	public int updateBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateBoard");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getPostTitle());
			pstmt.setString(2, b.getPostContents());
			pstmt.setString(3, b.getPostCode());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	//게시 사진 업데이트
	public int updateAttachmen(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateAttachmen");

		try {
			for(int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getPostCode());
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	//게시판 삭제 메소드
	public int deleteBoard(Connection con, String num) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteBoard");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}


		return result;
	}
	//댓글 생성
	public int insertReply(Connection con, Comments c) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertReply");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, c.getPostCode());
			pstmt.setString(2, c.getUserNo());
			pstmt.setString(3, c.getCommentCode());

			result = pstmt.executeUpdate();


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}

	//댓글 조회

	public ArrayList<Comments> selectReplyList(Connection con, String postCode) {

			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<Comments> list = null;

			String query = prop.getProperty("selectReplyList");

			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, postCode);

				rset = pstmt.executeQuery();

				list = new ArrayList<Comments>();

			while(rset.next()) {
				Comments c = new Comments();

				c.setCommentCode(rset.getString("COMMENT_CODE"));
				c.setPostCode(rset.getString("POST_CODE"));
				c.setUserNo(rset.getString("USER_NO"));
				c.setCommentDate(rset.getDate("COMMENT_DATE"));
				c.setCommentContents(rset.getString("COMMENT_CONTENTS"));
				c.setWriter(rset.getString("MEMBER_ID"));

				list.add(c);
			}


			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(pstmt);
				close(rset);
			}
			System.out.println("댓글 조회 : " + list);
			return list;


	}




	public int getListCountsearch(Connection con, String word, String searchCondition) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String search = "%" + word + "%";


			try {
				String query = prop.getProperty("selectListCountTitle");

				if(searchCondition.equals("title")) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, search);
				rset = pstmt.executeQuery();

				if(rset.next()) {
					listCount = rset.getInt(1);
					System.out.println("selectListCountTitle : :::::: " + listCount );
				}



				}else if(searchCondition.equals("writer")){
					String  user = prop.getProperty("selectListCountTitleUser");
					pstmt = con.prepareStatement(user);
					pstmt.setString(1, search);

					rset = pstmt.executeQuery();
					if(rset.next()) {
						listCount = rset.getInt(1);

						System.out.println("selectListCountTitleUser : :::::: " + listCount );
					}
				}




			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}


		return listCount;
	}

	public ArrayList<Comments> selectReplyListOne(Connection con, String num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Comments> comment = null;

		String query =  prop.getProperty("ReplyOne");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);

			rset = pstmt.executeQuery();
			comment = new ArrayList<Comments>();

			while(rset.next()) {
				Comments c = new Comments();
				c.setWriter(rset.getString("MEMBER_ID"));
				c.setCommentContents(rset.getString("COMMENT_CONTENTS"));
				c.setCommentDate(rset.getDate("COMMENT_DATE"));
				c.setCommentCode(rset.getString("COMMENT_CODE"));
				c.setPostCode(rset.getString("POST_CODE"));

				comment.add(c);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}



		return comment;
	}




}
