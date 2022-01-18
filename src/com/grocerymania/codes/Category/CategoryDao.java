package com.grocerymania.codes.Category;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class CategoryDao {

		public int AddCatgory(Category c) throws ClassNotFoundException{
			
			String query = "INSERT INTO category(catname,catdesc) VALUES(?,?);";
			String url = "jdbc:mysql://localhost:3306/grocerymania";
			String user = "root";
			String password = "pass123";
			int result =0;
			
			Class.forName("com.mysql.jdbc.Driver");
			
			try(Connection conn = DriverManager.getConnection(url, user, password)){
				
				PreparedStatement ps = conn.prepareStatement(query);
				ps.setString(1, c.getCategoryName());
				ps.setString(2, c.getCategoryDesc());
				
				result = ps.executeUpdate();
				
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			return result;
		}
}
