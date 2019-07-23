package com.kh.jimcarry.board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jimcarry.board.model.vo.Attachment;
import com.kh.jimcarry.board.model.vo.Board;

import static com.kh.jimcarry.common.JDBCTemplate.*;



public class BoardDao {
	private Properties prop = new Properties();

	public BoardDao() {
		String fileName =
				BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<Board> selectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;

		String query= prop.getProperty("selectList");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			list = new ArrayList<Board>();

			while(rset.next()) {
				Board b = new Board();

				b.setPostCode(rset.getString("POST_CODE"));
				b.setUserNo(rset.getString("USER_NO"));
				b.setPostDate(rset.getDate("POST_DATE"));
				b.setPostTitle(rset.getString("POST_TITLE"));
				b.setPostContents(rset.getString("POST_CONTENTS"));
				b.setAttachments(rset.getString("ATTACHMENTS"));
				b.setDelDate(rset.getDate("DEL_DATE"));

				list.add(b);
			}



		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}

		return list;
	}
	//게시판 삽입용메소드
	public int insertBoardContent(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("inserBoard");

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
	//Board테이블의 현재 sequence값을 가져오는 메소드
	public String selectCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;

		String postCode = "";

		String querty = prop.getProperty("selectCurrval");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(querty);

			if(rset.next()) {
				//postCode = rset.getInt(colum);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}


		return postCode;
	}
	//첨부파일정보 insert용 메소드 insertAttachment
	public int inserAttachment(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertAttachment");
		return 0;
	}



}
