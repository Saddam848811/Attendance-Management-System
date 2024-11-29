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
            background-color: #343a40; /* Dark gray background */
            color: white; /* White text for contrast */
        }
        .container {
            margin-top: 50px; /* Spacing from the top */
            background-color: #495057; /* Container background */
            padding: 40px; /* Inner padding */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Subtle shadow for depth */
        }
        .form-control {
            background-color: #6c757d; /* Darker input background */
            border: none; /* Remove border */
            color: white; /* White text in input fields */
        }
        .form-control::placeholder {
            color: #ced4da; /* Lighter placeholder text */
        }
        .btn-primary {
            /* Default Bootstrap blue */
        }
        .btn-add-teacher {
            background-color: #007bff; /* Blue color for Add Teacher button */
            border-color: #007bff; /* Match border color */
            margin-bottom: 20px; /* Spacing below the button */
        }
        .btn-add-teacher:hover {
            background-color: #0056b3; /* Darker blue on hover */
            border-color: #004085; /* Match border color on hover */
        }
    </style>
</head>
<body>
    <div class="container text-center">
        <h1 class="my-5">Attendance App</h1>
        
        <a href="teacherlogin0" class="btn btn-primary mb-4">Login as Teacher</a>
        
        <h2 class="my-4">Register for Teacher Account</h2>
        <h3 style="color: #ff0038">${msg} </h3>
        <form action="teacherlogin" method="post">
            <div class="form-group">
                <input type="text" class="form-control mb-3" id="name" name="Name" placeholder="Enter Name" required>
            </div>
            <div class="form-group">
                <input type="email" class="form-control mb-3" id="email" name="email" placeholder="Enter Email" required>
            </div>
            <div class="form-group">
                <input type="password" class="form-control mb-3" id="password" name="password" placeholder="Enter Password" required>
            </div>
            <div class="form-group">
                <input type="number" class="form-control mb-3" id="phoneno" name="phoneno" placeholder="Enter Phone No" required>
            </div>
            <button type="submit" class="btn btn-primary">Register</button>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies (optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
