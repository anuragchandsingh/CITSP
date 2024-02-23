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
	String id= request.getParameter("id");
%>
	
<div class="container-sm d-flex justify-content-center">
	<div class="col-lg-7" >
		<form method="post" action="EditAdminPassword">
			<div class="d-flex justify-content-center">
			<p class="h3">Change Password</p>
			<input type=hidden name="id" id="id" value="<%=id%>">
			</div>
              <div class="card mb-4">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0">Old Password</p>
                    </div>
                    <div class="col-sm-8">
                      <input class="form-control" type="text" name="oldpassword" id="oldpassword" placeholder="Enter Old Password"  required />
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0">New Password</p>
                    </div>
                    <div class="col-sm-8">
                      <input class="form-control" type="text" name="newpassword" id="newpassword" placeholder="Enter New Password" required />
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0">Confirm Password</p>
                    </div>
                    <div class="col-sm-8">
                      <input class="form-control" type="text" name="confirmnewpassword" id=confirmnewpassword placeholder="Enter Confirm New Password" required />
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

			swal("Congrats", "Password Updated successfully", "success");
		}
		if (status == "failed") {
			swal("Oops", "Something Went Wrong!", "error");
		}
		if (status == "failed1") {
			swal("Oops", "Password and Confirm Password Should Be Same", "error");
		}
		if (status == "failed2") {
			swal("Oops", "Invalid Old Password", "error");
		}
	</script>
	 <script>
        function validate_password() {
 
            var pass = document.getElementById('password').value;
            var confirm_pass = document.getElementById('confrimnewpassword').value;
            if (pass != confirm_pass) {
                document.getElementById('wrong_pass_alert').style.color = 'red';
                document.getElementById('wrong_pass_alert').innerHTML
                    = '☒ Use same password';
                document.getElementById('create').disabled = true;
                document.getElementById('create').style.opacity = (0.4);
            } else {
                document.getElementById('wrong_pass_alert').style.color = 'green';
                document.getElementById('wrong_pass_alert').innerHTML =
                    '🗹 Password Matched';
                document.getElementById('create').disabled = false;
                document.getElementById('create').style.opacity = (1);
            }
        }
 
        function wrong_pass_alert() {
            if (document.getElementById('password').value != "" &&
                document.getElementById('confrimnewpassword').value != "") {
                alert("Your response is submitted");
            } else {
                alert("Please fill all the fields");
            }
        }
    </script>
</body>
</html>