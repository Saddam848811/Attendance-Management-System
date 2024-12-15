<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.model.Courseallot" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Profile - Attendance App</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<style>
/* Apply background and center content */
body {
    display: flex;
    height: 100vh;
    background-image: url('/images/profile3.jpg'); /* Full-page background image */
    background-size: cover; /* Make the image cover the entire body */
    background-position: center; /* Center the image */
    background-attachment: fixed; /* Ensure the image stays fixed while scrolling */
}

/* Styling for the container */
.container {
    margin-top: 50px; /* Top margin for better spacing */
}

/* Styling for the card with all information */
.card {
    background-color: rgba(255, 255, 255, 0.7); /* Slightly transparent white */
    border: none; /* Remove default border */
    border-radius: 10px; /* Rounded corners */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* Subtle shadow */
    opacity: 0; /* Initially hidden */
    animation: slideInFromLeft 1s ease-out forwards; /* Animation applied here */
    transition: transform 0.3s ease-in-out; /* Smooth transition for zoom */
}

/* Slide-in animation from left to right */
@keyframes slideInFromLeft {
    from {
        opacity: 0;
        transform: translateX(-100%); /* Start from left outside of viewport */
    }
    to {
        opacity: 1;
        transform: translateX(0); /* End at normal position */
    }
}

/* General hover zoom effect for any element */
* {
    transition: transform 0.3s ease-in-out; /* Smooth transition for zoom effect */
}

* :hover {
    transform: scale(1.02); /* Zoom in on hover */
}

/* Styling for the text and content */
.card-body .card-title {
    margin-bottom: 10px;
}

.card-header {
    text-align: center;
}

.text-light {
    color: #f8f9fa; /* Light text for contrast */
}

.text-success {
    color: #28a745; /* Success green */
}

.text-danger {
    color: #dc3545; /* Danger red */
}

.row {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}

.col-md-8 {
    flex: 0 0 66.6667%; /* Main content box takes 2/3 of the space */
}

.col-md-4 {
    flex: 0 0 33.3333%; /* Actions box takes 1/3 of the space */
    /* Removed animation from here */
}

.card-header h2, .card-header h4 {
    text-align: center;
}

.card-body h5 {
    margin-bottom: 8px; /* Reduced spacing for compactness */
}

/* Add a smooth hover effect for buttons */
.btn {
    transition: background-color 0.3s ease, transform 0.3s ease-in-out; /* Smooth transition for both background color and zoom */
}

.btn:hover {
    background-color: #0069d9; /* Slight change in color on hover */
    transform: scale(1.1); /* Slight zoom effect on buttons */
}

.text-light {
    color: black; /* Change the text color to black */
}
</style>
</head>
<body>
    <% List<Courseallot> list = (List<Courseallot>)request.getAttribute("list"); %>
    <div class="container">
        <div class="row">
            <!-- Main Content with Personal Info, Class Details, Subjects, and Attendance Stats -->
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h2>Welcome, <span class="text-success">${name}</span>!</h2>
                    </div>
                    <div class="card-body">
                        <!-- Personal Information and Class Details -->
                        <div class="row">
                            <div class="col-md-6">
                                <h3>Personal Information:</h3>
                                <hr>
                               <p><strong>Roll No:</strong> <span style="color: black;">${rollno}</span></p>
                               <p><strong>Email:</strong> <span style="color: black;">${email}</span></p>
                               <p><strong>Password:</strong> <span style="color: black;">${password}</span></p>
                               <p><strong>Phone No:</strong> <span style="color: black;">${phoneno}</span></p>
                            </div>

                            <div class="col-md-6">
                                <h4>Class Details:</h4>
                                <hr>
                                <p><strong>Course:</strong> <span style="color: black;">${course}</span></p>
                                <p><strong>Semester:</strong> <span style="color: black;">${semester}</span></p>
                            </div>
                        </div>

                        <!-- Subjects and Attendance Stats -->
                        <div class="row">
                            <div class="col-md-6">
                                <h4>Subjects:</h4>
                                <hr>
                                <ul class="list-group">
                                    <% for(Courseallot course : list) { %>
                                        <li class="list-group-item bg-dark text-light"><%= course.getSubject() %></li>
                                    <% } %>
                                </ul>
                            </div>

                            <div class="col-md-6">
                                <h4>Attendance Status:</h4>
                                <hr>
                                <div class="row">
                                    <!-- Average Present -->
                                    <div class="col-md-12 mb-3">
                                        <div class="card text-white bg-success">
                                            <div class="card-header">Average Present %</div>
                                            <div class="card-body">
                                                <h3 class="card-title">${present}%</h3>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Average Absent -->
                                    <div class="col-md-12">
                                        <div class="card text-white bg-danger">
                                            <div class="card-header">Average Absent %</div>
                                            <div class="card-body">
                                                <h3 class="card-title">${absent}%</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Actions Panel in a separate box on the right -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        <h3 class="text-center">Actions</h3>
                    </div>
                    <div class="card-body">
                        <form action="perrecordchoose" method="post">
                            <button type="submit" class="btn btn-primary w-100 mb-2">View Attendance</button>
                        </form>
                        <form action="index.html">
                            <button type="submit" class="btn btn-primary w-100">Log Out</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies (optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
