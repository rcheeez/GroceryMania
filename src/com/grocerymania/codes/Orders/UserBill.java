package com.grocerymania.codes.Orders;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

/**
 * Servlet implementation class UserBill
 */
@WebServlet("/UserBill")
public class UserBill extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserBill() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		  String url = "jdbc:mysql://localhost:3306/grocerymania";
		  String user = "root";
		  String password = "pass123";
		  String sql = "select orders.orderid, orders.orderdate, user.fname, user.lname, user.phoneno, cart.pname, cart.product_qty, cart.price "
		  +"from orders inner join user on user.uid = orders.uid "
				  +"inner join cart on cart.uid = orders.uid "+
				  " where user.uid = ? ;";
		 // int a = 0;
		  try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, user, password);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uid);
			boolean r = false;
			r = ps.execute();
			if (r) {
				Document doc = new Document();
				PdfWriter.getInstance(doc, new FileOutputStream("C:\\Users\\Aniket\\Downloads\\Bills\\bill.pdf"));
				doc.open();
				 Paragraph para = new Paragraph("Grocery Mania");
				 para.setAlignment(Paragraph.ALIGN_CENTER);
				 Paragraph para1 = new Paragraph("You Order, We Deliver");
				 para1.setAlignment(Paragraph.ALIGN_CENTER);
				 Paragraph para2 = new Paragraph(" ");
				 Paragraph p1 = new Paragraph("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
				 p1.setAlignment(Paragraph.ALIGN_CENTER);
				 Paragraph p2 = new Paragraph("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
				 p2.setAlignment(Paragraph.ALIGN_CENTER);
				doc.add(p1);
				doc.add(para);
				doc.add(para1);
				doc.add(p2);
				doc.add(para2);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					int total = 0;
					int oid = rs.getInt("orderid");
					Date d = rs.getDate("orderdate");
					String fname  = rs.getString("fname");
					String lname = rs.getString("lname");
					String phone = rs.getString("phoneno");
					 Paragraph para3 = new Paragraph("OrderId: "+ oid);
					 para3.setAlignment(Paragraph.ALIGN_RIGHT);
					 Paragraph para4 = new Paragraph("Date: " + d.toString());
					 para4.setAlignment(Paragraph.ALIGN_LEFT);
					doc.add(para3);
					doc.add(para4);
					doc.add(new Paragraph("Customer Name: " + fname +" "+ lname));
					doc.add(new Paragraph("Customer Contact No. "+ phone));
					doc.add(new Paragraph(" "));
					
					PdfPTable table = new PdfPTable(3);
					table.setWidthPercentage(100);
					table.setSpacingBefore(10f);
					table.setSpacingAfter(10f);
					
					float[] columnwidths = {1f, 1f, 1f};
					table.setWidths(columnwidths);
					
					PdfPCell cell1 = new PdfPCell(new Paragraph("Product Name"));
					 cell1.setBorderColor(BaseColor.BLACK);
				     cell1.setPaddingLeft(10);
				     cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
				     cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
				     
				    PdfPCell cell2 = new PdfPCell(new Paragraph("Product Quantity"));
				    cell2.setBorderColor(BaseColor.BLACK);
				    cell2.setPadding(10);
				    cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
				    cell2.setVerticalAlignment(Element.ALIGN_MIDDLE);
				    
				    PdfPCell cell3 = new PdfPCell(new Paragraph("Price"));
				    cell3.setBorderColor(BaseColor.BLACK);
			        cell3.setPaddingLeft(10);
			        cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
			 
			        table.addCell(cell1);
			        table.addCell(cell2);
			        table.addCell(cell3);
			        
			        	String pname = rs.getString("pname");
			        	String qty =Integer.toString(rs.getInt("product_qty"));
						String price = Integer.toString(rs.getInt("price"));
						
						PdfPCell cell4 = new PdfPCell(new Paragraph(pname));
						 cell4.setBorderColor(BaseColor.BLACK);
					     cell4.setPaddingLeft(10);
					     cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
					     cell4.setVerticalAlignment(Element.ALIGN_MIDDLE);
					     
					    PdfPCell cell5 = new PdfPCell(new Paragraph(qty));
					    cell5.setBorderColor(BaseColor.BLACK);
					    cell5.setPaddingLeft(10);
					    cell5.setHorizontalAlignment(Element.ALIGN_CENTER);
					    cell5.setVerticalAlignment(Element.ALIGN_MIDDLE);
					    
					    PdfPCell cell6 = new PdfPCell(new Paragraph(price));
					    cell6.setBorderColor(BaseColor.BLACK);
				        cell6.setPaddingLeft(10);
				        cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
				        cell6.setVerticalAlignment(Element.ALIGN_MIDDLE);
				        
						table.addCell(cell4);
						table.addCell(cell5);
						table.addCell(cell6);
						
						total = total + Integer.parseInt(price);
					
			        
			        doc.add(table);
			        doc.add(new Paragraph("Total Price: "+ total));
			        doc.add(new Paragraph(" "));
			        Paragraph p3 = new Paragraph("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
			        p3.setAlignment(Paragraph.ALIGN_CENTER);
			        Paragraph p4 = new Paragraph("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
			        p4.setAlignment(Paragraph.ALIGN_CENTER);
			        doc.add(p3);
			        Paragraph para5 = new Paragraph("Thank you , visit again....");
			        para5.setAlignment(Paragraph.ALIGN_CENTER);
			        doc.add(para5);
			        doc.add(p4);
			  
					doc.close();
					response.sendRedirect("OrderConfirm.jsp");
				
				}
			} else {
				response.sendRedirect("index.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
