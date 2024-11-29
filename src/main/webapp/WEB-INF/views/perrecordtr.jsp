<%@ page import="java.util.List"%>
<%@ page import="com.example.demo.model.Attendance"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Attendance Records</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	background-color: #343a40; /* Dark grey background */
	color: white; /* White text color for contrast */
}

.container {
	margin-top: 50px; /* Top margin for better spacing */
	background-color: #495057;
	/* Slightly lighter grey for the container */
	border-radius: 10px; /* Rounded corners */
	padding: 20px; /* Inner padding */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Subtle shadow for depth */
}

table {
	width: 100%; /* Full-width table */
}

th, td {
	text-align: center; /* Center align table content */
}
</style>
</head>
<body>
	<div class="container">
		<h1 class="text-center">Attendance History...</h1>
		<h2>${st.name}</h2>
		<div class="container mt-4">
			<div class="row">
				<div class="col-md-6">
					<div class="card text-white bg-success mb-3">
						<div class="card-header">Total Present</div>
						<div class="card-body">
							<h3 class="card-title">${present}/40</h3>
							<h5 class="card-text">Present Percentage:
								${String.format("%.2f", (present / 40.0 * 100))}%</h5>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card text-white bg-danger mb-3">
						<div class="card-header">Total Absent</div>
						<div class="card-body">
							<h3 class="card-title">${absent}/40</h3>
							<h5 class="card-text">Absent Percentage:
								${String.format("%.2f", (absent / 40.0 * 100))}%</h5>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<h1 style="color: #d9534f; font-family: Arial, sans-serif; text-shadow: 0 0 10px black;">💰 Fine Imposed: ₹${fine} 💰</h1>
			<h1 style="color: #d9534f; font-family: Arial, sans-serif; text-shadow: 0 0 10px black;">💰 Total Fine (All Subjects): ₹${tfine} 💰</h1>

		</div>

		<br>
		<form action="goback">
			<button type="submit" class="btn btn-primary" style="width: 150px;">Go
				back</button>
		</form>
		<table class="table table-dark table-striped mt-3">
			<thead>
				<tr>
					<th>Date</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<%
				List<Attendance> list = (List<Attendance>) request.getAttribute("list");
				if (list != null && !list.isEmpty()) {
					for (Attendance attendance : list) {
				%>
				<tr>
					<td><%=attendance.getDate()%></td>
					<!-- Displaying Date -->
					<td><%=attendance.getStatus()%></td>
					<!-- Displaying Status -->
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="2">No records found.</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

	<!-- Optional JavaScript; choose one of the two! -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
