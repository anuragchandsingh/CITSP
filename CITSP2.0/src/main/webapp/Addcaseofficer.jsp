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
<title>Add Case Officer</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">

 
</head>
<body>
<%
    Connection con = DBConnection.createConnection();
	Statement st1,st2;
	ResultSet rs1, rs2;
	String sql1,sql2;
	
    st1 = con.createStatement();
    sql1="select * from ncase ORDER BY caseid DESC";
    rs1 = st1.executeQuery(sql1);
    
    st2 = con.createStatement();
    sql2="select id, name from officer ORDER BY id DESC";
    rs2=st2.executeQuery(sql2);
%>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="Adminmenu.jsp"></jsp:include>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">

	<div class="main">
	
        <section class="signup">
            <div class="container">
               <h2 class="form-title"><center>Add Case Officer</center></h2>
                <div class="signup-content">
                	  <div class="signup-image">
                        <figure><img src="images/addcaseofficer.png"  alt="Add Case Officer Image"></figure>
                        
                    </div>
                    <div class="signup-form">
                       
                        <form method="POST" class="register-form" id="register-form" action=addcaseofficer>
                          
							<div class="form-group">
								<label for="Case_Id"><i class="zmdi zmdi-pin-account"></i></label>
							
							<select class="round" id="caseid" name="caseid"  required>
							      <option value="" disabled selected hidden>---- Select Case ----</option>
							   <% while(rs1.next())
							     {%>
							       <option>
							       <%=rs1.getInt("caseid")%>,&nbsp;&nbsp;&nbsp;<%=rs1.getString("casename")%>
							       </option>							     
							  <% } %>							
							</select>
						
							</div>
							
							<div class="form-group">
								<label for="Officer_Id"><i class="zmdi zmdi-pin-account"></i></label>
							
							<select class="round" id="officerid" name="officerid"  required>
							      <option value="" disabled selected hidden>---- Select Officer ----</option>
							   <% while(rs2.next())
							     {%>
							       <option>
							       <%=rs2.getInt("id")%>,&nbsp;&nbsp;&nbsp;<%=rs2.getString("name")%>
							       </option>							     
							  <% } %>							
							</select>
						
							</div>

							
                            <div class="form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Submit"/>
                            </div>
                        </form>
                        <% st1.close();
					       st2.close();
		     			%>
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

			swal("Congrats", "Case Officer Added Successfully!", "success");
		}
		if (status == "failed") {
			swal("Oops", "Officer is already added to this case !", "error");
		}
		if (status == "failed2") {
			swal("Oops", "Something Went Wrong!", "error");
		}
	</script>
	

</body>
</html>