package com.grocerymania.codes.Login;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {
	
	public boolean LoginUser(LoginUser lu) throws ClassNotFoundException{
		boolean sts = false;
		String query = "SELECT * FROM user WHERE emailid = ? and pass = ? ";
		String url = "jdbc:mysql://localhost:3306/grocerymania";
		String user = "root";
		String password = "pass123";
		
		Class.forName("com.mysql.jdbc.Driver");
		
		try(Connection conn = DriverManager.getConnection(url, user, password)){
			
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, lu.getEmail());
			ps.setString(2, lu.getPassword());
			
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			sts = rs.next();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return sts;
	}
	
}
