<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fetch Attendance Record</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            display: flex;
            height: 100vh;
            margin: 0;
            background-color: #343a40; /* Dark grey background */
            background-image: url('/images/profile3.jpg'); /* Full-page background image */
            background-size: cover; /* Make the image cover the entire body */
            background-position: center; /* Center the image */
            background-attachment: fixed; /* Ensure the image stays fixed while scrolling */
            justify-content: center; /* Center content horizontally */
            align-items: center; /* Center content vertically */
            color: white; /* White text color for contrast */
            animation: fadeInBody 1.5s ease-out; /* Fade-in effect for body */
        }

        /* Fade-in effect for body */
        @keyframes fadeInBody {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }

        .container {
            background-color: rgba(227, 237, 240, 0.8); /* Semi-transparent background for the form card */
            border-radius: 10px;
            padding: 30px; /* Padding for better spacing */
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.5); /* Shadow effect for depth */
            position: relative;
            max-width: 600px; /* Set max width for cards */
            width: 100%;
            animation: slideInContainer 1.5s ease-out; /* Slide-in effect for form container */
        }

        /* Slide-in effect for form container */
        @keyframes slideInContainer {
            0% { opacity: 0; transform: translateY(50px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        .form-control {
            background-color: rgba(227, 237, 240, 0.8); /* Darker input background */
            border: none; /* Remove border */
            color: black; /* Input text color */
            transition: box-shadow 0.3s ease-in-out; /* Smooth focus transition */
        }

        .form-control:focus {
            background-color: rgba(227, 237, 240, 0.8); /* Darker input background */
            color: black; /* Keep text color white on focus */
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.5); /* Blue glow effect on focus */
        }

        .btn-primary {
            background-color: #007bff; /* Primary button color */
            border-color: #007bff; /* Button border color */
            transition: transform 0.3s ease, background-color 0.3s ease; /* Button hover transition */
        }

        .btn-primary:hover {
            background-color: #0056b3; /* Darker blue on hover */
            border-color: #004085; /* Match border color on hover */
            transform: scale(1.05); /* Slight scale-up effect on hover */
        }

        h1 {
            text-align: center; /* Centered title */
            color: #fff;
            animation: fadeInHeader 1.5s ease-out; /* Fade-in effect for header */
        }

        /* Fade-in effect for header */
        @keyframes fadeInHeader {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }

        .form-group {
            margin-bottom: 15px; /* Spacing between form elements */
        }

        label {
            color: black; /* Label text color */
        }
    </style>
</head>
<body>
    <div class="container">
        <form action="fetch" method="get" class="mt-3">
        
            <div class="form-group">
                <label for="date">Select Date:</label>
                <input style="color:black" type="date" name="date" class="form-control" id="date" required>
            </div>
            <br>
            <div class="form-group">
                <label for="subject">Select Subject:</label>
                <select id="subject" name="subject" class="form-control" required>
                    <option value="">Select a course</option>
                    <%
                        List<String> list = (List<String>) request.getAttribute("list");
                        for (String subject : list) {
                    %>
                        <option  value="<%= subject %>"><%= subject %></option>
                    <%
                        }
                    %>
                </select>
            </div>
            <br>
            <button type="submit" class="btn btn-primary btn-block">View</button>
        </form>
    </div>

    <!-- Optional JavaScript; choose one of the two! -->
    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
