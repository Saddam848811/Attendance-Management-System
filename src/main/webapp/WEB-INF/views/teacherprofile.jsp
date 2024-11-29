<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Teacher Profile - Attendance App</title>
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

.btn {
	width: 100%; /* Full-width buttons */
}
</style>
</head>
<body>


	<div class="container">
		<h1 class="text-center my-4">Teacher Profile</h1>
 <form action="index.html">
        <button type="submit" class="btn btn-primary" style="width: 150px;">Log Out</button>
    </form><br>

		<div class="row">
			<div class="col-md-8">
				<div class="card">
					<div class="card mb-4">
						<div class="card-header text-center">


							<h2>
								Welcome, <span class="text-primary">${name}</span>!
							</h2>
						</div>
					</div>


					<div class="card mb-4">
						<div class="card-header">
							<h3>Contact Information</h3>
						</div>
						<div class="card-body">
							<h5 class="card-title">
								Email: <span class="text-light">${email}</span>
							</h5>
							<h5 class="card-title">
								Phone No: <span class="text-light">${phoneno}</span>
							</h5>
							<h5 class="card-title">
								Password: <span class="text-light">${password}</span>
							</h5>

						</div>
					</div>

					<div class="card mb-4">
						<div class="card-header">
							<h3>Student Information</h3>
						</div>
						<div class="card-body">
							<h5 class="card-title">
								Total Students in College :
								<h1>
									<span class="text-light">${count}</span>
								</h1>
							</h5>
						</div>
					</div>
					<hr>

				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<h3>Actions</h3>
					<form action="takeAttendancechoose" method="post">
						<button type="submit" class="btn btn-primary mt-3">Take
							Attendance</button>
					</form>
					<form action="fetchrecord" method="post">
						<button type="submit" class="btn btn-primary mt-3">Fetch
							Class Records</button>
					</form>
					<form action="forperrecordtr" method="post">
						<button type="submit" class="btn btn-primary mt-3">Fetch
							Student Records</button>
					</form>
					<form action="teachercourse" method="post">
						<button type="submit" class="btn btn-primary mt-3">View
							Courses</button>
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
