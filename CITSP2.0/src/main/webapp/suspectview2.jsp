
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
<title>View Suspect</title>
  <link rel="stylesheet" href="css/style2.css">

</head>
<body>
	<jsp:include page="suspectview.jsp"></jsp:include>
	<%
	Connection con = DBConnection.createConnection();

	
	String cid = request.getParameter("caseid");
	int i2 = cid.indexOf(',');
	String word2 = cid.substring(0, i2);
	int caseid = Integer.parseInt(word2);

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
						</tr>
						<%
						while (rs.next()) {
							int id=rs.getInt("caseid");
							String name=rs.getString("name");
							String image=rs.getString("image");
							String mobile=rs.getString("mobile");
							String relation=rs.getString("relation");
							String address=rs.getString("address");
							String dates=rs.getString("dates");
							String note= rs.getString("note");
						%>
						<tr>
							<td><%=id%></td>
							<td><%=name%></td>
							<td><%=mobile%></td>
							<td><%=relation%></td>
							<td><%=address%></td>
							<td><%=dates%></td>
							<td><%=note%></td>
						</tr>					
						<%
						}
						%>
					</table>			
			<%
			}
		}
	}
        	%>
        	</div>
		</div>
	 </section>
	</div>
</body>
</html>