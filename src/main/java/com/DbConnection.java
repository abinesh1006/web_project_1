package com;

import java.sql.*;

public class DbConnection {

	public static Connection createconn() {
		
		Connection con=null;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				 con =DriverManager.getConnection("jdbc:mysql://localhost:3306/tester","root","");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return con;

	}
}
