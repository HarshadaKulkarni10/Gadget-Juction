package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private static Connection conn;
	public static Connection getConn()
	{
		conn = null;
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gadget_junction", "root", "123456");
			
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return conn;
	}
	
	
}
