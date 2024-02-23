package com.citsp.register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.citsp.connection.DBConnection;

@WebServlet("/addresult")
public class Addresult extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	
		String suspect = request.getParameter("suspect");
		String result = request.getParameter("result");
		

		RequestDispatcher dispatcher = null;
		Connection con = null;	
		
		HttpSession session = request.getSession();
		int caseid = (int)session.getAttribute("resultcaseid");
		String casename=(String)session.getAttribute("resultcasename");
		try {
			con = DBConnection.createConnection();
					
			PreparedStatement pstmt = con.prepareStatement("select count(*) from result where caseid=?");
			pstmt.setInt(1, caseid);

			try (ResultSet resultSet = pstmt.executeQuery()) 
			{
				if (resultSet.next()) 
				{	
					int rowCount = resultSet.getInt(1);
					if (rowCount == 0) 
					{
						PreparedStatement pstmt1 = con
								.prepareStatement("insert into result(caseid,casename,suspect, result) values(?,?,?,?)");

						pstmt1.setInt(1, caseid);
						pstmt1.setString(2, casename);
						pstmt1.setString(3, suspect);
						pstmt1.setString(4, result);
						int row = pstmt1.executeUpdate();
						
						dispatcher = request.getRequestDispatcher("Addresult.jsp");
						if (row != 0) 
						{
							request.setAttribute("status", "success");
						} 
					}
					else
					{
						dispatcher = request.getRequestDispatcher("Addresult.jsp");
						request.setAttribute("status", "failed");
					}
				}
			}
			dispatcher.forward(request, response);	
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
