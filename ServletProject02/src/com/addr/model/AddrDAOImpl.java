package com.addr.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AddrDAOImpl implements AddrDAO {
	
//	DB셋팅
	private static AddrDAOImpl instance = new AddrDAOImpl();
	public static AddrDAOImpl getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context iniCtx = new InitialContext();
		Context envCtx = (Context)iniCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jsp");
		return ds.getConnection();
	}

//	전체보기
	@Override
	public ArrayList<AddrDTO> addrList() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<AddrDTO> arr = new ArrayList<AddrDTO>();
		
		try {
			con = getConnection();
			String sql = "select * from address order by num asc";
			st= con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				AddrDTO addr = new AddrDTO();
				addr.setNum(rs.getInt("num"));
				addr.setName(rs.getString("name"));
				addr.setAddr(rs.getString("addr"));
				addr.setTel(rs.getString("tel"));
				addr.setZipcode(rs.getString("zipcode"));
				arr.add(addr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		
		return arr;
	}

//	상세보기
	@Override
	public AddrDTO addrDetail(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		AddrDTO addr = null;
		
		try {
			con = getConnection();
			String sql = "select * from address where num="+num;
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				addr = new AddrDTO();
				addr.setName(rs.getString("name"));
				addr.setZipcode(rs.getString("zipcode"));
				addr.setAddr(rs.getString("addr"));
				addr.setTel(rs.getString("tel"));
				addr.setNum(rs.getInt("num"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return addr;
	}

//	추가
	@Override
	public void addrInsert(AddrDTO addr) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = getConnection();
			String sql = "insert into address values(address_seq.nextval, ?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, addr.getName());
			ps.setString(2, addr.getAddr());
			ps.setString(3, addr.getZipcode());
			ps.setString(4, addr.getTel());
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, null, null);
		}
	}

//	수정
	@Override
	public void addrUpdate(AddrDTO addr) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = getConnection();
			String sql = "update address set name=?, addr=?, zipcode=?, tel=? where num=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, addr.getName());
			ps.setString(2, addr.getAddr());
			ps.setString(3, addr.getZipcode());
			ps.setString(4, addr.getTel());
			ps.setInt(5, addr.getNum());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, null, null);
		}
	}

//	삭제
	@Override
	public void addrDelete(int num) {
		Connection con = null;
		Statement st = null;
		
		try {
			con = getConnection();
			String sql = "delete from address where num="+num;
			st = con.createStatement();
			st.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, null);
		}
	}

//	검색
	@Override
	public ArrayList<AddrDTO> addrSearchList(String field, String word) {
		// TODO Auto-generated method stub
		return null;
	}

//	개수(검색없음)
	@Override
	public int addrCount() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			con = getConnection();
			String sql = "select count(*) count from address";
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

//	개수(검색)
	@Override
	public int addrSearchCount(String field, String word) {
		// TODO Auto-generated method stub
		return 0;
	}

//	우편번호 검색
	@Override
	public ArrayList<ZipDTO> addrZipRead(String dong) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<ZipDTO> zarr = new ArrayList<ZipDTO>();
		
		try {
			con = getConnection();
			String sql = "select * from zipcode where dong like '%"+dong+"%'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				ZipDTO zip = new ZipDTO();
				zip.setSeq(rs.getInt("seq"));
				zip.setZipcode(rs.getString("zipcode"));
				zip.setSido(rs.getString("sido"));
				zip.setGugun(rs.getString("gugun"));
				zip.setDong(rs.getString("dong"));
				zip.setBunji(rs.getString("bunji"));
				zarr.add(zip);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return zarr;
	}

	private void closeConnection(Connection con, PreparedStatement ps,
			Statement st, ResultSet rs) {
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
