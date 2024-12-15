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
            background-image: url('/images/profile3.jpg'); /* Full-page background image */
            background-size: cover; /* Make the image cover the entire body */
            background-position: center; /* Center the image */
            background-attachment: fixed; /* Ensure the image stays fixed while scrolling */
            justify-content: center; /* Center content horizontally */
            align-items: center; /* Center content vertically */
        }
        
        /* Left side with the background image */
        .left-side {
            flex: 0 0 60%; /* 60% of the screen width */
            height: 740px;
            background-image: url('/images/register.jpg'); /* Your background image */
            background-size: cover;
            background-position: center;
            animation: slideInLeft 1.5s ease-out; /* Animation for sliding in from left */
            transition: transform 0.3s ease, opacity 0.3s ease;
        }

        /* Hover effect for left side */
        .left-side:hover {
            transform: scale(1.05); /* Slight zoom effect on hover */
            opacity: 0.9;
        }

        /* Right side for the form content */
        .right-side {
            flex: 1; /* Remaining 40% */
            padding: 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: rgba(0, 54, 78, 0.85); /* Dark background for the form */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Shadow for depth */
            border-radius: 8px;
            animation: fadeIn 1.5s ease-out; /* Animation for fading in */
            transition: transform 0.3s ease, opacity 0.3s ease;
                        max-width: 600px;
            
        }

        /* Hover effect for right side */
        .right-side:hover {
            transform: scale(1.05); /* Slight zoom effect on hover */
            opacity: 0.95;
        }

        .heading {
            font-size: 2rem;
            font-weight: bold;
            color: white;
            margin-bottom: 20px;
            text-align: center; /* Centered heading */
            animation: fadeInUp 1s ease-out; /* Fade-in effect for the heading */
        }

        .form-control {
            background-color: rgba(227, 237, 240, 0.8); /* Darker input background */
            color: white;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            background-color: #5a6268; /* Lighter background on focus */
            color: white;
            border-color: #007bff; /* Border color on focus */
        }

        .btn-primary {
            width: 100%;
            margin-bottom: 20px;
            background-color: #007bff; /* Button color */
            border-color: #007bff;
            font-weight: bold;
            color: white;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        /* Hover effect for the submit button */
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
            transform: scale(1.05);
        }

        .btn-add-teacher {
            background-color: #007bff;
            border-color: #007bff;
            font-weight: bold;
            color: white;
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-add-teacher:hover {
            background-color: #0056b3;
            border-color: #0056b3;
            transform: scale(1.05);
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
            font-size: 1.1rem;
            color: white;
            text-shadow: 2px 2px 5px black;
        }

        h2 {
            font-size: 1.5rem;
            color: #ff0000;
            text-shadow: 2px 2px 5px black;
        }
    </style>
</head>
<body>
    <!-- Left side for the background image -->
    <div class="left-side">
        <!-- Optional logo or extra content -->
    </div>

    <!-- Right side for the form content -->
    <div class="right-side">
        <div class="heading animate__animated animate__fadeInUp animate__delay-1s">
            <h1 class="my-4 text-white animate__animated animate__fadeIn animate__delay-1.5s">Teacher Register</h1>
        </div>

        <!-- Dynamically display messages only if ${msg} is not empty -->
        <h5>"Enter the Details to Register..."</h5><br>
        <h2>${msg}</h2>

        <!-- Registration Form -->
        <form action="teacherlogin" method="post">
            <div class="form-group">
                <label style="color:white"for="name" class="h6">Name:</label>
                <input type="text" class="form-control mb-3" id="name" name="Name" placeholder="Enter Name" required>
            </div>
            <div class="form-group">
                <label style="color:white" for="email" class="h6">Email:</label>
                <input type="email" class="form-control mb-3" id="email" name="email" placeholder="Enter Email" required>
            </div>
            <div class="form-group">
                <label style="color:white" for="password" class="h6">Password:</label>
                <input type="password" class="form-control mb-3" id="password" name="password" placeholder="Enter Password" required>
            </div>
            <div class="form-group">
                <label style="color:white" for="phoneno" class="h6">Phone Number:</label>
                <input type="number" class="form-control mb-3" id="phoneno" name="phoneno" placeholder="Enter Phone No" required>
            </div>
            <button type="submit" class="btn btn-primary">Register</button>
        </form>

        <!-- Go back button -->
        <div class="text-left mb-4">
            <a href="teacherlogin0" class="btn btn-add-teacher">Login as Teacher</a>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies (optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
