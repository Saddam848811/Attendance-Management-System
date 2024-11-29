<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            background-color: #343a40; /* Dark grey background */
            color: white; /* White text for contrast */
        }
        .container {
            margin-top: 50px; /* Top margin for better spacing */
        }
        .card {
            background-color: #495057; /* Slightly lighter grey for the card */
            border: none; /* Remove default border */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Subtle shadow for depth */
        }
        .btn {
            width: 100%; /* Full-width buttons */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center my-4"> Courses/Classes Alotted</h1>
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
                    <div class="card-body">
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

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
