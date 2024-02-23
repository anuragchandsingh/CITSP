<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% if(session.getAttribute("adminid")==null)
   {
	   response.sendRedirect("Adminlogin.jsp");
   }
  %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #4292dc;
 
  
  
}



.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 13px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
  
}

.topnav a.active {
  background-color: #04AA6D;
  color: white;
 
}

.topnav .icon {
  display: none;
}

@media screen and (max-width: 1050px) {
  .topnav a:not(:first-child) {display: none;}
  .topnav a.icon {
    float: right;
    display: block;
  }
}

@media screen and (max-width: 1051px) {
  .topnav.responsive {position: relative;}
  .topnav.responsive .icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a {
    float: none;
    display: block;
    text-align: left;
  }
}
</style>
</head>
<body>

<div class="topnav" id="myTopnav">
  <a  href="Adminindex.jsp">Welcome </a>
  <a  href="Addofficer.jsp">Add Officer</a>
  <a  href="Addcase.jsp">Add Case</a>
  <a  href="Addcaseofficer.jsp">Add Case Officer</a>
  <a  href="Addresult.jsp">Add Result</a>
  <a  href="Predictresult.jsp">Predict Result</a>
  <a  href="suspectview.jsp">View Suspects</a>
  <a  href="evidenceview.jsp">View Evidence</a>
  <a  href="casehistoryview.jsp">Case History</a>
  <a  href="logout" onclick="return confirm('Are you sure to Logout?')">Logout</a>
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>

<script>
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}
</script>

</body>
</html>
