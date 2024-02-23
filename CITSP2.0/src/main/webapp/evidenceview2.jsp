
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
<title>View Evidence</title>

</head>
<body>
	<jsp:include page="evidenceview.jsp"></jsp:include>
	<%
	Connection con = DBConnection.createConnection();
	
	String cid = request.getParameter("caseid");
	int i2 = cid.indexOf(',');
	String word2 = cid.substring(0, i2);
	int caseid = Integer.parseInt(word2);
	
	RequestDispatcher dispatcher = null;
	PreparedStatement pstmt = con.prepareStatement("select count(*) from evidence where caseid=?");
	pstmt.setInt(1, caseid);
	
	 try (ResultSet resultSet = pstmt.executeQuery()) {
            if (resultSet.next()) {
                int rowCount = resultSet.getInt(1);
                if (rowCount == 0) {                    
                    dispatcher = request.getRequestDispatcher("casehistoryview.jsp");
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
						</tr>
						<%
						while (rs.next()) {
						%>
						<tr>
							<td><%=rs.getInt("caseid")%></td>
							<td><%=rs.getString("evidence")%></td>
							<td><%=rs.getString("type")%></td>
							<td><%=rs.getString("suspect")%></td>
							<td><%=rs.getString("note")%></td>
							<td><%=rs.getInt("rank")%></td>
							<td><%=rs.getString("dates")%></td>
							<td><%=rs.getInt("Officerid")%></td>
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
</body>
</html>