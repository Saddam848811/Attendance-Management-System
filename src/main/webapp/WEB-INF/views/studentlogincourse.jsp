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
    <h3 class="text-center">Choose Your Courses/Class</h3>
    <hr>

    <form action="studentprofile" method="post">
        <div class="form-group">
            <label for="course">Course:</label>
            <select id="course" name="course" class="form-control" required>
                <option value="">Select a course</option>
                <option value="mca">MCA</option>
                <option value="bca">BCA</option>
                <option value="bba">BBA</option>
                <option value="mba">MBA</option>
            </select>
        </div>

        <h3>Semester:</h3>
        <div class="form-group">
            <div class="form-check">
                <input type="radio" class="form-check-input" name="semester" value="1" required>
                <label class="form-check-label">1st Semester</label>
            </div>
            <div class="form-check">
                <input type="radio" class="form-check-input" name="semester" value="2">
                <label class="form-check-label">2nd Semester</label>
            </div>
            <div class="form-check">
                <input type="radio" class="form-check-input" name="semester" value="3">
                <label class="form-check-label">3rd Semester</label>
            </div>
            <div class="form-check">
                <input type="radio" class="form-check-input" name="semester" value="4">
                <label class="form-check-label">4th Semester</label>
            </div>
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
