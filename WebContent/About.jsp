<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GROCERY MANIA - About Us</title>
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
      <li class="active"><a href="About.jsp">About</a></li>
      <li><a href="contact.jsp">Contact</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a data-toggle="modal" data-target="#CartModal"><span class="glyphicon glyphicon-shopping-cart"></span>MyCart</a></li>
    </ul>
  </div>
</nav>
  <!-- End of Navbar & Header -->
<div class="container" style="font-family: Arial, sans-serif; s">
<h1>Grocery Mania</h1>
<p>Grocery Mania was established on 25th March 2016 at Mumbai,Worli. It is founded by Mr.Archies Gurav. 
<br> GroceryMania provides employment for about 500 employees. It has their branches all over the Mumbai City.
 It provides all types of grocery products at a reasonable price. <br>To know more visit our <a href="index.jsp">website</a>. </p>
<br>
<br>
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