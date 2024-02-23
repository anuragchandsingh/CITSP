package com.citsp.officerModule;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.citsp.connection.DBConnection;

@MultipartConfig
@WebServlet("/addevidence")
public class AddEvidence extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Part file = request.getPart("image");
		String filename = file.getSubmittedFileName();

		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyMMdd_HHmmss_");
		String formatDateTime = now.format(format);
		String imagefilename = formatDateTime + filename;

		DateTimeFormatter format1 = DateTimeFormatter.ofPattern("dd-MM-yy");
		String date = now.format(format1);

		String uploadPath = "D:/Project/Crime Investigation tracker with suspect prediction/CITSP2.0/src/main/webapp/images/"
				+ imagefilename;

		HttpSession session = request.getSession();
		int caseid = (int) session.getAttribute("caseid");
		int officerid = (int) session.getAttribute("officerid");
		String type = request.getParameter("evidencetype");
		String evidence = request.getParameter("evidence");
		String suspect = request.getParameter("suspect");
		String note = request.getParameter("note");
		int rank = Integer.parseInt(request.getParameter("point"));

		RequestDispatcher dispatcher = null;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			InputStream is = file.getInputStream();
			byte[] data = new byte[is.available()];
			is.read(data);

			FileOutputStream fos = new FileOutputStream(uploadPath);
			fos.write(data);
			fos.close();

			con = DBConnection.createConnection();
			pstmt = con.prepareStatement(
					"insert into evidence(caseid, evidence, type, suspect, image, note, rank, dates, officerid) values(?,?,?,?,?,?,?,?,?)");
			pstmt.setInt(1, caseid);
			pstmt.setString(2, evidence);
			pstmt.setString(3, type);
			pstmt.setString(4, suspect);
			pstmt.setString(5, imagefilename);
			pstmt.setString(6, note);
			pstmt.setInt(7, rank);
			pstmt.setString(8, date);
			pstmt.setInt(9, officerid);
			
			int row = pstmt.executeUpdate();

			dispatcher = request.getRequestDispatcher("Addevidence.jsp");
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
