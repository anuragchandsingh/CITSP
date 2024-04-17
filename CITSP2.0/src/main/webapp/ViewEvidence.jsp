
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
<title>View Evidence</title>

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
	<h2 class="form-title">	<center><u>Evidences</u></center></h2>
	<%
	Connection con = DBConnection.createConnection();
	String caseid1 = (String) session.getAttribute("caseid");
	int caseid = Integer.parseInt(caseid1);

	RequestDispatcher dispatcher = null;
	PreparedStatement pstmt = con.prepareStatement("select count(*) from evidence where caseid=?");
	pstmt.setInt(1, caseid);
	
	 try (ResultSet resultSet = pstmt.executeQuery()) {
            if (resultSet.next()) {
                int rowCount = resultSet.getInt(1);
                if (rowCount == 0) {                    
                    dispatcher = request.getRequestDispatcher("ViewEvidence.jsp");
                    %> 
                    <center>
                    <p style="color:red; font-size: 20px; ">No Records Found</p>
                    </center>
                    <% 
                }
                else {
	
	PreparedStatement pstmt1 = con.prepareStatement("select * from evidence where caseid=?");
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
							<th>Evidence</th>
							<th>Type</th>
							<th>Suspect</th>
							<th>Note</th>
							<th>Rank</th>
							<th>Date</th>
							<th>Officer Id</th>
							<th></th>
						</tr>
						<%
						while (rs.next()) {
							int id=rs.getInt("evidenceid");
						%>
						<form method=post action="#" id="delete">
						<tr>
							<td name="caseid" id="caseid" ><%=rs.getInt("caseid")%></td>
							<td name="evidence" id="evidence" ><%=rs.getString("evidence")%></td>
							<td name="type" id="type" ><%=rs.getString("type")%></td>
							<td name="suspect" id="suspect" ><%=rs.getString("suspect")%></td>
							<td name="note" id="note" ><%=rs.getString("note")%></td>
							<td name="rank" id="rank" ><%=rs.getInt("rank")%></td>
							<td name="dates" id="dates" ><%=rs.getString("dates")%></td>
							<td name="officerid" id="officerid" ><%=rs.getInt("Officerid")%></td>
							<td><a href="DeleteEvidence.jsp?id=<%=id%>" onclick="return confirm('Are you sure you want to delete?');"><i class="zmdi zmdi-delete"></i></a></td>
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