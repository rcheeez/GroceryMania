<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GroceryMania - Checkout</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- Navbar & Header -->
<nav class="navbar navbar-success">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">GroceryMania</a>
    </div>
  </div>
</nav>

  <!-- End of Navbar & Header -->
  
  <!-- Checkout Form -->
  <div class="container">
    	<%
    	int userid = Integer.parseInt(request.getParameter("uid"));
  		%>
  <form action="Checkout" method="post" class="form-group">
  		<%
  		String url = "jdbc:mysql://localhost:3306/grocerymania";
		String user = "root";
		String password = "pass123";
		
		String sql = "select fname,lname,address,phoneno from user where uid = ? ";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, user, password);
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, userid);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			String fname = rs.getString("fname");
			String lname = rs.getString("lname");
			String address = rs.getString("address");
			String conc = rs.getString("phoneno");
  		%>
  			<input type="text" value="<%= fname +" "+ lname%>" class="form-control" readonly/><br>
  			<input type="text" value="<%= address%>" class="form-control" readonly /><br>
  			<input type="text" value="<%= conc%>" class="form-control" readonly/><br>
  		<%
		}  	
		%>
  		<input type="radio" name="pay" value="COD" required/>Cash On Delivery <br><br>
  		<table class="table">
  		<tr>
  			<th>Product Name</th>
  			<th>Product Image</th>
  			<th>Product Quantity</th>
  			<th>Product Price</th>
  		</tr>
  		<%
  			int totalprice =0;
  			String sql1 = "select uid,pname,pimage,sum(product_qty), sum(price) as price from cart where uid = ? group by pname;";
  			PreparedStatement pst = conn.prepareStatement(sql1);
  			pst.setInt(1, userid);
  			ResultSet rst = pst.executeQuery();
  			while(rst.next()){
  				String name = rst.getString("pname");
  				String image = rst.getString("pimage");
  				int quantity = rst.getInt("sum(product_qty)");
  				int price = rst.getInt("price");
  			
  		%>
			<tr>
				<td><%= name%></td>
				<td><img alt="Products" src="./Images/<%= image %>" height="50px;"></td>
				<td><%= quantity %></td>
				<td><%= price %></td>
			</tr>
		<%
		totalprice = totalprice + price;
  			}
		%>
		<tr>
			<td colspan="4" align="right">TotalPrice : Rs. <%= totalprice %></td>
		</tr>
		</table>
		<input type="hidden" name="uid" value="<%= userid%>" />
		<input type="submit" value="Checkout & Make Bill" class="form-control btn btn-primary" />
  	</form>
  	
 
  </div>
  <br>
  <!-- End of Checkout Form -->
 <!-- Footer -->
<footer class="bg-light text-center text-lg-start">
  <!-- Grid container -->
  <div class="container p-4" style="background-color: rgba(0, 0, 0, 0.2);">
    <!--Grid row-->
    <div class="row">
      <!--Grid column-->
      <div class="col-lg-6 col-md-12 mb-4 mb-md-0">
        <h5 class="text-uppercase">Grocery Mania</h5>

        <p>
          Welcome to the Grocery Mania. The Paradise of Groceries are here.
          All types of Grocery products available.
          Our motto is 'You Order, We Deliver'.
        </p>
      </div>
      <!--Grid column-->

      <!--Grid column-->
      <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
        <h5 class="text-uppercase">Links</h5>

        <ul class="list-unstyled mb-0">
          <li>
            <a href="About.jsp" class="text-dark">About Us</a>
          </li>
          <li>
            <a href="contact.jsp" class="text-dark">Contact Us</a>
          </li>
          <li>
            <a href="#!" class="text-dark">Privacy Policy</a>
          </li>
          <li>
            <a href="#!" class="text-dark">Disclaimer</a>
          </li>
        </ul>
      </div>
      <!--Grid column-->

      <!--Grid column-->
      <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
        <h5 class="text-uppercase mb-0">External Links</h5>

        <ul class="list-unstyled">
          <li>
            <a href="#" class="text-dark">Facebook</a>
          </li>
          <li>
            <a href="#" class="text-dark">Instagram</a>
          </li>
          <li>
            <a href="#" class="text-dark">Twitter</a>
          </li>
          <li>
            <a href="#" class="text-dark">WhatsApp</a>
          </li>
        </ul>
      </div>
      <!--Grid column-->
    </div>
    <!--Grid row-->
  </div>
  <!-- Grid container -->

  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.4);">
    © 2021 Copyright:
    <a class="text-dark" href="index.jsp">GroceryMania.com</a>
  </div>
  <!-- Copyright -->
</footer>
<!-- Footer -->
  <!-- End of Footer -->


</body>
</html>