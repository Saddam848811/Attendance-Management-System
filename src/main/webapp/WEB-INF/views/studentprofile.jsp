<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.List" %>
	<%@ page import="com.example.demo.model.Courseallot" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Profile - Attendance App</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #343a40; /* Dark grey background */
	color: white; /* White text for contrast */
}

.container {
	margin-top: 50px; /* Top margin for better spacing */
}

.card {
	background-color: #495057; /* Slightly lighter grey for the card */
	border: none; /* Remove default border */
	border-radius: 10px; /* Rounded corners */
	padding: 20px; /* Inner padding */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Subtle shadow for depth */
}
</style>
</head>
<body>

	<% List<Courseallot> list = (List<Courseallot>)request.getAttribute("list"); %>
	<div class="container">
		<h1 class="text-center my-4">Student Profile</h1>

		<form action="index.html">
			<button type="submit" class="btn btn-primary">Log Out</button>
		</form>
		<br> <br>
		<div class="row">
			<div class="col-md-8">
				<div class="card">
					<div class="card mb-4">

						<div class="card-header text-center">
							<h2>
								Hi, <span class="text-success">${name}</span>!
							</h2>
						</div>
					</div>

					<div class="card mb-4">
						<div class="card-header">
							<h4>Personal Information</h4>
						</div>
						<div class="card-body">
							<h5 class="card-title">
								Roll No: <span class="text-light">${rollno}</span>
							</h5>
							<h5 class="card-title">
								Email: <span class="text-light">${email}</span>
							</h5>
							<h5 class="card-title">
								Password: <span class="text-light">${password}</span>
							</h5>
							<h5 class="card-title">
								Phone No: <span class="text-light">${phoneno}</span>
							</h5>
						</div>
					</div>

					<div class="card mb-4">
						<div class="card-header">
							<h4>Class Details</h4>
						</div>
						<div class="card-body">
							<h5 class="card-title">
								Course: <span class="text-light">${course}</span>
							</h5>
							<h5 class="card-title">
								Semester: <span class="text-light">${semester}</span>
							</h5>
						</div>
					</div>

					<div class="card mb-4">
						<div class="card-header">
							<h4>Subjects</h4>
						</div>
						<div class="card-body">
							<ul class="list-group">
							<% for(Courseallot course : list)
							{  %>
							
							
								<h3><i><li class="list-group-item bg-dark text-light"><%= course.getSubject()%></li></i></h3>

							
							<% }
							

							%>
								
							</ul>
						</div>
					</div>

					<div class="container mt-4">
						<div class="row">
							<div class="col-md-6">
								<div class="card text-white bg-success mb-3">
									<div class="card-header">Average Present %</div>
									<div class="card-body">
										<h3 class="card-title">${present}%</h3>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="card text-white bg-danger mb-3">
									<div class="card-header">Average Absent %</div>
									<div class="card-body">
										<h3 class="card-title">${absent}%</h3>
									</div>
								</div>
							</div>
						</div>
					</div>



					<!-- Add any relevant information about attendance here -->
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<h3>Actions</h3>
					<form action="perrecordchoose" method="post">
						<button type="submit" class="btn btn-primary mt-3">View
							Attendance</button>
					</form>

				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS and dependencies (optional) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
