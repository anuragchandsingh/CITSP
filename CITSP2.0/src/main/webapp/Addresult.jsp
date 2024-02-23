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
<link rel="stylesheet" href="css/style2.css">
</head>
<body>
	<%
	Connection con = DBConnection.createConnection();
	Statement st = con.createStatement();
	String sql = "select * from ncase ORDER BY caseid DESC";
	ResultSet rs = st.executeQuery(sql);
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="Adminmenu.jsp"></jsp:include>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
<center>
	 <h2 class="form-title"><u>Add Result</u></h2>
	    <form method="POST" action="Addresult2.jsp" >
		<select class="round" id="caseid" name="caseid" required >
			<option value="" disabled selected hidden>---  Select Case  ---</option>
			<%
			while (rs.next()) {
			%>
			<option>
				<%=rs.getInt("caseid")%>,&nbsp;&nbsp;&nbsp;<%=rs.getString("casename")%>
			</option>
			<%
			}
			%>
		</select>

         <input type="submit" name="signup" id="signup" class="form-submit2" value="Get Details"/>
   </form>
  </center>
  
  <!-- JS -->
<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "success") {

			swal("Congrats","Result Added Successfully!","success");
		}
		if (status == "failed") {
			swal("Oops", "Result is already added!", "error");
		}
	</script>

</body>
</html>