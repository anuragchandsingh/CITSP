<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"
	import="com.citsp.connection.DBConnection"%>
  <% if(session.getAttribute("adminid")==null)
   {
	   response.sendRedirect("Adminlogin.jsp");
   }
  %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Add Officer</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<%
	Connection con = DBConnection.createConnection();
	Statement stmt = con.createStatement();
	String sql = "select max(id) from officer";
	ResultSet rs = stmt.executeQuery(sql);
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="Adminmenu.jsp"></jsp:include>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">

	<div class="main">

		<section class="signup">

			<div class="container">
			    <h2 class="form-title"><center>Add Officer</center></h2>

				<form method="POST" class="signup-content" action=addofficer
					enctype="multipart/form-data">


					<div class="signup-image">

						<figure>
							<h3>Upload Image</h3>
							<p>
								<img src="images/policemanimage.png" alt="Add Officer Image"
									id="output" width="130" height="150" />
							</p>
							<p>
								<input type="file" accept="image/*" name="image" id="file"
									onchange="loadFile(event)" required>
							</p>
						</figure>

					</div>

					<div class="signup-form">
						
						<div class="register-form">

							<div class="form-group">
								<label for="Office_Name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" required
									placeholder="Officer Name" />
							</div>

							<div class="form-group">
								<label for="Mob_NO"><i
									class="zmdi zmdi-smartphone-android"></i></label> <input type="text"
									name="mobile" id="mobile" maxlength="10" required
									placeholder="Mobile No" />
							</div>


							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="mail" name="mail" id="mail" required placeholder="Email" />
							</div>

							<div class="form-group">
								<label for="post"><i class="zmdi zmdi-pin"></i></label> <input
									type="text" name="post" id="post" required placeholder="Area" />
							</div>

							<div class="form-group">
								<label for="Add"><i class=""></i></label>
								<textarea name="address" id="address" rows="4" cols="35"
									required placeholder="Address Of Officer"></textarea>
							</div>

							<div class="form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Submit" />
							</div>
						</div>
					</div>
				</form>
			</div>

		</section>

	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "success") {

			swal(
					"Congrats",
					"Officer Added Successfully!\nId has been mailed to the Officer",
					"success");
		} else if (status == "failed") {
			swal("Oops", "Something Went Wrong!", "error");
		}
	</script>

	<script>
		var loadFile = function(event) {
			var image = document.getElementById('output');
			image.src = URL.createObjectURL(event.target.files[0]);
		};
	</script>

</body>
</html>