<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.model.Courseallot" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Profile - Attendance App</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            justify-content: center; /* Center content horizontally */
            align-items: center; /* Center content vertically */
            height: 100vh; /* Full height of the viewport */
            margin: 0;
            background-color: #18c6e2; /* Dark background for the body */
            background-image: url('/images/profile3.jpg'); /* Full-page background image */
            background-size: cover; /* Make the image cover the entire body */
            background-position: center; /* Center the image */
            background-attachment: fixed; /* Ensure the image stays fixed while scrolling */
            animation: fadeInBody 1.5s ease-out; /* Fade-in effect for body */
        }

        /* Fade-in effect for the body */
        @keyframes fadeInBody {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }

        .container {
            width: 100%;
            max-width: 1100px; /* Maximum width of the container */
            padding: 20px;
        }

        .box {
            background-color: rgba(227, 237, 240, 0.8); /* Semi-transparent background for cards */
            border: none;
            border-radius: 10px;
            padding: 25px; /* Increased padding for better spacing */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            position: relative;
            z-index: 1; /* Ensure card stays above the image */
            margin-bottom: 20px; /* Increased bottom margin */
            animation: fadeInContainer 2s ease-out; /* Fade-in effect for the container */
        }

        /* Fade-in effect for the container */
        @keyframes fadeInContainer {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }

        .btn {
            width: 100%; /* Full-width buttons */
            transition: transform 0.2s ease-in-out; /* Smooth transition for scaling */
        }

        .btn:hover {
            transform: scale(1.05); /* Slightly scale up the button when hovered */
        }

        .card {
            background-color: rgba(227, 237, 240, 0.8); /* Slightly lighter grey for the card */
            border: none; /* Remove default border */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Subtle shadow for depth */
            animation: slideIn 1s ease-out; /* Slide-in effect for courses */
        }

        @keyframes slideIn {
            0% { opacity: 0; transform: translateX(-50px); }
            100% { opacity: 1; transform: translateX(0); }
        }

        /* Optional: Adjustments for mobile responsiveness */
        @media (max-width: 767px) {
            .container {
                padding: 15px;
            }
        }

        /* Card styling for the action buttons */
        .card-actions {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="box">
            <form action="goback">
                <button type="submit" class="btn btn-primary" style="width: 150px;">Go back</button>
            </form><br><br>
            <div class="row">
                <div class="col-md-8">
                    <div class="row">
                        <% 
                        List<Courseallot> courses = (List<Courseallot>) request.getAttribute("list");
                        if (courses != null && !courses.isEmpty()) {
                            for (Courseallot course : courses) { 
                        %>
                            <div class="col-md-6 mb-4">
                                <div class="card text-white bg-success">
                                    <div class="card-header"><h2><%= course.getCourse() %></h2></div> <!-- Course name -->
                                    <div class="card-body">
                                        <h5 class="card-text">Semester: <%= course.getSemester() %></h5>
                                        <h5 class="card-text">Subject: <%= course.getSubject() %></h5> <!-- Additional details if available -->
                                    </div>
                                </div>
                            </div>
                        <% 
                            } 
                        } else { 
                        %>
                            <div class="col-12">
                                <div class="alert alert-warning" role="alert">
                                    No courses available.
                                </div>
                            </div>
                        <% 
                        } 
                        %>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card mb-4">
                        <h3 class="text-center">Actions</h3>
                        <div class="card-body card-actions">
                            <form action="teacherclass" method="post" class="mb-3">
                                <button type="submit" class="btn btn-primary">Add Course</button>
                            </form>
                            <form action="teachercoursedelete" method="post" class="mb-3">
                                <button type="submit" class="btn btn-primary">Delete Course</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
