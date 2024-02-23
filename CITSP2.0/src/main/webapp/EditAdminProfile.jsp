<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"
	import="com.citsp.connection.DBConnection"%>

  <% if(session.getAttribute("adminid")==null)
   {
	   response.sendRedirect("Adminlogin.jsp");
   }
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
  <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
    
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css">
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css">
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="Adminmenu.jsp"/>
<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
<br>
<%
	Connection con = DBConnection.createConnection();
	String id= request.getParameter("id");
	
	PreparedStatement pstmt = con.prepareStatement("select * from admin where id=?");
	pstmt.setString(1,id);
	
	ResultSet rs= pstmt.executeQuery();

	String name=null;
	String email=null;
	String mobile=null;
	String address=null;
	String image=null;
	if(rs.next())
	{
		id=rs.getString("id");
		name= rs.getString("name");
		email=rs.getString("email");
		mobile=rs.getString("mobile");
		address=rs.getString("address");
		image=rs.getString("image");
	}
%>
	
<div class="container-sm d-flex justify-content-center">
	<div class="col-lg-6" >
		<form method="post" action="AdminUpdate">
			<div class="d-flex justify-content-center">
			<p class="h3">Edit Profile</p>
			<input type=hidden name="id" id="id" value="<%=id%>">
			</div>
              <div class="card mb-4">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0">Name</p>
                    </div>
                    <div class="col-sm-8">
                      <input class="form-control" type="text" name="name" id="name" value="<%=name%>" required />
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0">Email</p>
                    </div>
                    <div class="col-sm-8">
                      <input class="form-control" type="text" name="email" id="email" value="<%=email%>" required />
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0">Mobile</p>
                    </div>
                    <div class="col-sm-8">
                      <input class="form-control" type="text" name="mobile" id="mobile" value="<%=mobile%>" required />
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0">Address</p>
                    </div>
                    <div class="col-sm-8">
                      <input class="form-control" type="text" name="address" id="address" value="<%=address%>" required />
                    </div>
                  </div>
                </div>                	
              </div> 
              <div class="d-flex justify-content-end">
              		<div>
              			<a href="Adminindex.jsp" class="btn btn-outline-dark">Back</a>
              			<input class="btn btn-outline-primary" type="submit" value="Save" >
              		</div>
              </div>             
                 
         </form>         
    </div>
</div>

<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "success") {

			swal("Congrats", "Profile Updated successfully", "success");
		}
		if (status == "failed") {
			swal("Oops", "Something Went Wrong!", "error");
		}
	</script>
</body>
</html>