<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*" import="com.citsp.connection.DBConnection"%>
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
<title>Add Case History</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>
   <%
    Connection con = DBConnection.createConnection();
    Statement st = con.createStatement();
    String sql="select name from suspect";
    ResultSet rs = st.executeQuery(sql);
  %>
	
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="Officermenu.jsp"></jsp:include>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">

	<div class="main">
	  
		<section class="signup">
		
			<div class="container">
               <h2 class="form-title"><center>Add Case History</center></h2>
				<form method="POST" class="signup-content" action=addcasehistory>
						
					<div class="signup-image">				
						<figure>
								<img src="images/casehistory.png" alt="Case History Image" id="output" width="120" height="140"/>				
						</figure>					
					</div>
					 
					<div class="signup-form">						
						<div class="register-form">							
							<div class="form-group">
								<label for="Case_id"><i	class="zmdi zmdi-pin-account"></i></label> 
								<input type="text" name="caseid" id="caseid" required   value=<%=session.getAttribute("caseid") %> disabled />
							</div>
														
							<div class="form-group">
								<label for="Note"><i class=""></i></label> 
								<textarea name="history" id="history" rows="4" cols="35" required placeholder="Case History"></textarea>
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

			swal("Congrats", "Case History Added Successfully!", "success");
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