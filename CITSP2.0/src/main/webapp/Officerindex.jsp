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
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Home</title>
 	<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="css/style.css">
    
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css"
	type="text/css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"
	type="text/css">
 
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="Officermenu.jsp"/>
<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
<%
	Connection con = DBConnection.createConnection();
	String caseid = (String) session.getAttribute("caseid");
	String casename = (String) session.getAttribute("casename");
	
	String officerid = (String) session.getAttribute("officerid");
	
	int id = Integer.parseInt(officerid);
	PreparedStatement pstmt = con.prepareStatement("select * from officer where id=?");
	pstmt.setInt(1, id);
	ResultSet rs = pstmt.executeQuery();
	String name=null;
	String image = null;
	String mobile=null;
	String mail=null;
	String address=null;
	if(rs.next())
	{
		name=rs.getString("name");
		image=rs.getString("image");
		mobile= rs.getString("mobile");
		mail= rs.getString("mail");
		address=rs.getString("address");
	}
	%>

     <section style="background-color: #eee;">
		<div class="container-sm py-5">
			<div class="row">
				<div class="col-lg-4">
					<div class="card mb-4">
						<div class="card-body text-center">
							<img src="images/<%=image%>" alt="Officer_photo"
								class="rounded-circle img-fluid" style="width: 130px; height:130px;">
							<h5 class="my-1"><%=name%></h5>
							<p class="text-muted mb-1">Crime Branch Officer</p>
							<p class="text-muted mb-2"></p>
							
						</div>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="card mb-4">
						<div class="card-body">
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Case Id</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0"><%=caseid%></p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Case Name</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0"><%=casename%></p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Officer Name</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0"><%=name%></p>
								</div>
							</div>
							<hr>
							
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Email</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0"><%=mail%></p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Mobile</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0">
										+91<%=mobile%>
										</p>
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