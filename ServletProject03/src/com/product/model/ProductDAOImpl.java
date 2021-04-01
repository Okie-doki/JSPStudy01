package com.product.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ProductDAOImpl implements ProductDAO {
//	DB 셋팅
	private static ProductDAOImpl instance = new ProductDAOImpl();
	public static ProductDAOImpl getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context iniCtx = new InitialContext();
		Context envCtx = (Context)iniCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jsp");
		return ds.getConnection();
	}

//	상품 전체보기
	@Override
	public ArrayList<Product> productAllfind() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Product> arr = new ArrayList<Product>();
		
		try {
			con = getConnection();
			String sql = "select * from product";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getInt("p_id"));
				product.setPname(rs.getString("p_name"));
				product.setUnitPrice(rs.getInt("p_unitprice"));
				product.setDescription(rs.getString("p_description"));
				product.setCategory(rs.getString("p_category"));
				product.setManufacturer(rs.getString("p_manufacturer"));
				product.setUnitsInStock(rs.getInt("p_unitsinstock"));
				product.setCondition(rs.getString("p_condition"));
				product.setFilename(rs.getString("p_filename"));
				arr.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		
		return arr;
	}

//	상품 상세보기
	@Override
	public Product findById(long productId) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		Product product = null;
		
		try {
			con = getConnection();
			String sql = "select * from product where p_id="+productId;
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				product = new Product();
				product.setProductId(rs.getLong("p_id"));
				product.setPname(rs.getString("p_name"));
				product.setUnitPrice(rs.getInt("p_unitprice"));
				product.setDescription(rs.getString("p_description"));
				product.setCategory(rs.getString("p_category"));
				product.setManufacturer(rs.getString("p_manufacturer"));
				product.setUnitsInStock(rs.getInt("p_unitsinstock"));
				product.setCondition(rs.getString("p_condition"));
				product.setFilename(rs.getString("p_filename"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return product;
	}

//	상품 추가
	@Override
	public void productInsert(Product product) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = getConnection();
			String sql = "insert into product values(product_seq.nextval, ?,?,?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, product.getPname());
			ps.setInt(2, product.getUnitPrice());
			ps.setString(3, product.getDescription());
			ps.setString(4, product.getCategory());
			ps.setString(5, product.getManufacturer());
			ps.setLong(6, product.getUnitsInStock());
			ps.setString(7, product.getCondition());
			ps.setString(8, product.getFilename());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} closeConnection(con, ps, null, null);
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
