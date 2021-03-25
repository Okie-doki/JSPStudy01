package com.day03;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AddressDAO {
//	db셋팅 - 싱글톤
	private static AddressDAO instance = new AddressDAO();
	
	public static AddressDAO getInstance() {
		return instance;
	}
	
//	jndi(java naming and directory interface)
//	dbcp(database connection pool) 사용하기 위한 처리
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jsp");
		return ds.getConnection();
	}
	
//	전체보기(기본 출력)
	public ArrayList<Address> getList(){
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Address> arr = new ArrayList<Address>();
		
		try {
			con = getConnection();
			String sql = "select * from address";
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
	
//	전체보기(검색 결과 출력)
	public ArrayList<Address> getList(String field, String word){
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<Address> arr = new ArrayList<Address>();
		
		try {
			con = getConnection();
			if(word.equals(""))
				sql = "select * from address";
			else
				sql = "select * from address where "+field+" like '%"+word+"%'";
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
	
//	출력 결과 개수
	public int getCount(String field, String word) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		String sql = "";
		
		try {
			con = getConnection();
			if(word.equals(""))
				sql = "select count(*) as count from address";
			else
				sql = "select count(*) as count from address where "
						+field+" like '%"+word+"%'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()){
				count = rs.getInt("count");
//				count = rs.getInt(1); //sql문 결과값을 열의 위치로 선택
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return count;
	}
	
//	상세보기
	public Address findByNum(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		Address ad = null;
		
		try {
			con = getConnection();
			String sql = "select * from address where num="+num;
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
	public void addressInsert(Address ad) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = getConnection();
			String sql = "insert into address values(address_seq.nextval, ?, ?, ?, ?)";
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
	public void addressUpdate(Address ad) {
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
		} finally {
			closeConnection(con, ps, null, null);
		}
	}
	
//	삭제
	public void addressDelete(int num) {
		Connection con = null;
		Statement st = null;
		
		try {
			con = getConnection();
			String sql = "delete from address where num="+num;
			st = con.createStatement();
			st.execute(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, null);
		}
	}
	
//	우편번호 찾기
	public ArrayList<ZipCodeBean> zipcodeRead(String dong){
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<ZipCodeBean> zarr = new ArrayList<ZipCodeBean>();
		
		try {
			con = getConnection();
			String sql = "select * from zipcode where dong like '%"+dong+"%'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				ZipCodeBean zip = new ZipCodeBean();
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

	private void closeConnection(Connection con,
			PreparedStatement ps, Statement st,
			ResultSet rs) {
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
