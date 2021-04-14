package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.Test;

public class DBConnectionTest {
	private static final String DRIVER="com.mysql.cj.jdbc.Driver";
	private static final String URL="jdbc:mysql://localhost:3306/world?userSSL=false";
	private static final String USER="root";
	private static final String PW="root";
	
	@Test
	public void testConnection() {
		try {
			Class.forName(DRIVER);
			Connection con = DriverManager.getConnection(URL, USER, PW);
			System.out.println(con);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
}
