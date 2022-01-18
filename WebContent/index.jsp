<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>GROCERYMANIA - HOME</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="./validate.js"></script>
</head>
<body>
	<!-- Navbar & Header -->
<nav class="navbar navbar-success">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">GroceryMania</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="index.jsp">Home</a></li>
     <!--   <li><a href="shop.jsp">Shop</a></li> -->
      <li><a href="About.jsp">About</a></li>
      <li><a href="contact.jsp">Contact</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a data-toggle="modal" data-target="#registerModal"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
      <li><a data-toggle="modal" data-target="#loginModal"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
    </ul>
  </div>
</nav>

  <!-- End of Navbar & Header -->
  
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
    </div>
    <br>
    <div class="row row-cols-2">
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
    <a class="text-dark" href="index.jsp">GroceryMania.com</a>
  </div>
  <!-- Copyright -->
</footer>
<!-- Footer -->
  <!-- End of Footer -->
  
  <!-- Register Modal -->
<!-- Modal -->
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title text-center" id="exampleModalLabel">Sign Up</h1>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
     
      <div class="modal-body">
        <form action="User" method="post" class="form-group" name="regform" onsubmit="return validate(); ">
        	<label for="#name1">Enter First Name :</label>
        	<input type="text" name="fname" id="name1" class="form-control" placeholder="Enter your First Name" required/>
        	<label for="#name2">Enter Last Name: </label>
        	<input type="text" name="lname" id="name2" class="form-control" placeholder="Enter your Last Name" required />
        	<label for="#eml">Enter Email :</label>
        	<input type="email" name="e1" id="eml" class="form-control" placeholder="Enter your Email" required/>
        	<label for="#cnt">Enter Contact No :</label>
        	<input type="text" name="conc" id="cnt" class="form-control" placeholder="Enter Contact No." pattern="[789][0-9]{9}" required/>
        	<label for="#add">Enter Your Address :</label>
        	<textarea rows="4" id="add" name="addr" class="form-control" placeholder="Enter your address" required></textarea>
        	<label for="#psd1">Enter Password :</label>
        	<input type="password" name="psd" id="psd1" class="form-control" placeholder="Enter Password" required/>
        	<label for="#psd2">Confirm Password :</label>
        	<input type="password" name="psd1" id="psd2" class="form-control" placeholder="Confirm Password" required />
        	<small id="err" style="color: red; "></small>
        	<input type="hidden" name="role" value="reg" />
      </div>
      <div class="modal-footer">
        <input type="reset" class="btn btn-secondary" data-dismiss="modal" value="Reset" />
        <input type="submit" value="Sign Up" class="btn btn-success">
        </form>
      </div>
      
    </div>
    
  </div>

</div>
  <!-- End of Register Modal -->
  <!-- Login Modal  -->
  <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title text-center" id="exampleModalLabel">Login</h1>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="UserLogin" method="post" class="form-group">
        	<label for="e1">Enter Email :</label>
        	<input type="email" name="eml" id="e1" class="form-control" placeholder="Enter your Email" required/>
        	<label for="psw">Enter Password :</label>
        	<input type="password" name="psd" id="psw" class="form-control" placeholder="Enter Password" required/>
        	<input type="hidden" name="role" value="log" />
  			<a href="#">Forgot Password?</a>
      </div>
      <div class="modal-footer">
        <button type="reset" class="btn btn-danger" data-dismiss="modal">Reset</button>
        <input type="submit" class="btn btn-success" value="Login">
      </div>
      </form>
    </div>
  </div>
</div>
  <!-- End of Login Modal -->

</body>
</html>
    