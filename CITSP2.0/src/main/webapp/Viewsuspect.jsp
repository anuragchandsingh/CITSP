
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"
	import="com.citsp.connection.DBConnection"%>
 <%
   if(session.getAttribute("caseid")==null)
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
<title>View Suspect</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style2.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="Officermenu.jsp"></jsp:include>
	<input type=hidden id="status" value="<%=request.getAttribute("status")%>">
	<h2 class="form-title">	<center><u>Suspects</u></center></h2>
	<%
	Connection con = DBConnection.createConnection();
	String caseid1 = (String) session.getAttribute("caseid");
	int caseid = Integer.parseInt(caseid1);

	RequestDispatcher dispatcher = null;
	PreparedStatement pstmt = con.prepareStatement("select count(*) from suspect where caseid=?");
	pstmt.setInt(1, caseid);

	try (ResultSet resultSet = pstmt.executeQuery()) {
		if (resultSet.next()) 
		{
			int rowCount = resultSet.getInt(1);
			if (rowCount == 0) 
			{
				dispatcher = request.getRequestDispatcher("suspectview.jsp");
			
	%>
	<center>
		<p style="color: red; font-size: 20px;">No Records Found</p>
	</center>
	<%
	} else {

	PreparedStatement pstmt1 = con.prepareStatement("select * from suspect where caseid=?");
	pstmt1.setInt(1, caseid);

	ResultSet rs = pstmt1.executeQuery();
	%>
	
	<div class="main">

		<section class="signup">
			<div class="container2">
				
				<div class="signup-content2">
					<table class="table1">
						<tr>
							<th>Case Id</th>
							<th>Name</th>
							<th>Mobile</th>
							<th>Relation</th>
							<th>Address</th>
							<th>Date</th>
							<th>Note</th>
							<th></th>
						</tr>
						<%
						while (rs.next()) {
							int id=rs.getInt("suspectid");
						%>
						<tr>
							<td><%=rs.getInt("caseid")%></td>
							<td><%=rs.getString("name")%></td>
							<td><%=rs.getString("mobile")%></td>
							<td><%=rs.getString("relation")%></td>
							<td><%=rs.getString("address")%></td>
							<td><%=rs.getString("dates")%></td>
							<td><%=rs.getString("note")%></td>
							<td><a href="DeleteSuspect.jsp?id=<%=id%>" onclick="return confirm('Are you sure you want to delete?');" ><i class="zmdi zmdi-delete"></i></a></td>
						</tr>
						<%
						}
                }
            }
	 }
						%>
					</table>
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
		if (status == "success") {

			swal("", "Record deleted successfully", "success");
		}
		if (status == "failed") {
			swal("Oops", "Something Went Wrong!", "error");
		}
	</script>
</body>
</html>