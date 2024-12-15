<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance App</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Animate.css for animations -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    
    <style>
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
        }

        /* The left side will take up 60% of the screen width and the image will cover it */
        .left-side {
            flex: 0 0 60%; /* 60% of the screen width */
            height: 850px;
            background-image: url('/images/login.avif'); /* Background image */
            background-size: cover; /* Make the image cover the entire container */
            background-position: center;
            animation: slideInLeft 2s ease-out; /* Animation for sliding in from the left */
            transition: transform 0.3s ease; /* Hover effect */
        }

        /* Hover effect for left side */
        .left-side:hover {
            transform: scale(1.05); /* Zoom effect on hover */
        }

        /* The right side will contain the form and other elements */
        .right-side {
            flex: 1; /* The right side will take the remaining 40% */
            padding: 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: #0e87a2; /* Slightly lighter gray */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Shadow for depth */
            border-radius: 0px;
            animation: fadeIn 2s ease-out; /* Animation for fading in */
            max-width: 600px;
            margin: 0 auto;
            transition: transform 0.3s ease; /* Hover effect */
            height:850px;
        }

        /* Hover effect for right side */
        .right-side:hover {
            transform: scale(1.05); /* Zoom effect on hover */
        }

        .heading {
            font-size: 2rem;
            font-weight: bold;
            color: white;
            margin-bottom: 20px;
            text-align: center; /* Center the heading */
            animation: fadeInUp 1s ease-out; /* Fade-in effect for the heading */
        }

        .form-control {
            background-color: rgba(227, 237, 240, 0.8); /* Darker input background */
            color: white; /* Input text color */
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            background-color: #5a6268; /* Lighter background on focus */
            color: white; /* Keep text color white on focus */
            border-color: #007bff; /* Highlighted border on focus */
        }

        .btn-primary {
            width: 100%; /* Full-width button */
            margin-bottom: 20px; /* Spacing below the button */
            background-color: #007bff; /* Primary blue color */
            border-color: #007bff;
            font-weight: bold;
            padding: 15px;
            font-size: 1.1rem;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3; /* Darker blue on hover */
            border-color: #0056b3; /* Darker border on hover */
            transform: scale(1.05); /* Slight zoom effect on hover */
        }

        .btn-add-teacher {
            background-color: #28a745; /* Green color for the "Add Teacher" button */
            border-color: #28a745;
            font-weight: bold;
            color: white;
            width: 100%;
            margin-top: 15px;
            padding: 12px;
            font-size: 1.1rem;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-add-teacher:hover {
            background-color: #218838;
            border-color: #1e7e34;
            transform: scale(1.05); /* Slight zoom effect on hover */
        }

        /* Custom Animation: Slide In from Left */
        @keyframes slideInLeft {
            from {
                transform: translateX(-100%);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        /* Custom Animation: Fade In */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        /* Custom Animation for Heading */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h5 {
            font-size: 1.2rem;
        }

        .message {
            font-size: 1.1rem;
            color: #ff4d4d;
            text-shadow: 2px 2px 5px black;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <!-- Left side for the background image -->
    <div class="left-side">
        <!-- Add logo or image here if needed -->
    </div>

    <!-- Right side for the form content -->
    <div class="right-side">
        <!-- Heading at the top of the right-side div -->
        <div style="margin-top: 100px;"class="heading animate__animated animate__fadeInUp animate__delay-1s">
            <h1>Student Login</h1>
        </div>

        <div class="text-left mb-4">
            <a href="index.html" class="btn btn-primary">Go back</a>
        </div>
        <c:if test="${not empty msg}">
            <div class="alert alert-info">
                ${msg}
            </div>
        </c:if>

        <h5 class="my-4 text-white animate__animated animate__fadeIn animate__delay-1.5s">"Please login to continue"</h5>

        <!-- Login Form -->
        <form action="studentprofile" method="post">
            <div class="form-group">
                <label for="rollno" class="h6">Enter Roll No:</label>
                <input type="text" class="form-control mb-3" id="rollno" name="rollno" required>
            </div>
            <div class="form-group">
                <label for="email" class="h6">Enter Email:</label>
                <input type="email" class="form-control mb-3" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password" class="h6">Enter Password:</label>
                <input type="password" class="form-control mb-3" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
        <h5 style="color:white">"New here, click to create an account"</h5>
        <a href="studentregister" class="btn btn-add-teacher">Add Student</a>
    </div>

    <!-- Bootstrap JS and dependencies (optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
