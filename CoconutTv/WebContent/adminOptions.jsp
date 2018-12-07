<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon" href="WebImages/logo.png">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link href="./adminOptions.css" rel="stylesheet" type="text/css">
<title>Admin Options</title>
</head>
<body>

<div class="container-fluid">
		<div class="page-header">
			<h1> Administrator Options <br><br> </h1>
		</div>
		
		<div class="row">
 			<div class="col-sm-3 ">
 				
 			</div>
 			
 			
  			<div class="col-sm-6 ">
 				
 				<a href="./adminAddMovie.jsp" class="admin"> Add Movie </a> &nbsp;&nbsp;&nbsp;
 				<a href="./adminDeleteMovie.jsp" class="admin"> Delete Movie </a> <br><br><br><br>
 				
 			<form class="form-horizontal" action="subTableAdmin.jsp" method="post">
	  			<div class="form-group">
	   				<label class="control-label col-sm-2" for="tablename">Table Name:</label>
	    			<div class="col-sm-8">
	     			<input type="text" class="form-control" id="tablename" name="tablename" placeholder="Enter table name" maxlength="45">
	   				</div>
	  			</div>
	  			
	 			
			</form> 
 				
 				<br><br>
 				<a href="./welcome.jsp" class="admin1"> Exit </a>
 				
 			</div>
 			
 			
  			<div class="col-sm-3 ">
 				
 			</div>
		</div>
	
	
	
	
	</div>


<!-- Add three links here, one to the admin subTableAdmin, one to a form to add a movie and another to enter a movie and have it deleted from the database -->

</body>
</html>