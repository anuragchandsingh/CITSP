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
<title>Add Result</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">


</head>
<body>
	<jsp:include page="Addresult.jsp"></jsp:include>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	<%
	Connection con = DBConnection.createConnection();
	String cid = request.getParameter("caseid");
	int i2 = cid.indexOf(',');
	String word2 = cid.substring(0, i2);
	int caseid = Integer.parseInt(word2);
	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt1 = null;

	pstmt = con.prepareStatement("select caseid , casename from  ncase where caseid=?");
	pstmt.setInt(1, caseid);
	rs = pstmt.executeQuery();
	int caseid2=0;
	String casename=null;
	if (rs.next()) {
		caseid2 = rs.getInt("caseid");
	    casename = rs.getString("casename");
		session.setAttribute("resultcaseid",caseid2);
		session.setAttribute("resultcasename",casename);

	}
	pstmt1 = con.prepareStatement("select name from suspect where caseid=?");
	pstmt1.setInt(1, caseid);
	rs = pstmt1.executeQuery();
	%>

	<div class="main">

		<section class="signup">
			<div class="container">

				<div class="signup-content">
					<div class="signup-image">
						<figure>
							<img src="images/add_case.jpg" width="1200" height="1600"
								alt="Result Image">
						</figure>

					</div>
					<div class="signup-form">
						<br>
						
							<div class="form-group">
							<label for="Case_Id"><i
								class="zmdi zmdi-account material-icons-name"></i></label>
								 <input type="text" name="caseid" id="caseid" value='<%=session.getAttribute("resultcaseid")%>'  disabled />
						</div>
							<div class="form-group">
							<label for="Case_Name"><i
								class="zmdi zmdi-account material-icons-name"></i></label> <input
								type="text" name="casename" id="casename" value='<%=session.getAttribute("resultcasename")%>' disabled />
						</div>
							
				           <form method="POST" class="register-form" id="register-form" action=addresult>
							<div class="form-group">
								<label for="Suspect"><i class="zmdi zmdi-pin-account"></i></label>
								<select class="round" id="suspect" name="suspect" required>
									<option value="" disabled selected hidden>---- Select
										Suspect ----</option>
									<%
									while (rs.next()) {
									%>
									<option>
										<%=rs.getString("name")%>
									</option>
									<%
									}
									%>
								</select>

							</div>
							<div class="form-group">
								<label for="Note"><i class=""></i></label>
								<textarea name="result" id="result" rows="4" cols="35"
									placeholder="Result" required></textarea>
							</div>

							<div class="form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Submit" />
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

	


</body>
</html>