<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.grocerymania.codes.Cart.CartServlet"%>
<%@page import="com.grocerymania.codes.Cart.Cart"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page session="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GROCERY MANIA - SHOP</title>
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
    <%
    HttpSession session = request.getSession(false);
    if(session == null){
  		response.sendRedirect("index.jsp");
  	}
  	String eml = "";
  	String msg = "";
  	String role = "";
    	eml = (String)session.getAttribute("emailid");
    	msg = (String)session.getAttribute("msgs");
    	role = (String)session.getAttribute("role");
    
  		%>
      <li><a href="index.jsp">Home</a></li>
      <li class="active"><a href="shop.jsp">Shop</a></li>
      <li><a href="About.jsp">About</a></li>
      <li><a href="contact.jsp">Contact</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a data-toggle="modal" data-target="#CartModal"><span class="glyphicon glyphicon-shopping-cart"></span>MyCart</a></li>
    </ul>
  </div>
</nav>

<%
	if(role.equals("cart")){
		
	
%>
<script type="text/javascript">
	alert("Product Added to Cart Sucessfully!");
</script>
<%
	}

if(role.equals("deletecart")){
%>
<script type="text/javascript">
	alert("Product Deleted from Cart!");
</script>
<%
}
%>
  <!-- End of Navbar & Header -->
  <!-- Categories List Groups -->

  <!-- End  of Categories List Groups -->
  
  <!-- Products List -->
  <%
  String url = "jdbc:mysql://localhost:3306/grocerymania";
	String user = "root";
	String password = "pass123";
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url, user, password);
  %>
  <%
  	
  	String q = "select uid from user where emailid = ? ";
		PreparedStatement prepare = conn.prepareStatement(q);
		prepare.setString(1, eml);
		ResultSet set = prepare.executeQuery();
		int uid =0;
		while(set.next()){
			 uid = set.getInt("uid");
		}
		
		
		
  %>

 <div class="container-fluid" style="margin-left: auto; margin-right: auto;">
<div class="row" style="padding-left: 50px;">
		 	<%
			String query = "select * from products;";

			Statement st = conn.createStatement();
			ResultSet rst = st.executeQuery(query);
			
			while(rst.next()){
				String pname = rst.getString("pname");
				int price = rst.getInt("price");
				String pdescription = rst.getString("pdesc");
				String image = rst.getString("pimage");
		%>
		  <div class="card col-6 col-sm-4" style="width:30rem; padding-right: 12px;">
		  <br>
		  <img class="card-img-top" src="./Images/<%= image %>"  width="100%" height="50%" style="border-left: 1px solid black; border-right: 1px solid black; border-top: 1px solid black;  " alt="Card image cap">
		  <div class="card-body" style="text-align: center; border: 1px solid black; padding: 6px 6px;  background-color: #ddd;">
		    <h5 class="card-title" style="font-weight: bolder;"><%= pname%></h5>
		    <p class="card-text"><%= pdescription %></p>
		    <p class="card-price">Rs. <%= price %>/Kg</p>
		    <form action="CartServlet" method="post">
		    <input type="hidden" name="uid" value="<%= uid%>">
		    <input type="hidden" name="pname" value="<%=pname %>" />
		    <input type="hidden" name="price" value="<%= price %>" />
		    <input type="hidden" name="pimage" value="<%= image %>" />
		    <input type="number" name="pqty" value="1" class="form-control" min="1" /><br>
		    <input type="hidden" name="role" value="cart"/>
		    <input type="submit" class="btn btn-primary" value= "Add to Cart" style="width: 100%;" />
		    </form>
		  </div>
		</div>

		<%
			}
		%>	
	</div>
 	</div>

	   <!-- End of Products List -->
  <!-- Cart Modal -->
    <div class="modal" tabindex="-1" role="dialog" id="CartModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title">Cart</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="overflow-x : auto; ">
      <%
      int totalprice = 0;
      		if(uid == 0){
      	%>		
      	<h1>YOU NEED TO LOGIN FIRST</h1>
      	<%
      		}else{
      	%>	
      
      	<table class="table table-bordered">
      		<tr>
      			<th scope="row">Product Name</th>
      			<th scope="row">Product Image</th>
      			<th scope="row">Product Quantity</th>
      			<th scope="row">Product Price</th>
      			<th scope="row">Delete</th>
      		</tr>
      		<%
      			String r = "select uid,pname,pimage,sum(product_qty), sum(price) as price from cart where uid = ? group by pname;";
      			PreparedStatement ps1 = conn.prepareStatement(r);
      			ps1.setInt(1, uid);
      			ResultSet rs1 = ps1.executeQuery();
      			
      			while(rs1.next()){
      				String cartname = rs1.getString("pname");
      				String cartimg = rs1.getString("pimage");
      				int quantity = rs1.getInt("sum(product_qty)");
      				int price = rs1.getInt("price");
			%>
			<tr>
				<td><%=cartname %></td>
				<td><img src="./Images/<%= cartimg %>" height="50px;"></td>
				<td><%= quantity %> Kg</td>
				<td>Rs. <%= price %></td>
				<form action="DeleteCart" method="post">
					<input type="hidden" name="pname" value="<%= cartname%>" />
					<td><input type="submit" value="Delete" class="btn btn-danger" /></td>
				</form>
			</tr>
		<%
		totalprice = totalprice + price;
		}
		%>
      	</table>
      	<h4 style="font-weight: bolder;">TotalPrice: <%= totalprice %></h4>
      </div>
      <%
      		}
      %>
      <div class="modal-footer">
      	<form action="checkout.jsp" method="post">
      		<input type="hidden" name="uid" value="<%= uid%>" />
      		<input type="hidden" name= "total" value="<%= totalprice%>"/>
      		<input type="submit" value="Checkout" class="btn btn-success"/>
      	</form>
      </div>
    </div>
  </div>
</div> 
  <!-- End of Cart Modal -->
</body>
</html>