package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class dao {
	public int signup(userBean be) throws ClassNotFoundException, SQLException {
		Connection conn = DbConnection.createconn();
		PreparedStatement prep = null;
		prep = conn.prepareStatement("insert into user values(?,?,?,?,md5(?))");
		prep.setString(1, be.getEmail());
		prep.setString(2, be.getFirstName());
		prep.setString(3, be.getLastName());
		prep.setLong(4,be.getMobileNumber());
		prep.setString(5,be.getpassword());
		int success = prep.executeUpdate();
		prep.close();
		conn.close();
		return success;
	}

}
