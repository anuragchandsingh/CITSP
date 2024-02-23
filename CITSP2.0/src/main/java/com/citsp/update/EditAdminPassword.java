package com.citsp.update;

import java.io.IOException;
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

@WebServlet("/EditAdminPassword")
public class EditAdminPassword extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id=request.getParameter("id");
		String oldpassword=request.getParameter("oldpassword");
		String newpassword=request.getParameter("newpassword");
		String confirmnewpassword=request.getParameter("confirmnewpassword");
		String password=null;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		RequestDispatcher rd=null;
		ResultSet rs=null;
		
		try {
		con = DBConnection.createConnection();
		pstmt= con.prepareStatement("select password from admin where id=?");
		pstmt.setString(1, id);
		rs= pstmt.executeQuery();
		if(rs.next())
		{
			password = rs.getString("password");
		}
		
		if(password.equals(oldpassword))
		{
			if(newpassword.equals(confirmnewpassword))
			{
				pstmt2=con.prepareStatement("update admin set password=? where id=?");
				pstmt2.setString(1,newpassword);
				pstmt2.setString(2,id);
				
				int row = pstmt2.executeUpdate();
				
				if(row!=0)
				{
					rd= request.getRequestDispatcher("Adminindex.jsp");
					request.setAttribute("status","success1");
				}
				else
				{
					rd=request.getRequestDispatcher("EditAdminPass.jsp");
					request.setAttribute("status","failed");
				}
			}
			else
			{
				rd=request.getRequestDispatcher("EditAdminPass.jsp");
				request.setAttribute("status","failed1");
			}
			
		}
		else
		{
			rd=request.getRequestDispatcher("EditAdminPass.jsp");
			request.setAttribute("status","failed2");
		}
		
		rd.forward(request, response);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
