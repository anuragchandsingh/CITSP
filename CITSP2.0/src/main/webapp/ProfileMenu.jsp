<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"
	import="com.citsp.connection.DBConnection"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
    
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css">
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css">
</head>
<body>
    <section style="background-color: #eee;">
        <div class="container py-5">
         
          <div class="row">
            <div class="col-lg-4">
              <div class="card mb-4">
                <div class="card-body text-center">
                  <img src="images/anuragprofessional.jpg" alt="admin_photo"
                    class="rounded-circle img-fluid" style="width: 120px;">
                  <h5 class="my-1">Anurag Chand</h5>
                  <p class="text-muted mb-0">Full Stack Developer</p>
                  <p class="text-muted mb-3">Bhopal, Madhya Pradesh</p>
                  <div class="d-flex justify-content-center mb-6">               
                    <a href="EditProfile.jsp" class="btn btn-outline-primary ms-1">Edit Profile</a>
                     <a href="EditProfile.jsp" class="btn btn-outline-primary ms-1">Change Password</a>
                  </div>
                </div>
              </div>            
            </div>
            <div class="col-lg-8">
              <div class="card mb-4">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0">Name</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">Anurag Chand</p>
                    </div>
                  </div>
                   <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0">Job</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">Admin</p>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0">Email</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">anuragchand@example.com</p>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0">Mobile</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">+91 8409791976</p>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0">Address</p>
                    </div>
                    <div class="col-sm-9">
                      <p class="text-muted mb-0">Bhopal, Madhya Pradesh</p>
                    </div>
                  </div>             
                </div>
              </div>
            </div>
   		 </div>           
              <div class="row">
                <div class="col-md-6">
                  <div class="card mb-6 mb-md-0">
                    <div class="card-body">
                      <p class="mb-4 h4"> Officer Details </p>
                      <p class="mb-1" style="font-size: .77rem;">Web Design</p>
                      
                      <div class="progress rounded" style="height: 5px;">
                        <div class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="80"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      
                      <p class="mt-4 mb-1" style="font-size: .77rem;">Website Markup</p>
                      <div class="progress rounded" style="height: 5px;">
                        <div class="progress-bar" role="progressbar" style="width: 72%" aria-valuenow="72"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="card mb-6 mb-md-0">
                    <div class="card-body">
                      <p class="mb-4 h4">Case Details </p>
                      
                      <p class="mb-1" style="font-size: .77rem;">Web Design</p>
                      <div class="progress rounded" style="height: 5px;">
                        <div class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="80"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      
                      <p class="mt-4 mb-1" style="font-size: .77rem;">Website Markup</p>
                      <div class="progress rounded" style="height: 5px;">
                        <div class="progress-bar" role="progressbar" style="width: 72%" aria-valuenow="72"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>               
                </div>
              </div>
            </div>
         
        </div>
      </section>
</body>
</html>
    