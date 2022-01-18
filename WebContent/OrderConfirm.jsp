<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GROCERY MANIA - Order Confirmed</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #f1f1f1;">
	<!-- Header -->
	<nav class="navbar navbar-success">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp">GroceryMania</a>
    </div>
  </div>
</nav>
	
<!--  End of Header -->
<h1 align="center">We have recieved your order!</h1>
<h2 align="center">We'll Notify you once we are ready to deliver your product.</h2>
<h2 align="center">Thank You for Ordering!</h2>	
<h2 align="center"><a href="Welcome.jsp">Go to Homepage</a></h2>
<br>
<%
	HttpSession sess = request.getSession(false);
		int uid = 0;
	if(sess != null){
		uid = (int)sess.getAttribute("userid");
	}
	
	
%>

<div class="container" style="width: 50%; background-color: #fff; ">
	<p align="center" style="font-family: monospace; ">~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
	<h3 align="center" style="font-family: monospace; ">GroceryMania</h3>
	<h4 align="center" style="font-family: monospace; ">You Order, We Deliver</h4>
	<p align="center" style="font-family: monospace; ">~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
	<br><br>
	<%
	String url = "jdbc:mysql://localhost:3306/grocerymania";
	String user = "root";
	String password = "pass123";
	String sql = "select orders.orderid, orders.orderdate, user.fname, user.lname, user.phoneno, cart.pname, cart.product_qty, cart.price "
			  +"from orders inner join user on user.uid = orders.uid "
			  +"inner join cart on cart.uid = orders.uid "+
			  " where user.uid = ? ;";
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url, user, password);
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setInt(1, uid);
	ps.execute();
	int total = 0;
	ResultSet rs = ps.executeQuery();
	
	while(rs.next()){
		int oid = rs.getInt("orderid");
		Date d = rs.getDate("orderdate");
		String fname  = rs.getString("fname");
		String lname = rs.getString("lname");
		String phone = rs.getString("phoneno");
		String pname = rs.getString("pname");
		int qty = rs.getInt("product_qty");
		int price = rs.getInt("price");
	%>
	<p align="right" style="font-family: monospace; ">Order Id: <%= oid %></p>
	<p align="left" style="font-family: monospace; ">Date: <%= d.toString() %></p>
	<p align="left" style="font-family: monospace; ">Customer Name: <%= fname + " "+ lname %></p>
	<p align="left" style="font-family: monospace; ">Customer Contact No. <%= phone %></p>
	<br>
	<table class="table">
		<tr>
			<th>Product Name</th>
			<th>Product Quantity</th>
			<th>Price</th>
		</tr>
		
		<tr>
			<td><%= pname %></td>
			<td><%= qty %></td>
			<td><%= price %></td>
		</tr>
		
		
	</table>
	<%
	total += price;
	}
	%>
	
	<p align="right" style="font-family: monospace; ">Total Price: <%= total %></p>
	<p align="center" style="font-family: monospace; ">~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
	<p align="center" style="font-family: monospace; ">Thank you, visit again..</p>
	<p align="center" style="font-family: monospace; ">~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
</div>
<div class="container" align="center">
<form action="UserBill" method="post">
<input type="hidden" name="uid" value="<%= uid%>"/>
<input type="submit" value="Get Bill" class="btn btn-primary"/>
</form>
</div>

<p align="center" style="color: red;">Once you click on the "Get Bill" button. Your bill will be generated and to collect the bill just go into your downloads folder to collect the bill.</p>
</body>
</html>