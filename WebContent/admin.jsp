<%@page import="com.grocerymania.codes.Orders.Orders"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
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
<title>GROCERY MANIA - ADMIN PANEL</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-success">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">GroceryMania</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="LogoutAdmin"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>  
    </ul>
  </div>
</nav>
<%
	HttpSession sess = request.getSession(false);
	
	if(!(sess != null)){
		response.sendRedirect("AdminLogin.jsp");
	}
%>
  <div class="row">
  <div class="col-6 col-sm-3"><a href="#" data-toggle="modal" data-target="#UserModal">VIEW USERS</a></div>
  <div class="col-6 col-sm-3"><a href="#" data-toggle="modal" data-target="#ProductsModal">VIEW PRODUCTS</a></div>

  <!-- Force next columns to break to new line -->
  <div class="w-100"></div>

  <div class="col-6 col-sm-3"><a href="#" data-toggle="modal" data-target="#CategoryModal">VIEW CATEGORIES</a></div>
  <div class="col-6 col-sm-3"><a href="#" data-toggle="modal" data-target="#LogsModal">GET LOGS DETAILS</a></div>
</div>
<br><br>
<div class="row">
  <div class="col-6 col-sm-3"><a href="#" data-toggle="modal" data-target="#AddProductModal">ADD PRODUCTS</a></div>

  <!-- Force next columns to break to new line -->
  <div class="w-100"></div>

  <div class="col-6 col-sm-3"><a href="#" data-toggle="modal" data-target="#AddCategoryModal">ADD CATEGORIES</a></div>
  <div class="col-6 col-sm-3"><a href="#" data-toggle="modal" data-target="#OrderModal">MANAGE ORDERS</a></div>
  <div class="col-6 col-sm-3"><a href="#" data-toggle="modal" data-target="#FeedbackModal">FEEDBACK AND RESPONSES</a></div>
</div>

<!-- User Modal -->

<!-- Modal -->
<div class="modal fade bd-example-modal-lg" id="UserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">GroceryMania - Users Section</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="overflow-x: auto; ">
      <table class="table table-bordered">
      	<tr>
      		<th scope="row">User id</th>
      		<th scope="row">Name</th>
      		<th scope="row">Email Id</th>
      		<th scope="row">Contact</th>
      		<th scope="row">Address</th>
      		<th scope="row">Password</th>
      	</tr>
       <%
       String query = "SELECT * FROM user;";
		String url = "jdbc:mysql://localhost:3306/grocerymania";
		String user = "root";
		String password = "pass123";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection conn = DriverManager.getConnection(url, user, password);
		Statement s = conn.createStatement();
		ResultSet rs = s.executeQuery(query);
		int usercount =0;
		while(rs.next()){
			int id = rs.getInt("uid");
			String name1 = rs.getString("fname");
			String name2 = rs.getString("lname");
			String emailid = rs.getString("emailid");
			String address = rs.getString("address");
			String contact = rs.getString("phoneno");
			String pass1 = rs.getString("pass");
		
       %>
       <tr>
       <td scope="row"><%= id %></td>
       	<td scope="col"><%= name1 +" "+ name2 %></td>
       	<td scope="col"><%= emailid %></td>
       	<td scope="col"><%= contact %></td>
       	<td scope="col"><%= address %></td>
       	<td scope="col"><%= pass1 %></td>
       </tr>
       <%
       usercount ++;
		}
       %>
      </table>
      </div>
    </div>
  </div>
</div>
<!-- End of User Modal -->

<!-- Product Modal  -->
<div class="modal fade" id="AddProductModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">Add Products</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<h4>ADD PRODUCTS</h4>
        <form class="form-group" action="AddProduct" method="post" enctype="multipart/form-data">
        	<input type="text" name="pname" class="form-control" placeholder="Enter Product Name" required /><br>
        	<textarea class="form-control" placeholder="Enter Product Description" name="pdesc" id="exampleFormControlTextarea1" rows="4"></textarea><br>
        	<input type="number" class="form-control" name="price" placeholder="Enter Product Price" required/><br>
        	<select class="form-control" name="cat">
        		<option selected>Select your Category</option>
        		<%
        			String sql1 = "select * from category;";
        			Statement s1 = conn.createStatement();
        			ResultSet res = s1.executeQuery(sql1);
        			while(res.next()){
        				String category = res.getString("catname");
        				int catid = res.getInt("catid");
        		%>
        		<option value="<%= catid%>"><%= category %></option>
        		<%
        			
        			}
        		%>
        	</select><br>
        <input type="file" name="pimage" class="form-control" value="Upload" required/>
        

      </div>
      <div class="modal-footer">
        <input type="submit" class="btn btn-primary" value="Add Product"/>
      </div>
      </form>
    </div>
  </div>
