package com.grocerymania.codes.Register;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class UserDao {
	public int registerUser(User u) throws ClassNotFoundException{
		String query = "INSERT INTO user(fname,lname,phoneno,emailid,address,pass) VALUES(?,?,?,?,?,?);";
		String url = "jdbc:mysql://localhost:3306/grocerymania";
		String user = "root";
		String password = "pass123";
		int result = 0;
		
		Class.forName("com.mysql.jdbc.Driver");
		
		try(Connection conn = DriverManager.getConnection(url, user, password)){
			
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, u.getfName());
			ps.setString(2, u.getlName());
			ps.setString(3, u.getContact());
			ps.setString(4, u.getEmailid());
			ps.setString(5,u.getAddress());
			ps.setString(6, u.getPass());
			
			result = ps.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}
}
