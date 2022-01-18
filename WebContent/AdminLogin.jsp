<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel - Login Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" style="text-align:left;">
  <nav class="navbar navbar-dark bg-dark" style="background-color: #000; text-align: left; width: 100%;">
    <a class="navbar-brand" href="#">GROCERY MANIA (ADMIN PANEL) Login Page</a>
  </nav>
</div>
  <div class="container" style="width: 50%">
  		<form action="AdminLogin" method="post" class="form-group">
  			<input type="text" name="usr" placeholder="Enter Admin Username" class="form-control" required/><br>
  			<input type="password" name="psw" placeholder="Enter Admin Password" class="form-control" required/><br>
  			<input type="submit" value="Login" class="btn btn-success form-control" />
  		</form>
  </div>
  <br><br>
  <footer style="text-align: center; color: #000; background-color: #ddd;">
  	<h5 style="padding: 12px 12px;">GroceryMania &copy; 2021 All Rights Reserved!</h5>
  </footer>
</body>
</html>