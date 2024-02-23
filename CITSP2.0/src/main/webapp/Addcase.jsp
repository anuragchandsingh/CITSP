<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*" import="com.citsp.connection.DBConnection"%>
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
<title>Add Case</title>

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
    String sql="select id, name from officer ORDER BY id DESC";
    ResultSet rs = st.executeQuery(sql);
%>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="Adminmenu.jsp"></jsp:include>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">

	<div class="main">
	
        <section class="signup">
            <div class="container">
               <h2 class="form-title"><center>Add Case</center></h2>
                <div class="signup-content">
                	  <div class="signup-image">
                        <figure><img src="images/add_case2.png" alt="Add Case Image"></figure>            
                      </div>
                    <div class="signup-form">
                       
                        <form method="POST" class="register-form" id="register-form" action=addcase>
                           
							<div class="form-group">
								<label for="Case_Name"><i	class="zmdi zmdi-account material-icons-name"></i></label> 
								<input type="text" name="casename" id="casename" placeholder="Case Name" required />
							</div>
							<div class="form-group">
								<label for="Officer_Id"><i class="zmdi zmdi-pin-account"></i></label>
								<select class="round" id="oid" name="oid"  required>
							      <option value="" disabled selected hidden>---- Select Officer ----</option>
							   <% while(rs.next())
							     {%>
							       <option>
							       <%=rs.getInt("id")%>,&nbsp;&nbsp;&nbsp;<%=rs.getString("name")%>
							       </option>							     
							  <% } %>							
								</select>
							</div>
 				
							<div class="form-group">
								<label for="Note"><i class=""></i></label> 
								<textarea name="note" id="note" rows="4" cols="35" placeholder="Note" required></textarea>
							</div>
							
                            <div class="form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Submit"/>
                            </div>
                        </form>
                        <% st.close(); %>
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
		if (status == "success") {

			swal("Congrats", "Case Added Successfully!\nCaseId and Password has been mailed to the Officer", "success");
		}
		if (status == "failed") {
			swal("Oops", "Something Went Wrong!", "error");
		}
	</script>
	

</body>
</html>