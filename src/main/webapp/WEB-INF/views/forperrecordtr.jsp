<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

        /* Fade-in effect for the body */
        @keyframes fadeInBody {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }

        .box-container {
            background-color: rgba(227, 237, 240, 0.3); /* Semi-transparent black background for the box */
            border-radius: 15px; /* Rounded corners */
            padding: 30px; /* Padding for content inside the box */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5); /* Shadow effect */
            max-width: 600px; /* Set max-width for the box */
            width: 100%;
            margin: 0 auto; /* Centering the box */
            animation: slideInBox 1s ease-out; /* Slide-in effect for the form box */
        }

        /* Slide-in effect for the form box */
        @keyframes slideInBox {
            0% { opacity: 0; transform: translateY(50px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        h1 {
            text-align: center; /* Centered title */
            color: #fff;
            margin-bottom: 30px; /* Space between title and form */
        }

        .form-control {
            background-color: rgba(227, 237, 240, 0.8); /* Darker input background */
            border: none; /* Remove border */
            color: white; /* Input text color */
            animation: fadeInInput 1.5s ease-out; /* Fade-in effect for input fields */
        }

        /* Fade-in effect for input fields */
        @keyframes fadeInInput {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }

        .form-control:focus {
            background-color: #6c757d; /* Lighter background on focus */
            color: white; /* Keep text color white on focus */
        }

        .btn-primary {
            background-color: #007bff; /* Primary button color */
            border-color: #007bff; /* Button border color */
            transition: transform 0.2s ease-in-out; /* Smooth transition for scaling */
        }

        .btn-primary:hover {
            background-color: #0056b3; /* Darker blue on hover */
            border-color: #004085; /* Match border color on hover */
            transform: scale(1.05); /* Slight scale-up effect on hover */
        }

        .form-group {
            margin-bottom: 15px; /* Spacing between form elements */
        }
    </style>
</head>
<body>
    <div class="box-container">
        <h1>Fetch Attendance Record</h1>
        <form action="forperrecordrolltr" method="get">
            <div class="form-group">
                <label for="rollno">Enter Roll Number:</label>
                <input type="text" name="rollno" class="form-control" id="rollno" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Submit</button>
        </form>
    </div>

    <!-- Optional JavaScript; choose one of the two! -->
    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
