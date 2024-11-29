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
            margin-top: 50px; /* Top margin for better spacing */
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
            background-color: #007bff; /* Primary button color */
            border-color: #007bff; /* Border color */
            width: 100%; /* Full-width button */
        }
        .btn-primary:hover {
            background-color: #0056b3; /* Darker blue on hover */
            border-color: #0056b3; /* Match border color on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="mb-4 text-center">Attendance App</h1>
        <h3 class="text-center">Select Your Course/Class</h3>
        <hr>

        <form action="studentlogin" method="post">
            <div class="form-group">
                <label for="course" class="h4">Course:</label>
                <select id="course" name="course" class="form-control" required>
                    <option value="">Select a course</option>
                    <option value="mca">MCA</option>
                    <option value="bca">BCA</option>
                    <option value="bba">BBA</option>
                    <option value="mba">MBA</option>
                </select>
            </div>

            <h4>Semester:</h4>
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

            <button type="submit" class="btn btn-primary mt-3">Submit</button>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
