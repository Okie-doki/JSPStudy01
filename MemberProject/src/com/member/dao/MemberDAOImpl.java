package com.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.member.dto.MemberDTO;

public class MemberDAOImpl implements MemberDAO{
	
//	DB셋팅
	private static MemberDAOImpl instance = new MemberDAOImpl();
	public static MemberDAOImpl getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jsp");
		return ds.getConnection();
	}

//	회원 list 전체보기
	@Override
	public ArrayList<MemberDTO> memList() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<MemberDTO> arr = new ArrayList<MemberDTO>();
		
		try {
			con = getConnection();
			st = con.createStatement();
			String sql = "select name, userid, pwd, email, phone, admin from memberdb";
			rs = st.executeQuery(sql);
			while(rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setName(rs.getString("name"));
				member.setUserid(rs.getString("userid"));
				member.setPwd(rs.getString("pwd"));
				member.setEmail(rs.getString("email"));
				member.setPhone(rs.getString("phone"));
				member.setAdmin(rs.getInt("admin"));
				arr.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return arr;
	}

	@Override
	public void memInsert(MemberDTO member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int memUpdate(MemberDTO member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void memDelete(String userId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberDTO findById(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String idCheck(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

//	로그인 체크
	@Override
	public int loginCheck(String userid, String pwd) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int flag = -1;
		
		try {
			con = getConnection();
			st = con.createStatement();
			String sql = "select * from memberdb where userid='"+userid+"'";
			rs = st.executeQuery(sql);
			if(rs.next()) { //결과값이 나오면 회원
				String tmp = rs.getString("pwd");
//				db에 저장되어 있는 비밀번호와 입력한 비밀번호 비교로 로그인 체크
				if(tmp.equals(pwd)) {
					flag = rs.getInt("admin"); //admin 값(0일반회원 / 1관리자)
				}else { //비밀번호 오류
					flag = 2;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return flag;
	}

//	등록 회원 수
	@Override
	public int getCount() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			con = getConnection();
			String sql = "select count(*) count from memberdb";
			st = con.createStatement();
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
	
	private void closeConnection(Connection con,
			PreparedStatement ps, Statement st, 
			ResultSet rs) {
		try {
			if(rs!=null) rs.close();
			if(st!=null) st.close();
			if(ps!=null) ps.close();
			if(con!=null) con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