</div>
<!-- End of Product Modal  -->

<!-- Category Modal -->
<div class="modal fade" id="CategoryModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">GroceryMania - Categories Section</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <h3>Categories</h3>
        <table class="table">
        	<tr>
        		<th>category_id</th>
        		<th>category_name</th>
        		<th>category_desc</th>
        	</tr>
        	<%
        		String sql = "select * from category;";
        		Statement stmt = conn.createStatement();
        		ResultSet rs1 = stmt.executeQuery(sql);
        		int catcount =0;
        		while(rs1.next()){
        			int catid = rs1.getInt("catid");
        			String catname = rs1.getString("catname");
        			String catdesc = rs1.getString("catdesc");
        	%>
        	<tr>
        		<td><%= catid %></td>
        		<td><%= catname %></td>
        		<td><%= catdesc %></td>
        	</tr>
        	<%
        		catcount++;
        		}
        	%>
        </table>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Back</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="AddCategoryModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">Add Categories</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            <form action="AddCat" method="post" class="form-group">
            <input type="text" name="cname" class="form-control" placeholder="Enter Name of Category" required/><br>
            <textarea rows="4" class="form-control" name="cdesc" placeholder="Enter Category Description" required></textarea> 
             
      </div>
      <div class="modal-footer">
        <input type="submit" class="btn btn-primary" value="Add Category">
      </div>
      </form>
    </div>
  </div>
</div>
<!-- End of Category Modal  -->

<!-- Logs Modal -->

<div class="modal fade" id="LogsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">GroceryMania - Log Details Section</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table" style="overflow-x: auto; ">
        	<tr>
        		<td>Logged in by user</td>
        		<td>Date and Time</td>
            </tr>
            <%
        	String q1 = "select * from Logs;";
        	Statement s3 = conn.createStatement();
        	ResultSet r = s3.executeQuery(q1);
        	while(r.next()){
        		String username = r.getString("username");
        		String datetime = r.getString("dateandtime");
        	
        %>
        	<tr>
        		<td><%= username %></td>
        		<td><%= datetime %></td>
        	</tr>
        <%
        	}
        %>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Back</button>
      </div>
    </div>
  </div>
</div>
<!-- End of Logs Modal  -->
<!-- Products Modal -->
<div class="modal fade" id="ProductsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">GroceryMania - Products Section</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="overflow-x: auto;">
	<table class="table table-bordered">
      		<tr>
      			<th>Product Id</th>
      			<th>Product Name</th>
      			<th>Product Image</th>
      			<th>Product Price</th>
      			<th>Category Id</th>
      			<th>Product Description</th>
      			<th>Update</th>
      			<th>Delete</th>
      		</tr>
      		<%
      		String pname =request.getParameter("pname");
      		String query1 = "SELECT * FROM products;";
    		
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		//Connection conn = DriverManager.getConnection(url, user, password);
      		Statement st = conn.createStatement();
      		ResultSet rst = st.executeQuery(query1);
      		int productcount =0;
      		while(rst.next()){
      			int pid = rst.getInt("pid");
      			String pname1 = rst.getString("pname");
      			String pimage = rst.getString("pimage");
      			//InputStream in = rst.getBinaryStream("pimage");
      			int price = rst.getInt("price");
      			int catid = rst.getInt("catid");
      			String pdescription = rst.getString("pdesc");
      			
      		%>
      		<tr>
      			<td><%= pid%></td>
      			<td><%= pname1%></td>
      			<td><%= pimage %></td>
      			<td><%= price%></td>
      			<td><%= catid%></td>
      			<td><%= pdescription%></td>
      			<td><a href="#" class="btn btn-success">Update</a></td>
      			<form action="DeleteProduct" method="post">
      			<input type="hidden" name="id" value="<%= pid%>" />
      			<input type="hidden" name="img" value="<%= pimage%>"/>
      			<td><input type="submit" value="Delete" class="btn btn-danger"/></td>
      			</form>
      		</tr>
      		<%
      		productcount++;
      		}
      		%>
      		
      	</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Back</button>

      </div>
    </div>
  </div>
 </div>
