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
<title>Add Evidence</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>
   <%
    Connection con = DBConnection.createConnection();
   	String caseid1 = (String)session.getAttribute("caseid");
   	int caseid= Integer.parseInt(caseid1);
    PreparedStatement pstmt = con.prepareStatement("select name from suspect where caseid=?");
    pstmt.setInt(1,caseid);
    ResultSet rs = pstmt.executeQuery();
  %>
	
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="Officermenu.jsp"></jsp:include>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">

	<div class="main">	  
		<section class="signup">	
			<div class="container">
			<h2 class="form-title"><center>Add Evidence</center></h2>         
				<form method="POST" class="signup-content" action=addevidence enctype="multipart/form-data">
		
					<div class="signup-image">				
						<figure>
							<h3>Upload Image</h3>
							<p>
								<img src="images/evidenceimage2.png" alt="Evidence Image" id="output" width="130" height="150"/>
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
								<input type="text" name="caseid" id="caseid" required   value=<%=session.getAttribute("caseid") %> disabled />
							</div>
							<div class="form-group">
								<label for="Evidence"><i class="zmdi zmdi-label-alt"></i></label> 
							<select class="round" id="evidencetype" name="evidencetype"  required>
							      <option value="" disabled selected hidden>---- Select Evidence Type ----</option>
							       <option>Physical</option>
							       <option>Logical</option>							     
							  							
							</select>
							</div>
							<div class="form-group">
								<label for="Evidence"><i class="zmdi zmdi-label-alt"></i></label> 
								<input type="text" name="evidence" id="evidence" required  placeholder="Evidence" />
							</div>
							
							<div class="form-group">
								<label for="Evidence"><i class="zmdi zmdi-label-alt"></i></label> 
							<select class="round" id="suspect" name="suspect"  required>
							      <option value="" disabled selected hidden >---- Select Suspect ----</option>
							    <% while(rs.next())
							     {%>
							       <option>
							       <%=rs.getString("name")%>
							       </option>							     
							  <% } %>						    			
							</select>
                            </div>
                            
							<div class="form-group">
								<label for="Note"><i class=""></i></label> 
								<textarea name="note" id="note" rows="4" cols="35" required placeholder="Note"></textarea>
							</div>
							
							<div class="form-group">
								<label for="point" class="zmdi zmdi-label-alt"></i></label>
								 <input type="number" name="point" id="point" min="1" max="10" required placeholder="Point out of 10" />
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

			swal("Congrats", "Evidence Added Successfully!", "success");
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