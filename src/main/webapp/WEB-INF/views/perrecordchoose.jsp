<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.example.demo.model.Subjects"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Course Registration</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
    display: flex;
    height: 100vh;
    margin: 0;
    background-color: #18c6e2; /* Dark background for the body */
    background-image: url('/images/profile3.jpg'); /* Full-page background image */
    background-size: cover; /* Make the image cover the entire body */
    background-position: center; /* Center the image */
    background-attachment: fixed; /* Ensure the image stays fixed while scrolling */
    justify-content: center; /* Center content horizontally */
    align-items: center; /* Center content vertically */
}

 .container {
	margin-top: 50px; /* Spacing from the top */
	background-color: rgba(255, 255, 255, 0.3); /* Container background */
	padding: 40px; /* Inner padding */
	border-radius: 10px; /* Rounded corners */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Subtle shadow for depth */
}

.form-control {
	background-color: rgba(255, 255, 255, 0.3);  /* Darker input background */
	border: none; /* Remove border */
	color: black; /* White text in input fields */
}

.btn-primary {
	background-color: #007bff; /* Default Bootstrap blue */
	border-color: #007bff; /* Button border color */
}

.btn-primary:hover {
	background-color: #0056b3; /* Darker blue on hover */
	border-color: #004085; /* Match border color on hover */
}
</style>
</head>
<body>
	<div class="container">
		<form action="gobackst">
			<button type="submit" class="btn btn-primary" style="width: 150px;">Go
				back</button>
		</form>
		<hr>

		<form action="perrecord" method="post">


			<div class="form-group">
				<label for="subject">Subject:</label>
				 <select id="subject"
					name="subject" class="form-control" required>
										<option value="">Select subject</option>
					
					<%List<Subjects> list  = (List<Subjects>)request.getAttribute("list"); %>
					<%
                        for(Subjects sub:list)
                        {
                        	%>
					<option value="<%=sub.getSubname()%>"><%=sub.getSubname()%></option>
					<%
                        }
                        %>


				</select>
			</div>
			<button type="submit" class="btn btn-primary">View</button>
	</div>



	</form>
	</div>

	<!-- Bootstrap JS and dependencies (optional) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
