<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GROCERY MANIA - Contact Us</title>
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
      <li><a href="index.jsp">Home</a></li>
      <li><a href="shop.jsp">Shop</a></li>
      <li ><a href="About.jsp">About</a></li>
      <li class="active"><a href="contact.jsp">Contact</a></li>
    </ul>
  </div>
</nav>
  <!-- End of Navbar & Header -->
<div class="container" style="font-family: Arial, sans-serif; s">
<h1>Contact Us</h1>
<form action="Contact" class="form-group" method="post">
	<input type="email" name="e1" placeholder="Enter your E-mail" class="form-control"/><br>
	<textarea rows="4" class="form-control" placeholder="Enter your queries or feedback" name="feedback" ></textarea><br>
	<input type="submit" value="Send" class="btn btn-primary" />
</form>
</div>
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
            <a href="#!" class="text-dark">About Us</a>
          </li>
          <li>
            <a href="#!" class="text-dark">Contact Us</a>
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
    <a class="text-dark" href="#">GroceryMania.com</a>
  </div>
  <!-- Copyright -->
</footer>
<!-- Footer -->
  <!-- End of Footer -->

</body>
</html>