<!-- End of Products Modal -->
<!-- Orders Modal  -->
<div class="modal fade" id="OrderModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">GroceryMania - Orders Section</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="overflow-x: auto; ">
      <table class="table">
      <tr>
      	<th scope="row">OrderId</th>
      	<th scope="row">Customer Name</th>
      	<th scope="row">Customer Address</th>
		<th scope="row">Customer Phone No.</th>
		<th scope="row">OrderDate</th>
		<th scope="row">Payment Mode</th>
		<th scope="row">Status</th>
		<th scope="row">View Orders</th>
      </tr>
		<%
		Orders o = new Orders();
		
			String qr = "select orders.orderid,user.uid, user.fname, user.lname, user.address, user.phoneno, orders.orderdate, orders.payment_mode, orders.status from orders"
					+ " inner join user on orders.uid = user.uid";
			Statement state = conn.createStatement();
			ResultSet result = state.executeQuery(qr);
			int uid1 = 0;
			while(result.next()){
					uid1 = result.getInt("uid");
				 o.setOrderid(result.getInt("orderid"));
			     o.setCustomer_name(result.getString("fname"));
			    o.setCustomer_lname(result.getString("lname"));
				o.setCustomer_address(result.getString("address"));
				o.setCustomer_phoneno(result.getString("phoneno"));
				o.setOrderdate(result.getDate("orderdate"));
				o.setPaymentmode(result.getString("payment_mode"));
				String sts = result.getString("status");
			
		%>
		<tr>
			<td><%= o.getOrderid() %></td>
			<td><%= o.getCustomer_name() +" "+ o.getCustomer_lname() %></td>
			<td><%= o.getCustomer_address() %></td>
			<td><%= o.getCustomer_phoneno() %></td>
			<td><%=  o.getOrderdate().toString()%></td>
			<td><%= o.getPaymentmode() %></td>
			<td><%= sts %></td>
			<td><a href="#" data-toggle="modal" data-target="#ViewOrderModal" class="btn btn-primary" >View Products</a></td>
		</tr>
		<%
			}
		%>
		</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Back</button>
      </div>
    </div>
  </div>
</div>
<!-- End of Orders Modal -->
<!--ViewOrders  -->
<div class="modal fade" id="ViewOrderModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">GroceryMania - Orders Section</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="overflow-x: auto; ">
      	<table class="table">
      		<tr>
      			<td>Product Name</td>
      			<td>Product Image</td>
      			<td>Product Quantity</td>
      			<td>Product Price</td>
      		</tr>	
      		<%
      		String p = "select uid from user where lname = ? ";
			PreparedStatement s4 = conn.prepareStatement(p);
			s4.setString(1, o.getCustomer_lname());
			ResultSet r2 = s4.executeQuery();
			int userid = 0;
			while(r2.next()){
				userid = r2.getInt("uid");
			}
      			Class.forName("com.mysql.cj.jdbc.Driver");
      			String q = "select cart.pname, cart.pimage, cart.product_qty, cart.price from orders"
    					+ " inner join cart on cart.uid = orders.uid"
    					+" where cart.uid = ? ";
      			
      			PreparedStatement s2 = conn.prepareStatement(q);
      			s2.setInt(1, userid);
      			ResultSet r1 = s2.executeQuery();

      			while(r1.next()){
      					
      			String name = r1.getString("pname");
      			String img = r1.getString("pimage");
      			int qty = r1.getInt("product_qty");
      			int price = r1.getInt("price");
      			
      			
      		%>
      		<tr>
      			<td><%= name %></td>
      			<td><img src="./Images/<%= img%>" height="50px;"></td>
      			<td><%= qty %></td>
      			<td><%= price %></td>
      			<td><%=userid %></td>
      		</tr>
      		
      		<%
      			}
      		%>
      	</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Back</button>
      </div>
    </div>
  </div>
</div>
<!-- End of View Orders -->
<!-- Response and Feedback  -->
<div class="modal fade" id="FeedbackModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">GroceryMania - Log Details Section</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="overflow-x: auto; ">
        <table class="table">
        	<tr>
        		<td>Emailid</td>
        		<td>Feedback and Responses</td>
        	</tr>
        	<tr>
        		<%
        			String sql2 = "select * from feedback;";
        			Class.forName("com.mysql.cj.jdbc.Driver");
        			Statement s5 = conn.createStatement();
        			ResultSet r4 = s5.executeQuery(sql2);
        			while(r4.next()){
        				String email = r4.getString(1);
        				String feedback = r4.getString(2);
        			
        		%>
        			<td><%= email %></td>
        			<td><%= feedback %></td>
        		<%
        			}
        		%>
        	</tr>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Back</button>
      </div>
    </div>
  </div>
</div>
<!-- End of Response and Feedback  -->
</body>
</html>