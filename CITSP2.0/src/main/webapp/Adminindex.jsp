<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"
	import="com.citsp.connection.DBConnection"%>

<%
if (session.getAttribute("adminid") == null) {
	response.sendRedirect("Adminlogin.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<link rel="stylesheet" href="bootstrap/css/bootstrap.css"
	type="text/css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"
	type="text/css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="Adminmenu.jsp" />
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	<%
	Connection con = DBConnection.createConnection();
	String id = (String) session.getAttribute("adminid");

	PreparedStatement pstmt = con.prepareStatement("select * from admin where id=?");
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();

	String name = null;
	String email = null;
	String mobile = null;
	String address = null;
	String image = null;
	if (rs.next()) {
		id = rs.getString("id");
		name = rs.getString("name");
		email = rs.getString("email");
		mobile = rs.getString("mobile");
		address = rs.getString("address");
		image = rs.getString("image");
	}
	%>
	<section style="background-color: #eee;">
		<div class="container-sm py-5">
			<div class="row">
				<div class="col-lg-4">
					<div class="card mb-4">
						<div class="card-body text-center">
							<img src="images/<%=image%>" alt="admin_photo"
								class="rounded-circle img-fluid" style="width: 125px;">
							<h5 class="my-1"><%=name%></h5>
							<p class="text-muted mb-1">Full Stack Developer</p>
							<p class="text-muted mb-2"><%=address%></p>
							<div class="d-flex justify-content-center mb-2">
								<a href="EditAdminProfile.jsp?id=<%=id%>"
									class="btn btn-outline-primary ms-1">Edit Profile</a>
								<a href="EditAdminPass.jsp?id=<%=id%>"
									class="btn btn-outline-primary ms-1">Change Password</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="card mb-4">
						<div class="card-body">
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Name</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0"><%=name%></p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Job</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0">Admin</p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Email</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0"><%=email%></p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Mobile</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0">
										+91
										<%=mobile%></p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Address</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0"><%=address%></p>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

			<%
			Statement stmt1 = con.createStatement();
			Statement stmt2 = con.createStatement();

			String query1 = "select count * from ncase";
			String query2 = "select count * from officer";
			%>
			<!--  
			<div class="row">
				<div class="col-md-6">
					<div class="card">
						<div class="card-header h4 text-center">Case Details</div>
						<div class="card-body">
							<h5 class="card-title">Special title treatment</h5>
							<p class="card-text">With supporting text below as a natural
								lead-in to additional content.</p>
							<a href="#" class="btn btn-primary">Go somewhere</a>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card">
						<div class="card-header h4 text-center">Officer Details</div>
						<div class="card-body">
							<h5 class="card-title">Special title treatment</h5>
							<p class="card-text">With supporting text below as a natural
								lead-in to additional content.</p>
							<a href="#" class="btn btn-primary">Go somewhere</a>
						</div>
					</div>
				</div>
			</div>
			-->
		</div>
	</section>
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "success") {

			swal("Congrats", "Profile Updated successfully", "success");
		}
		if (status == "success1") {

			swal("Congrats", "Password Changed successfully", "success");
		}
		if (status == "failed") {
			swal("Oops", "Something Went Wrong!", "error");
		}
	</script>

</body>
</html>