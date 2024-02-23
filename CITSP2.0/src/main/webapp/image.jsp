<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<form method="Post" action=image enctype="multipart/form-data">
 
                         <figure>
							<h3>Upload Image</h3>
							<p>
								<img src="images/policemanimage.png" id="output" width="130" height="150"/>
							</p>
							<p>
								<input type="file" accept="image/*" name="image" id="file"  onchange="loadFile(event)" required>
							</p>
							<p>
							<input type="submit" name="signin" id="signin" class="form-submit" value="Submit" />
							</p>
						</figure>
  
</form>
</center>
</body>
</html>