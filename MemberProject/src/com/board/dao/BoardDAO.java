package com.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.board.dto.BoardDTO;

public class BoardDAO {
//	DB셋팅
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jsp");
		return ds.getConnection();
	}
	
//	전체보기(검색 가능)
	public ArrayList<BoardDTO> boardList(String field, String word){
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<BoardDTO> arr = new ArrayList<BoardDTO>();	
		
		try {
			con = getConnection();
			String sql = "";
//			검색 여부(word 값의 존져 여부 확인)
			if(word.equals("")) {
				sql = "select * from board order by num desc";
			}else { //검색값 존재
				sql = "select * from board where "+field+" like '%"+word+"' order by num desc";
			}
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setSubject(rs.getString("subject"));
				board.setWriter(rs.getString("writer"));
				board.setReadcount(rs.getInt("readcount"));
				board.setReg_date(rs.getString("reg_date"));
				arr.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return arr;
	}
	
//	상세보기
	public BoardDTO boardView(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		BoardDTO board = null;
		String sql = "";
		
		try {
			con = getConnection();
			st = con.createStatement();
			sql = "update board set readcount = readcount+1 where num="+num; //조회수
			st.executeUpdate(sql);
			sql = "select * from board where num = "+num;
			rs = st.executeQuery(sql);
			while(rs.next()) {
				board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));
				board.setEmail(rs.getString("email"));
				board.setContent(rs.getString("content"));
				board.setIp(rs.getString("ip"));
				board.setReadcount(rs.getInt("readcount"));
				board.setRef(rs.getInt("ref"));
				board.setRe_step(rs.getInt("re_step"));
				board.setRe_level(rs.getInt("re_level"));
				board.setPasswd(rs.getString("passwd"));
				board.setReg_date(rs.getString("reg_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return board;
	}
	
//	list 갯수(검색 연동)
	public int boardCount(String field, String word) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			con = getConnection();
			String sql = "";
			st = con.createStatement();
			
//			word 값 존재하는지로 검색여부 판단
			if(word.equals("")) {
				sql = "select count(*) count from board";
			}else {
				sql = "select count(*) count from board where "+field+" like '%"+word+"'";
			}
			rs = st.executeQuery(sql);
			if(rs.next())
				count = rs.getInt("count");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return count;
	}
	
//	게시글 추가
	public void boardInsert(BoardDTO board) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			String sql = "insert into board(num, writer, subject, email, content, ip, passwd) "
					+ "values(board_seq.nextval, ?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, board.getWriter());
			ps.setString(2, board.getSubject());
			ps.setString(3, board.getEmail());
			ps.setString(4, board.getContent());
			ps.setString(5, board.getIp());
			ps.setString(6, board.getPasswd());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, null, null);
		}
	}
	
//	게시글 수정(비밀번호 체크 후 수정)
	public int boardUpdate(BoardDTO board) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int flag = 0;
		
		try {
			con = getConnection();
			String sql = "select passwd from board where num = "+board.getNum();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) { //비번확인
				if(rs.getString("passwd").equals(board.getPasswd())) {
					sql = "update board set subject=?, email=?, content=?, ip=?, reg_date=sysdate where num=?";
					ps = con.prepareStatement(sql);
					ps.setString(1, board.getSubject());
					ps.setString(2, board.getEmail());
					ps.setString(3, board.getContent());
					ps.setString(4, board.getIp());
					ps.setInt(5, board.getNum());
					flag = ps.executeUpdate();
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, null, rs);
		}
		
		return flag;
	}
	
//	게시글 삭제
	public int boardDelete(int num) {
		Connection con = null;
		Statement st = null;
		int flag = 0;
		
		try {
			con = getConnection();
			String sql = "delete from board where num="+num;
			st = con.createStatement();
			flag = st.executeUpdate(sql); //삭제된 행의 수 리턴
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, null);
		}
		return flag;
	}
	
	private void closeConnection(Connection con, PreparedStatement ps, Statement st, ResultSet rs) {
		try {
			if(con!=null) con.close();
			if(ps!=null) ps.close();
			if(st!=null) st.close();
			if(rs!=null) rs.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
