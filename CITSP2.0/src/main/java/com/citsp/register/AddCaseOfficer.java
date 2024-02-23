package com.citsp.register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.citsp.connection.DBConnection;
import com.citsp.mail.Mail;

/**
 * Servlet implementation class AddCaseOfficer
 */
@WebServlet("/addcaseofficer")
public class AddCaseOfficer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();

		String cid = request.getParameter("caseid");
		int i2 = cid.indexOf(',');
		String word2 = cid.substring(0, i2);
		int caseid = Integer.parseInt(word2);

		String oid = request.getParameter("officerid");
		int i = oid.indexOf(',');
		String word = oid.substring(0, i);
		int officerid = Integer.parseInt(word);

		RequestDispatcher dispatcher = null;
		Connection con = null;
		
		try {
			con = DBConnection.createConnection();

			PreparedStatement pstmt = con.prepareStatement("select count(*) from login where caseid=? and officerid=?");
			pstmt.setInt(1, caseid);
			pstmt.setInt(2, officerid);
			
			 try (ResultSet resultSet = pstmt.executeQuery()) {
	                if (resultSet.next()) {
	                    int rowCount = resultSet.getInt(1);
	                    if (rowCount > 0) {                    
	                        dispatcher = request.getRequestDispatcher("Addcaseofficer.jsp");
	                        request.setAttribute("status", "failed");
	                    }
	                    else {
	                    	ResultSet rs= null;
	                    	PreparedStatement pstmt1 = con.prepareStatement("select pass from login where caseid=?");
	                    	pstmt1.setInt(1, caseid);
	                    	 rs = pstmt1.executeQuery();
	                    	String pass = null;
	                    	while(rs.next())
	                    	{
	                    		pass=rs.getString("pass");
	                    	}
	                    	
	                    	PreparedStatement pstmt2 = con.prepareStatement("select name , mail from officer where id=?");
	            			pstmt2.setInt(1, officerid);
	            			 rs = pstmt2.executeQuery();

	            			String name = null;
	            			String mail = null;      
	            			while (rs.next()) {
	            				name = rs.getString("name");
	            				mail = rs.getString("mail");           	
	            			}
	            			
	            		   PreparedStatement pstmt3 = con
	            					.prepareStatement("insert into login(caseid, officerid, pass) values(?,?,?)");

	            			pstmt3.setInt(1, caseid);
	            			pstmt3.setInt(2, officerid);
	            			pstmt3.setString(3, pass);
	            			
	            		    int row =pstmt3.executeUpdate();
	            		    dispatcher = request.getRequestDispatcher("Addcaseofficer.jsp");                  
	                        if (row != 0) {

	            				Mail.sendMail(name, mail, caseid, officerid, pass);
	            				request.setAttribute("status", "success");

	            			} else {
	            				request.setAttribute("status", "failed2");

	            			}
	                        pstmt1.close();
	                        pstmt2.close();
	                        pstmt3.close();
	                    }
	                }
	                pstmt.close();
	            }
			
			dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		} 
		

	}
}
