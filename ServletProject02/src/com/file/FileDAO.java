package com.file;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FileDAO {
//	DB셋팅
	private static FileDAO instance = new FileDAO();
	public static FileDAO getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jsp");
		return ds.getConnection();
	}
	
//	전체보기
	public ArrayList<FileDTO> fileList(){
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<FileDTO> arr = new ArrayList<FileDTO>();
		
		try {
			con = getConnection();
			String sql = "select * from imagetest";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				FileDTO f = new FileDTO();
				f.setName(rs.getString("name"));
				f.setTitle(rs.getString("title"));
				f.setImage(rs.getString("image"));
				arr.add(f);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return arr;
	}
	
//	추가
	public void fileInsert(FileDTO file) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = getConnection();
			String sql = "insert into imagetest values(?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, file.getName());
			ps.setString(2, file.getTitle());
			ps.setString(3, file.getImage());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, null, null);
		}
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
