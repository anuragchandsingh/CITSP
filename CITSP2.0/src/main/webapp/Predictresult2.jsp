
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
<title>Predict Result</title>
  <link rel="stylesheet" href="css/style2.css">

</head>
<body>
	<jsp:include page="Predictresult.jsp"></jsp:include>
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
		if (resultSet.next()) {
			int rowCount = resultSet.getInt(1);
			if (rowCount == 0) {
		dispatcher = request.getRequestDispatcher("Predictresult.jsp");
	%>
	<center>
		<p style="color: red; font-size: 20px;">No Records Found</p>
	</center>
	<%
	} else {

	PreparedStatement pstmt1 = con.prepareStatement("select * from suspect where caseid=?");
	pstmt1.setInt(1, caseid);

	ResultSet rs = pstmt1.executeQuery();
	int id=0;
	String name=null;
	String mobile=null;
	String image=null;
	
	ResultSet rs1 = pstmt1.executeQuery();
	int ps=0;
	int ls=0;
	%>
	<div class="main">
		<section class="signup">
			<div class="container2">
				<div class="signup-content2">
					<table class="table2">
					<%
					while(rs1.next()){
						
						
						name=rs1.getString("name");
						image=rs1.getString("image");
						mobile=rs1.getString("mobile");
						
						PreparedStatement pstmt2 = con.prepareStatement("select rank from evidence where type='Physical' and suspect=? and caseid=?");
						pstmt2.setString(1, name);
						pstmt2.setInt(2, caseid);
						
						ResultSet rs2 = pstmt2.executeQuery();
						
						ps=0;
						if(rs2.next())
						{
							ps=rs2.getInt("rank");
						}
						
						PreparedStatement pstmt3 = con.prepareStatement("select rank from evidence where type='Logical' and suspect=? and caseid=?");
						pstmt3.setString(1, name);
						pstmt3.setInt(2, caseid);
						
						ResultSet rs3 = pstmt3.executeQuery();
						
						ls=0;
						if(rs3.next())
						{
							ls=rs3.getInt("rank");
						}
						
						int prob=0;
						float a= (float) (ps+ls)/2;
						a=a*10;
						prob=(int) a;
					%>
	   					<tr>
	   						<td rowspan="2">
         						<div class="tableimage">
             						<img src="images/<%=image%>" alt="Suspect Photo" style="height:100%; width:100%;">
             					</div>
         					</td>
       						<tr>
             					<td>
                 					<p>Name: <%=name%></p>
                 					<p>Mobile No: <%=mobile%></p>
             					</td>
            					<td>
                 					<p>Physical Scroe: <%=ps%></p>
                 					<p>Logical Scroe: <%=ls%></p>
             					</td>
             					<td>
                 					Probability: <%=prob%>%
             					</td>
         					</tr>
	   					</tr>
        	      				
        				<%} %>    
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