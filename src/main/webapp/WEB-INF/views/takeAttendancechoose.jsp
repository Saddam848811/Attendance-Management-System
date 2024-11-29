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
        .btn-primary {
            background-color: #007bff; /* Default Bootstrap blue */
            border-color: #007bff; /* Button border color */
        }
        .btn-primary:hover {
            background-color: #0056b3; /* Darker blue on hover */
            border-color: #004085; /* Match border color on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center mb-4">Student Attendance</h1>
        <form action="goback">
            <button type="submit" class="btn btn-primary" style="width: 150px;">Go back</button>
        </form>
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
