package org.addr.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AddressDAOImpl implements AddressDAO {
//	DB셋팅
	private static AddressDAOImpl instance = new AddressDAOImpl();
	public static AddressDAOImpl getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jsp");
		return ds.getConnection();
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
	
//	전체보기
	@Override
	public ArrayList<Address> getAddress(String field, String word) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Address> arr = new ArrayList<Address>();
		
		try {
			con = getConnection();
			String sql = "select * from address where "+field+" like '%"+word+"%'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Address addr = new Address();
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
	public Address findByNum(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		Address address = null;
		
		try {
			con = getConnection();
			String sql = "select * from address where num="+num;
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				address = new Address();
				address.setNum(rs.getInt("num"));
				address.setName(rs.getString("name"));
				address.setAddr(rs.getString("addr"));
				address.setZipcode(rs.getString("zipcode"));
				address.setTel(rs.getString("tel"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		
		return address;
	}

//	추가
	@Override
	public void addressInsert(Address address) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = getConnection();
			String sql = "insert into address values(num, ?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, address.getName());
			ps.setString(2, address.getAddr());
			ps.setString(3, address.getZipcode());
			ps.setString(4, address.getTel());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, null, null);
		}
	}

//	수정
	@Override
	public void addressUpdate(Address address) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = getConnection();
			String sql = "update address set name=?, addr=?, zipcode=?, tel=? where num=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, address.getName());
			ps.setString(2, address.getAddr());
			ps.setString(3, address.getZipcode());
			ps.setString(4, address.getTel());
			ps.setInt(5, address.getNum());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} closeConnection(con, ps, null, null);
	}

//	삭제
	@Override
	public void addressDelete(int num) {
		Connection con = null;
		Statement st = null;
		
		try {
			con = getConnection();
			String sql = "delete from address where num="+num;
			st = con.createStatement();
			st.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} closeConnection(con, null, st, null);
	}

//	개수
	@Override
	public int getCount(String field, String word) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			con = getConnection();
			String sql = "select count(*) count from address where "+field+" like '%"+word+"%'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next())
				count = rs.getInt("count");
		} catch (Exception e) {
			e.printStackTrace();
		} closeConnection(con, null, st, rs);
		return count;
	}

//	우편번호 검색
	@Override
	public ArrayList<Zipcode> findZipcode(String dong) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Zipcode> zarr = new ArrayList<Zipcode>();
		
		try {
			con = getConnection();
			String sql = "select * from zipcode where dong like '%"+dong+"%'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Zipcode zip = new Zipcode();
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

}
