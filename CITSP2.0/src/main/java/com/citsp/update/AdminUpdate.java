package com.citsp.update;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.citsp.connection.DBConnection;


@WebServlet("/AdminUpdate")
public class AdminUpdate extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String image= request.getParameter("image");
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String address=request.getParameter("address");
		
		Connection con=null;
		PreparedStatement pstmt=null;
		RequestDispatcher rd=null;
		
		try {
		con = DBConnection.createConnection();
		pstmt= con.prepareStatement("update admin set name=?, email=?, mobile=?, address=? where id=?");
		pstmt.setString(1,name);
		pstmt.setString(2,email);
		pstmt.setString(3,mobile);
		//pstmt.setString(4,image);
		pstmt.setString(4,address);
		pstmt.setString(5,id);
		
		int row = pstmt.executeUpdate();
		
		if(row!=0)
		{
			rd= request.getRequestDispatcher("Adminindex.jsp");
			request.setAttribute("status","success");
		}
		else
		{
			rd=request.getRequestDispatcher("EditAdminProfile.jsp");
			request.setAttribute("status","failed");
		}
		rd.forward(request, response);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
