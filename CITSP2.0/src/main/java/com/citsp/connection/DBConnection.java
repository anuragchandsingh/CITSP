package com.citsp.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public static Connection createConnection() {
		Connection con = null;
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String username = "SYSTEM";
		String password = "MANAGER";

		
			try 
			{
				Class.forName(driver);
				con = DriverManager.getConnection(url, username, password);
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		
		return con;

	}
}
