
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"
	import="com.citsp.connection.DBConnection"
	import="javax.servlet.RequestDispatcher"	
	%>
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
<title>View Case History</title>

</head>
<body>
	<jsp:include page="casehistoryview.jsp"></jsp:include>
	<%
	Connection con = DBConnection.createConnection();
	
	String cid = request.getParameter("caseid");
	int i2 = cid.indexOf(',');
	String word2 = cid.substring(0, i2);
	int caseid = Integer.parseInt(word2);
	
	RequestDispatcher dispatcher = null;
	PreparedStatement pstmt = con.prepareStatement("select count(*) from casehistory where caseid=?");
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
	
					PreparedStatement pstmt2 = con.prepareStatement("select * from casehistory where caseid=?");
					pstmt2.setInt(1, caseid);
					
					ResultSet rs = null;
				    rs = pstmt2.executeQuery();	
	%>
	<div class="main">
		<section class="signup">
			<div class="container2">
			
				<div class="signup-content2">
				
					<table class="table1">
						<tr>
							<th>Case Id</th>
							<th>History</th>
							<th>Date</th>
							<th>Officer Id</th>
						</tr>
						<%
						while (rs.next()) {												
						%>
						<tr>
							<td><%=rs.getInt("caseid")%></td>
							<td><%=rs.getString("history")%></td>
							<td><%=rs.getString("dates")%></td>
							<td><%=rs.getInt("officerid")%></td>						
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