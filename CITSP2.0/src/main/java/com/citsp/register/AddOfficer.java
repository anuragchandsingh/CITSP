 package com.citsp.register;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.citsp.connection.DBConnection;
import com.citsp.mail.Mail;

/**
 * Servlet implementation class AddOfficer
 */
@MultipartConfig
public class AddOfficer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Part file = request.getPart("image");
		String filename = file.getSubmittedFileName();

		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyMMdd_HHmmss_");
		String formatDateTime = now.format(format);
		String imagefilename = formatDateTime + filename;

		String uploadPath = "C:/Users/anura/git/CITSP/CITSP2.0/src/main/webapp/images/"+ imagefilename;

		String name = request.getParameter("name");
		String mobile = request.getParameter("mobile");
		String mail = request.getParameter("mail");
		String post = request.getParameter("post");
		String address = request.getParameter("address");

		// String pass= Generate.password();

		RequestDispatcher dispatcher = null;
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;

		try {
			// String oid= Generate.id();

			InputStream is = file.getInputStream();
			byte[] data = new byte[is.available()];
			is.read(data);

			FileOutputStream fos = new FileOutputStream(uploadPath);
			fos.write(data);
			fos.close();

			con = DBConnection.createConnection();
			pstmt = con.prepareStatement(
					"insert into officer(name, image, mobile, mail , post, address) values(?,?,?,?,?,?)");

			pstmt.setString(1, name);
			pstmt.setString(2, imagefilename);
			pstmt.setString(3, mobile);
			pstmt.setString(4, mail);
			pstmt.setString(5, post);
			pstmt.setString(6, address);
			int row = pstmt.executeUpdate();

			int oid = 0;
			pstmt1 = con.prepareStatement("select id from officer where name=? and mobile=? and mail=?");
			pstmt1.setString(1, name);
			pstmt1.setString(2, mobile);
			pstmt1.setString(3, mail);
			rs = pstmt1.executeQuery();
			
			while (rs.next()) {
				oid = rs.getInt("id");
			
			}

			dispatcher = request.getRequestDispatcher("Addofficer.jsp");
			if ((row) != 0) {

				Mail.sendMail(name, mail, oid);
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
				pstmt1.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
