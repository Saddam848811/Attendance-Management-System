<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.List" %>
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Fetch Attendance Record</title>
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
}

.form-control {
	background-color: #495057; /* Darker input background */
	color: white; /* Input text color */
}

.form-control:focus {
	background-color: #6c757d; /* Lighter background on focus */
	color: white; /* Keep text color white on focus */
}

.btn-primary {
	background-color: #007bff; /* Primary button color */
	border-color: #007bff; /* Border color */
}
</style>
</head>
<body>
	<div class="container">
		<h1>Fetch Attendance Record</h1>
		<form action="fetch" method="get" class="mt-3">
			<div class="form-group">
				<label for="date">Select Date:</label> <input type="date"
					name="date" class="form-control" id="date" required>
			</div><br>
   <div class="col-md-6">
                    <div class="form-group">
                        <label for="subject">Select Subject:</label>
                        <select id="subject" name="subject" class="form-control" required>
                            <option value="">Select a course</option>
                            <%
                                List<String> list = (List<String>) request.getAttribute("list");

                            for (String subject : list) {
                            %>
                                <option value="<%= subject %>"><%= subject %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div><br>
			<button type="submit" class="btn btn-primary">View</button>
		</form>
	</div>

	<!-- Optional JavaScript; choose one of the two! -->
	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
