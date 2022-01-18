<%@page import="java.util.Iterator"%>
<%@page import="com.grocerymania.codes.Cart.Cart"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page session="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>GROCERYMANIA - WELCOME</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
    <ul class="nav navbar-nav">
      <li class="active"><a href="Welcome.jsp">Home</a></li>
      <li><a href="shop.jsp">Shop</a></li>
      <li><a href="About.jsp">About</a></li>
      <li><a href="contact.jsp">Contact</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a data-toggle="modal" data-target="#UserAccountModal"><span class="glyphicon glyphicon-user"></span>My Account</a></li>  
    </ul>
  </div>
</nav>
 <%
        HttpSession session = request.getSession(false);
        String eml = "";
        String pass1 = "";
        String msg = "";
        String role = "";
         if(session != null){
        	 eml = (String)session.getAttribute("emailid");
             pass1 = (String)session.getAttribute("pass");
             msg = (String)session.getAttribute("msg");
             role = (String)session.getAttribute("role");
         }
         else if(session == null){
        	 response.sendRedirect("index.jsp");
         }
         %>
<div style="color: red; "><%= msg %></div>
<%
	if(role.equals("reg")){
		
%>
<script>
	alert("Registeration Successfull!");
</script>
<%
	}

if(role.equals("log")){
%>
<script>
	alert("Login Successfull!");
</script>
<%
}else{
%>
<script type="text/javascript">
	alert("You emailid or password is incorect!");
</script>
<%
}
%>
  <!-- End of Navbar & Header -->
  <!-- Register Sucessfull Message -->

  
  <!-- Carousel -->
  	<img src="./Images/carousel1.png" width="100%" height="50%">
  <!-- End of Carousel -->

  <!-- Grids -->
 <div class="container">
 <br>
  <div class="row row-cols-2">
    <div class="col">
    	<img src="./Images/banner1.png" width="100%">
    </div>
    <br>
    <div class="col">
    	<img src="./Images/banner2.png" width="100%">
    </div>
    <br>
    <div class="col">
    	<img src="./Images/banner3.png" width="100%">
    </div>
    <br>
    <div class="col">
    	<img src="./Images/banner4.png" width="100%">
    </div>
    <br>
  </div>
</div>
  <!-- End of Grids -->
  
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
    <a class="text-dark" href="Welcome.jsp">GroceryMania.com</a>
  </div>
  <!-- Copyright -->
</footer>
<!-- Footer -->
  <!-- End of Footer -->
  <!-- User DashBoard -->
 <div class="modal" tabindex="-1" role="dialog" id="UserAccountModal" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h2 class="modal-title">User DashBoard</h2>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <% 
		String url = "jdbc:mysql://localhost:3306/grocerymania";
		String user = "root";
		String pass = "pass123";
		String query = "select uid,fname,lname,emailid,phoneno,pass from user where emailid = ? and pass = ?";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, user, pass);
		PreparedStatement psmt = conn.prepareStatement(query);
		psmt.setString(1, eml);
		psmt.setString(2, pass1);
		ResultSet rs = psmt.executeQuery();
		int uid = 0;
		while(rs.next()){
			 uid = rs.getInt("uid");
			String name1 = rs.getString("fname");
			String name2 = rs.getString("lname");
			String email = rs.getString("emailid");
			String con = rs.getString("phoneno");
			String pass2 = rs.getString("pass");
			
			
		%>
        <h5>User Details</h5>
        <table class="table">
        	<tr>
        		<th scope="row">Name: </th>
        		<td colspan="2"><%= name1 + " "+ name2%></td>
        	</tr>
        	<tr>
        		<th scope="row">Email: </th>
        		<td><%= email%></td>
        		<td><a href="#" data-toggle="modal" data-target="#UpdateEmail">Change E-mail</a></td>
        	</tr>
        	<tr>
        		<th scope="row">Contact: </th>
        		<td><%= con %></td>
        		<td><a href="#" data-toggle="modal" data-target="#UpdateContact">Change Number</a></td>
        	</tr>
        	        	<tr>
        		<th scope="row">Password: </th>
        		<td><%= pass2%></td>
        		<td><a href="#" data-toggle="modal" data-target="#UpdatePassword">Change Password</a></td>
        	</tr>
        </table>
        <%
		}
        %>
        <a href="#" class="btn btn-danger text-center" data-toggle="modal" data-target="#DeleteModal">Delete Account</a>
        <a href="index.jsp" class="btn btn-primary">Log Out</a>
      </div>
    </div>
  </div>
</div>

 
 <!-- End of User Dashboard --> 
<!-- Delete Popup -->
<div class="modal" tabindex="-1" role="dialog" id="DeleteModal" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Delete Account</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p align="center">Are you sure you want to delete the account?</p>
        <form action="DeleteUser" method="post">
        	<input type="hidden" name="uid" value="<%= uid%>"/>
        	<input type="submit" value="Yes" class="btn btn-danger"/>
        	<input type="reset" value="No" class="btn btn-success close" data-dismiss="modal" aria-label="Close"/>
        </form>
      </div>
      
    </div>
  </div>
</div>

<!-- End of Delete Popup -->
<!-- Update Email Modal -->
<div class="modal" tabindex="-1" role="dialog" id="UpdateEmail" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Update Email</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p style="font-weight: bold; ">Enter new Emailid: </p>
        <form action="UpdateEmail" method="post" class="form-group">
        	<input type="email" name="eml" class="form-control" required/><br>
        	<input type="hidden" name="uid" value="<%= uid%>"/>
        	<input type="hidden" name="update" value="eml"/>
        	<input type="submit" value="Change" class="btn btn-danger"/>
        </form>
      </div> 
    </div>
  </div>
</div>

<!-- End of Update Email Modal -->
<!-- Update Contact Modal -->
<div class="modal" tabindex="-1" role="dialog" id="UpdateContact" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Update Contact No. </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p style="font-weight: bold; ">Enter new number: </p>
        <form action="UpdatePhone" method="post" class="form-group">
        	<input type="text" name="phno" class="form-control" required/><br>
        	<input type="hidden" name="uid" value="<%= uid%>"/>
        	<input type="submit" value="Change" class="btn btn-danger"/>
        </form>
      </div>
      
    </div>
  </div>
</div>

<!--  End of Contact Modal -->
<!-- Update Password Modal -->
<div class="modal" tabindex="-1" role="dialog" id="UpdatePassword" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Update Password</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p style="font-weight: bold; ">Enter new Password: </p>
        <form action="UpdatePassword" method="post" class="form-group">
        	<input type="password" name="psw" class="form-control" required/><br>
        	<input type="hidden" name="uid" value="<%= uid%>"/>
        	<input type="submit" value="Change" class="btn btn-danger"/>
        </form>
      </div>
      
    </div>
  </div>
</div>

<!-- End of Update Password modal -->
</body>
</html>
    