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

@WebServlet("/addsuspect")
@MultipartConfig
public class AddSuspect extends HttpServlet {
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

		String uploadPath = "C:/Users/anura/git/CITSP/CITSP2.0/src/main/webapp/images/"+ imagefilename;

		HttpSession session = request.getSession();
		String caseid1 = (String) session.getAttribute("caseid");
		int caseid= Integer.parseInt(caseid1);
		String name = request.getParameter("name");
		String mobile = request.getParameter("mobile");
		String relation = request.getParameter("relation");
		String address = request.getParameter("address");
		String note = request.getParameter("note");

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
					"insert into suspect(caseid, name, image, mobile, relation, address, note, dates) values(?,?,?,?,?,?,?,?)");
			pstmt.setInt(1, caseid);
			pstmt.setString(2, name);
			pstmt.setString(3, imagefilename);
			pstmt.setString(4, mobile);
			pstmt.setString(5, relation);
			pstmt.setString(6, address);
			pstmt.setString(7, note);
			pstmt.setString(8, date);

			int row = pstmt.executeUpdate();

			dispatcher = request.getRequestDispatcher("Addsuspect.jsp");
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
