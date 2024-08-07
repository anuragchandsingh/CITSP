package com.citsp.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.citsp.connection.DBConnection;

/**
 * Servlet implementation class AdminLogin
 */

public class OfficerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String caseid= request.getParameter("caseid");
		String officerid= request.getParameter("officerid");
		
		int caseid1= Integer.parseInt(caseid);
		int officerid1= Integer.parseInt(officerid);
		String pass = request.getParameter("pass");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		Connection con= null;
		try {
		     con=DBConnection.createConnection();
			PreparedStatement pstmt = con.prepareStatement("select * from login where caseid=? and officerid=? and pass=?");
			pstmt.setInt(1,caseid1);
			pstmt.setInt(2, officerid1);
			pstmt.setString(3, pass);
			ResultSet rs= pstmt.executeQuery();
			PreparedStatement pstmt2 = con.prepareStatement("select casename from ncase where caseid=?");
			pstmt2.setInt(1, caseid1);
			 rs = pstmt2.executeQuery();
			if(rs.next())
			{
				session.setAttribute("caseid", caseid);
				session.setAttribute("officerid", officerid);
				session.setAttribute("casename", rs.getString("casename"));
				dispatcher= request.getRequestDispatcher("Officerindex.jsp");
			}
			else
			{
				request.setAttribute("status", "failed");
				dispatcher= request.getRequestDispatcher("Officerlogin.jsp");
			}
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (con != null) con.close();
				}catch(Exception e)
				{
					e.printStackTrace();
				}
		}
		}

}
