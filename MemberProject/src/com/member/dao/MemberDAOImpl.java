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

//	회원추가
	@Override
	public void memInsert(MemberDTO member) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = getConnection();
			String sql = "insert into memberdb values(?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getName());
			ps.setString(2, member.getUserid());
			ps.setString(3, member.getPwd());
			ps.setString(4, member.getEmail());
			ps.setString(5, member.getPhone());
			ps.setInt(6, member.getAdmin());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, null, null);
		}
	}

//	회원수정
	@Override
	public int memUpdate(MemberDTO member) {
		Connection con = null;
		PreparedStatement ps = null;
		int flag = 0;
		
		try {
			con = getConnection();
			String sql = "update memberdb set name=?, pwd=?, email=?, admin=?, phone=? where userid=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getName());
			ps.setString(2, member.getPwd());
			ps.setString(3, member.getEmail());
			ps.setInt(4, member.getAdmin());
			ps.setString(5, member.getPhone());
			ps.setString(6, member.getUserid());
			flag = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, null, null);
		}
		
		return flag;
	}

//	회원삭제
	@Override
	public void memDelete(String userId) {
		Connection con = null;
		Statement st = null;
		
		try {
			con = getConnection();
			String sql = "delete from memberdb where userid ='"+userId+"'";
			st = con.createStatement();
			st.execute(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, null);
		}
	}

//	상세보기
	@Override
	public MemberDTO findById(String userId) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		MemberDTO member = null;
		
		try {
			con = getConnection();
			String sql = "select name, userid, pwd, email, phone, admin from memberdb where userid = '"+userId+"'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				member = new MemberDTO();
				member.setName(rs.getString("name"));
				member.setUserid(rs.getString("userid"));
				member.setPwd(rs.getString("pwd"));
				member.setEmail(rs.getString("email"));
				member.setPhone(rs.getString("phone"));
				member.setAdmin(rs.getInt("admin"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return member;
	}

//	아이디 중복확인
	@Override
	public String idCheck(String userId) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		String flag = "yes"; //id 사용 가능
		
		try {
			con = getConnection();
			String sql = "select * from memberdb where userid = '"+userId+"'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next())
				flag = "no";
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return flag;
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
