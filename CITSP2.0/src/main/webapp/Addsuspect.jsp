<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
 <% if(session.getAttribute("caseid")==null)
   {
	   response.sendRedirect("Officerlogin.jsp");
   }
  %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Add Suspect</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="Officermenu.jsp"></jsp:include>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">

	<div class="main">  
		<section class="signup">	
			<div class="container">
               <h2 class="form-title"><center>Add Suspect</center></h2>
				<form method="POST" class="signup-content" action=addsuspect enctype="multipart/form-data">
							
					<div class="signup-image">					
						<figure>
							<h3>Upload Image</h3>
							<p>
								<img src="images/suspect2.png" alt="Suspect Image" id="output" width="170" height="200"/>
							</p>
							<p>
								<input type="file" accept="image/*" name="image" id="image"  onchange="loadFile(event)" required>
							</p>
						</figure>						
					</div>					 
					<div class="signup-form">						
						<div class="register-form">
												
							<div class="form-group">
								<label for="Case_id"><i	class="zmdi zmdi-pin-account"></i></label> 
								<input type="text" name="caseid" id="caseid" required  value=<%=session.getAttribute("caseid") %> disabled />
							</div>
							<div class="form-group">
								<label for="name"><i	class="zmdi zmdi-account material-icons-name"></i></label> 
								<input type="text" name="name" id="name" required  placeholder="Name" />
							</div>

							<div class="form-group">
								<label for="Mob_No"class="zmdi zmdi-smartphone-android"></i></label>
								 <input type="text" name="mobile" id="mobile" maxlength="10" required placeholder="Mobile No" />
							</div>
							<div class="form-group">
								<label for="rel"><i class="zmdi zmdi-accounts-alt"></i></label> 
								<input type="text" name="relation" id="relation" required  placeholder="Relation" />
							</div>

							<div class="form-group">
								<label for="Add"><i class=""></i></label> 
								<textarea name="address" id="address" rows="4" cols="35" required placeholder="Address Of Suspect"></textarea>
							</div>
													
							<div class="form-group">
								<label for="Note"><i class=""></i></label> 
								<textarea name="note" id="note" rows="4" cols="35" required placeholder="Note"></textarea>
							</div>

							<div class="form-button">
								<input type="submit" name="signin" id="signin" class="form-submit" value="Submit" />
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

			swal("Congrats", "Suspect Added Successfully!", "success");
		}
		else if (status == "failed") {
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