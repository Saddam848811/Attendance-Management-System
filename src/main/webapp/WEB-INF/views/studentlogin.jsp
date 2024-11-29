<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance App</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #343a40; /* Dark gray background */
            color: white; /* White text color for contrast */
        }
        .container {
            border: 1px solid #6c757d; /* Border color */
            border-radius: 5px; /* Rounded corners */
            padding: 20px; /* Padding inside the container */
            background-color: #495057; /* Slightly lighter gray for the container */
        }
        .btn-primary {
            background-color: #007bff; /* Bootstrap primary button color */
            border: none; /* Remove border */
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Attendance App</h1><br>
    <a href="studentregister" class="btn btn-primary">Add Student</a>    <a href="index.html" class="btn btn-primary">Go back</a><br><br><br>
    <br><br><br>
            <h3 style="color: #ff0038">${msg} </h3>
    
    <h2 class="mt-4">Login as a Student</h2>
    <form action="studentprofile" method="post">
        <div class="form-group">
            <label for="rollno">Enter Roll No:</label>
            <input type="text" class="form-control" id="rollno" name="rollno" required>
        </div>
        <div class="form-group">
            <label for="email">Enter Email:</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="password">Enter Password:</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button> <!-- Changed to btn-primary -->
    </form>
</div>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
