<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    
    <style>
    	.c{
    		border:1px solid black;
            display:inline-block;
            width: 130px;
            height:150px;
            overflow:hidden; 
            border-radius: 10px;
    	}
    	
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="Officermenu.jsp"/>

 
<h3>
   &nbsp; &nbsp; Welcome <br> 	
 	
<!--   <img src="images/<%= session.getAttribute("image") %>" alt="Officer Image"> -->
</h3>
      <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                   
                    <div class="signin-form">
                        <P><b>Officer Name:</b><%= session.getAttribute("name") %></P>
                        <P><b>Email Id:</b>anurag.bho11@gmail.com</P>
                            
                    </div>
                    <div class="signin-form">
                       <p><b>Case Id:</b><%= session.getAttribute("caseid") %></p>
                       <p><b>Case Name:</b>Crime 1</p>     
                    </div>

                    
                </div>
            </div>
        </section>
        
</body>
</html>