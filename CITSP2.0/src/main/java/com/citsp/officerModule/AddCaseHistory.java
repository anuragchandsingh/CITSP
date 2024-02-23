package com.citsp.officerModule;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.citsp.connection.DBConnection;

@WebServlet("/addcasehistory")
public class AddCaseHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter format1 = DateTimeFormatter.ofPattern("dd-MM-yy");
		String date = now.format(format1);

		HttpSession session = request.getSession();
		int caseid = (int) session.getAttribute("caseid");
		int officerid = (int) session.getAttribute("officerid");
		String history = request.getParameter("history");

		RequestDispatcher dispatcher = null;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DBConnection.createConnection();
			pstmt = con.prepareStatement("insert into casehistory(caseid, history, dates, officerid) values(?,?,?,?)");
			pstmt.setInt(1, caseid);
			pstmt.setString(2, history);
			pstmt.setString(3, date);
			pstmt.setInt(4, officerid);

			int row = pstmt.executeUpdate();

			dispatcher = request.getRequestDispatcher("Addcasehistory.jsp");
			
			if ((row) != 0) {
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "failed");
			}
			
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
