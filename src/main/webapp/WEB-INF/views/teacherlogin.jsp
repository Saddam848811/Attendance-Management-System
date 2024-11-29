<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance App</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #343a40; /* Dark grey background */
            color: white; /* White text for contrast */
        }
        .container {
            margin-top: 100px; /* Top margin for better spacing */
            background-color: #495057; /* Slightly lighter grey for the container */
            border-radius: 10px; /* Rounded corners */
            padding: 40px; /* Inner padding */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Subtle shadow for depth */
        }
        .form-control {
            background-color: #6c757d; /* Darker input background */
            color: white; /* Input text color */
        }
        .form-control:focus {
            background-color: #5a6268; /* Lighter background on focus */
            color: white; /* Keep text color white on focus */
        }
        .btn-primary {
            width: 100%; /* Full-width button */
            margin-bottom: 20px; /* Spacing below the button */
        }
        .btn-add-teacher {
            background-color: #007bff; /* Same blue color for Add Teacher button */
            border-color: #007bff; /* Match border color */
            font-weight: bold; /* Make text bold */
            color: white; /* Set text color to white */
        }
        .btn-add-teacher:hover {
            background-color: #0056b3; /* Darker blue on hover */
            border-color: #0056b3; /* Match border color on hover */
        }
    </style>
</head>
<body>
    <div class="container text-center">
        <h1 class="mb-4">Attendance App</h1>
        
        <a href="teacherregister" class="btn btn-add-teacher mb-4">Add Teacher</a>   <br><br><br>
        
        <h2 class="my-4">Login as a Teacher</h2>
        <form action="teacherprofile" method="post">
<div class="text-left mb-4">
    <a href="index.html" class="btn btn-add-teacher">Go Back</a>
</div>        <h5 style="color: #ff0038">${msg} </h5>
        
            <div class="form-group">
                <label for="email" class="h6">Email:</label>
                <input type="email" class="form-control mb-3" id="email" name="email" placeholder="Enter email" required>
            </div>
            <div class="form-group">
                <label for="password" class="h6">Password:</label>
                <input type="password" class="form-control mb-3" id="password" name="password" placeholder="Enter password" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies (optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
