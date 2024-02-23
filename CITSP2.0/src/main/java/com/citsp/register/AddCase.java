package com.citsp.register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.citsp.connection.DBConnection;
import com.citsp.mail.Mail;
import com.citsp.pass.Generate;

/**
 * Servlet implementation class AddCase
 */
public class AddCase extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String officerid = request.getParameter("oid");
		int i = officerid.indexOf(',');
		String word = officerid.substring(0, i);
		
		int oid = Integer.parseInt(word);
		String casename = request.getParameter("casename");
		String note = request.getParameter("note");
		

		String pass =  Generate.password();
		
		RequestDispatcher dispatcher = null;
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt= null;
		PreparedStatement pstmt1= null;
		PreparedStatement pstmt2= null;
		PreparedStatement pstmt3= null;
		try {
			con = DBConnection.createConnection();
			 pstmt = con
					.prepareStatement("insert into ncase(officerid, casename, note) values(?,?,?)");

			pstmt.setInt(1, oid);
			pstmt.setString(2, casename);
			pstmt.setString(3, note);
			int row = pstmt.executeUpdate();

			pstmt1 = con
					.prepareStatement("select caseid from ncase where officerid=? and casename=? and note=?");
			pstmt1.setInt(1, oid);
			pstmt1.setString(2, casename);
			pstmt1.setString(3, note);
			rs = pstmt1.executeQuery();

			int caseid = 0, count1 = 0;
			while (rs.next()) {
				caseid = rs.getInt("caseid");
				count1++;
			}

			pstmt2 = con.prepareStatement("select name , mail from officer where id=?");
			pstmt2.setInt(1, oid);
			rs = pstmt2.executeQuery();

			String name = null;
			String mail = null;
			int count2 = 0;
			while (rs.next()) {
				name = rs.getString("name");
				mail = rs.getString("mail");
				count2++;
			}
			
		    pstmt3 = con
					.prepareStatement("insert into login(caseid, officerid, pass) values(?,?,?)");

			pstmt3.setInt(1, caseid);
			pstmt3.setInt(2, oid);
			pstmt3.setString(3, pass);
		    int row2 =pstmt3.executeUpdate();

			dispatcher = request.getRequestDispatcher("Addcase.jsp");
			if ((row & row2 & count1 & count2) != 0) {

				Mail.sendMail(name, mail, caseid, oid, pass);
				request.setAttribute("status", "success");

			} else {
				request.setAttribute("status", "failed");

			}
			dispatcher.forward(request, response);
			
			pstmt.close();
			pstmt1.close();
			pstmt2.close();
			pstmt3.close();

		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

	}
}
