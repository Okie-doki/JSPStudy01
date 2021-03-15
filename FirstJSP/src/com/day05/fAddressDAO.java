package com.day05;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class fAddressDAO {
	private static fAddressDAO instance = new fAddressDAO();
	public static fAddressDAO getInstance() {
		return instance;
	}
	
	
	
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jsp");
		return ds.getConnection();
	}
	
//	전체보기
	public ArrayList<Address> list(){
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Address> arr = new ArrayList<Address>();
		
		try {
			con = getConnection();
			String sql = "select num, name, addr, zipcode, tel from address";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Address ad = new Address();
				ad.setNum(rs.getInt("num"));
				ad.setName(rs.getString("name"));
				ad.setAddr(rs.getString("addr"));
				ad.setZipcode(rs.getString("zipcode"));
				ad.setTel(rs.getString("tel"));
				arr.add(ad);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return arr;
	}
	
//	출력 list 갯수
	public int addrCount() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			con = getConnection();
			String sql = "select count(*) as count from address";
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
	
//	검색된 list
	public ArrayList<Address> searchList(String field, String word){
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Address> arr = new ArrayList<Address>();
		
		try {
			con = getConnection();
			String sql = "select num, name, addr, zipcode, tel from address where "
					+field+" like '%"+word+"%'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Address ad = new Address();
				ad.setNum(rs.getInt("num"));
				ad.setName(rs.getString("name"));
				ad.setAddr(rs.getString("addr"));
				ad.setZipcode(rs.getString("zipcode"));
				ad.setTel(rs.getString("tel"));
				arr.add(ad);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return arr;
	}
	
//	검색된 결과 갯수
	public int searchCount(String field, String word) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			con = getConnection();
			String sql = "select count(*) count from address where "
					+field+" like '%"+word+"%'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				count = rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return count;
	}
	
//	상세보기
	public Address detail(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		Address ad = null;
		
		try {
			con = getConnection();
			String sql = "select num, name, addr, zipcode, tel from address where num = "+num;
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				ad = new Address();
				ad.setNum(rs.getInt("num"));
				ad.setName(rs.getString("name"));
				ad.setAddr(rs.getString("addr"));
				ad.setZipcode(rs.getString("zipcode"));
				ad.setTel(rs.getString("tel"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return ad;
	}
	
//	추가
	public void insert(Address ad) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con =  getConnection();
			String sql = "insert into address values(address_seq.nextval, ?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, ad.getName());
			ps.setString(2, ad.getAddr());
			ps.setString(3, ad.getZipcode());
			ps.setString(4, ad.getTel());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, null, null);
		}
	}
	
//	수정
	public void update(Address ad) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = getConnection();
			String sql = "update address set name=?, addr=?, zipcode=?, tel=? where num=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, ad.getName());
			ps.setString(2, ad.getAddr());
			ps.setString(3, ad.getZipcode());
			ps.setString(4, ad.getTel());
			ps.setInt(5, ad.getNum());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} closeConnection(con, ps, null, null);
	}
	
//	삭제
	public void delete(int num) {
		Connection con = null;
		Statement st = null;
		
		try {
			con = getConnection();
			String sql = "delete from address where num ="+num;
			st = con.createStatement();
			st.execute(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, null);
		}
	}
	
//	우편번호 검색
	public ArrayList<ZipCode> getZipcode(String dong){
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<ZipCode> arr = new ArrayList<ZipCode>();
		
		try {
			con = getConnection();
			String sql = "select * from zipcode where dong like '%"+dong+"%'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				ZipCode zip = new ZipCode();
				zip.setZipcode(rs.getString("zipcode"));
				zip.setSido(rs.getString("sido"));
				zip.setGugun(rs.getString("gugun"));
				zip.setDong(rs.getString("dong"));
				zip.setBunji(rs.getString("bunji"));
				zip.setSeq(rs.getInt("seq"));
				arr.add(zip);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return arr;
	}
	
	private void closeConnection(Connection con,
			PreparedStatement ps, Statement st,
			ResultSet rs) {
		try {
			if(con!=null) con.close();
			if(ps!=null) ps.close();
			if(st!=null) st.close();
			if(rs!=null) rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
