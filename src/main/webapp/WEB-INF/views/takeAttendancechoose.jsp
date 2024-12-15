<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.model.Courseallot" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Attendance</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Body and background */
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
            animation: fadeInBody 1s ease-in-out; /* Faster fade-in body */
        }

        /* Fade-in animation for body */
        @keyframes fadeInBody {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }

        /* Form and container styles */
        .container {
            background-color: rgba(227, 237, 240, 0.8); /* Semi-transparent background for cards */
            border: none;
            border-radius: 10px;
            padding: 15px; /* Reduced padding */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            position: relative;
            z-index: 1; /* Ensure card stays above the image */
            margin-bottom: 15px; /* Reduced bottom margin */
            max-width: 600px; /* Set max width for cards */
            width: 100%; /* Ensures cards don’t stretch too far */
            animation: fadeInContainer 1s ease-in-out; /* Faster fade-in animation for the container */
        }

        /* Fade-in animation for the container */
        @keyframes fadeInContainer {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        /* Form control styles */
        .form-control {
            background-color: #6c757d; /* Darker input background */
            border: none; /* Remove border */
            color: white; /* White text in input fields */
            transition: background-color 0.2s ease; /* Faster background transition */
        }

        .form-control:focus {
            background-color: white; /* Light green on focus */
            box-shadow: 0 0 5px rgba(40, 167, 69, 0.5); /* Green focus shadow */
        }

        /* Button styles */
        .btn-primary {
            background-color: #007bff; /* Default Bootstrap blue */
            border-color: #007bff; /* Button border color */
            transition: background-color 0.2s ease; /* Faster transition for hover */
        }

        .btn-primary:hover {
            background-color: #0056b3; /* Darker blue on hover */
            border-color: #004085; /* Match border color on hover */
            transform: scale(1.05); /* Slight scaling effect */
        }

        /* Card header hover effect */
        .card-header {
            transition: background-color 0.2s ease, transform 0.2s ease; /* Faster header hover effect */
        }

        .card-header:hover {
            background-color: #007bff; /* Change header background color on hover */
            transform: translateY(-5px); /* Slight upward movement on hover */
        }

        /* Smooth transition for form elements */
        .form-check-input {
            transition: transform 0.2s ease; /* Faster checkbox transition */
        }

        .form-check-input:checked {
            transform: scale(1.2); /* Slight enlargement when checked */
        }

        /* Animation for page title */
        h3 {
            animation: slideInTitle 1s ease-out; /* Faster slide-in effect for the title */
        }

        @keyframes slideInTitle {
            0% { transform: translateX(-50%); opacity: 0; }
            100% { transform: translateX(0); opacity: 1; }
        }

        /* Animation for form submission button */
        .btn-block {
            animation: fadeInButton 1.5s ease-out; /* Faster fade-in effect for the submit button */
        }

        @keyframes fadeInButton {
            0% { opacity: 0; transform: scale(0.8); }
            100% { opacity: 1; transform: scale(1); }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Go Back Button -->
        <form action="goback">
            <button type="submit" class="btn btn-primary" style="width: 150px;">Go back</button>
        </form>

        <!-- Main Form -->
        <form action="takeAttendance" method="post">
            <hr>
            <h3 class="text-center">Select Course & Semester</h3>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="course">Course:</label>
                        <select id="course" name="course" class="form-control" required>
                            <option value="">Select a course</option>
                            <%
                                List<String> list = (List<String>) request.getAttribute("list");
                                List<String> list1 = (List<String>) request.getAttribute("list1");

                            for (String course : list) {
                            %>
                                <option value="<%= course %>"><%= course %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <h3>Semester:</h3>
                    <div class="form-group">
                        <%
                            for (String semester : list1) {
                        %>
                            <label>
                                <input type="radio" name="semester" value="<%= semester %>" required>
                                <%= semester %>
                            </label>
                            <br>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-primary mt-3 btn-block">Take Attendance</button>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies (optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
