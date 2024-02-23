<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Officer Login</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">

	<div class="main">
		<!-- Sing in  Form -->
		<section class="sign-in">

			<div class="container">
			    <h2 class="form-title"><center>Officer Login</center></h2>

				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="images/policemanimage.png" alt=" Officer image" width="170" height="200">
						</figure>
						<div>
						<P>Click here for <a style="text-decoration:none;" href="Adminlogin.jsp">Admin Login</a></P>
						</div>
					</div>

					<div class="signin-form">
						
						<form method="POST" class="register-form" action=officerlogin>
							<div class="form-group">
								<label for="Case_Id"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="caseid" id="caseid" placeholder="Case Id" />
							</div>
							<div class="form-group">
								<label for="Officer_Id"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="officerid" id="officerid" placeholder="Officer Id" />
							</div>
							<div class="form-group">
								<label for="your_pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass"
									placeholder="Password" />
							</div>
							
							<div class="form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>

					</div>
				</div>
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
		if (status == "failed") {
			swal("Oops", "Invalid User Credentials!", "error");
		}
	</script>

</body>
</html>