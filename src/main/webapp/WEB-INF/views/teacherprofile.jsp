<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Teacher Profile - Attendance App</title>
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

/* Wrapper for image and profile box */
.wrapper {
    display: flex;
    align-items: stretch; /* Ensure both image and box have equal height */
    justify-content: center; /* Horizontally align the image and box */
    max-width: 90%; /* Maximum width to keep the layout nice on larger screens */
    width: 100%; /* Full width */
    height: 600px;
}

/* Profile Box Styling */
.profile-box {
    position: relative;
    background-color: rgba(255, 255, 255, 0.3); /* Semi-transparent background */
    border-radius: 10px;
    padding: 15px; /* Reduced padding */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.7);
    max-width: 700px; /* Limit width of the profile box */
    width: 100%; /* Ensures it does not exceed max-width */
    margin-left: 20px; /* Space between the image and the profile box */
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    opacity: 0; /* Initially hidden */
    animation: fadeInUp 1s ease-out forwards; /* Animation for the profile box */
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

/* Ensure the image has the same height as the profile box */
.profile-image {
    max-width: 50%; /* Limit the image width to 50% */
    height: 100%; /* Make sure the image height is equal to the box height */
    object-fit: cover; /* Ensures the image fills its container without distortion */
    border-radius: 10px;
    opacity: 0; /* Initially hidden */
    animation: fadeInUp 1s ease-out forwards; /* Animation for the image */
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

/* Hover effect on profile image */
.profile-image:hover {
    transform: scale(1.2); /* Increased zoom on hover */
    box-shadow: 0 0 25px rgba(0, 0, 0, 0.3); /* Stronger shadow on hover */
}

/* Hover effect on profile box */
.profile-box:hover {
    transform: scale(1.1); /* Increased zoom on hover */
    box-shadow: 0 0 25px rgba(0, 0, 0, 0.3); /* Stronger shadow on hover */
}

/* Styling for form elements */
.form-control {
    background-color: #6c757d; /* Darker input background */
    color: white; /* Input text color */
    margin-bottom: 10px; /* Reduced bottom margin */
    transition: background-color 0.3s ease; /* Smooth transition for background color */
}

.form-control:focus {
    background-color: #5a6268; /* Lighter background on focus */
    color: white; /* Keep text color white on focus */
}

/* Button Styles */
.btn-primary {
    width: 100%; /* Full-width button */
    margin-bottom: 15px; /* Reduced margin */
    background-color: #007bff;
    border: none;
    transition: all 0.3s ease;
}

.btn-primary:hover {
    background-color: #0056b3; /* Change to darker blue on hover */
    transform: scale(1.05); /* Slight scale effect on hover */
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.2); /* Add shadow on hover */
}

/* Custom Animation for Heading */
/* Custom Animation for Fade In from Left */
@keyframes slideInFromLeft {
    from {
        opacity: 0;
        transform: translateX(-30px); /* Start from the left */
    }
    to {
        opacity: 1;
        transform: translateX(0); /* End at the original position */
    }
}

/* Apply slideInFromLeft animation to the card */
.card {
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
    animation: slideInFromLeft 1s ease-out forwards; /* Apply slideInFromLeft animation */
}

/* Apply slideInFromLeft animation to profile box and image */
.profile-box, .profile-image {
    animation: slideInFromLeft 1s ease-out forwards; /* Apply the same slideInFromLeft animation */
}

/* Profile Box and Content Responsiveness */
@media (max-width: 768px) {
    .profile-box {
        top: 15%;
        left: 10%;
        right: 10%;
        padding: 10px; /* Reduced padding for smaller screens */
        max-width: 90%; /* Ensures the profile box doesn't stretch too much */
    }

    .card {
        max-width: 100%; /* Cards will take the full width on smaller screens */
    }

    .wrapper {
        flex-direction: column; /* Stack the image and box on top of each other on small screens */
    }

    .profile-box {
        margin-left: 0;
        margin-top: 20px; /* Added space above the profile box on small screens */
    }
}

/* Hover Effects on Cards */
.card:hover {
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.2); /* Add shadow on hover */
    transform: translateY(-5px); /* Lift effect on hover */
    transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth transition */
}

/* Apply universal hover effect */
* {
    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease; /* Smooth transition for zoom and shadow */
}

* :hover {
    transform: scale(1.05); /* Zoom in on hover for all elements */
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.2); /* Apply subtle shadow on hover */
}

</style>
</head>
<body>

<!-- Wrapper for the image and profile box -->
<div class="wrapper">
    <!-- Image on the left side -->
    <img src="/images/profile2.jpeg" alt="Profile Image" class="profile-image">

    <!-- Profile Box -->
    <div class="profile-box">
        <h1 class="text-center my-4">
            Welcome, <span class="text-primary">${name}</span>!
        </h1>
        <form action="index.html">
            <button type="submit" class="btn btn-primary" style="width: 150px;">Log Out</button>
        </form><br>
        <div class="row">
            <div class="col-md-8">
                <!-- Unified Box for Contact and Student Info -->
                <div class="card">
                    <div class="card-header text-center">
                        <h2>Contact Information</h2>
                    </div>
                    <div class="card-body">
                        <p><strong>Email:</strong> <span class="custom-blue">${email}</span></p>
                        <p><strong>Phone No:</strong> <span class="custom-blue">${phoneno}</span></p>
                        <p><strong>Password:</strong> <span class="custom-blue">${password}</span></p>

                        <hr> <!-- Divider between Contact and Student Info -->

                        <h4>Student Information</h4>
                        <p>Total Students in College: <span class="text-primary">${count}</span></p>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <h3>Actions</h3>
                    <form action="takeAttendancechoose" method="post">
                        <button type="submit" class="btn btn-primary mt-3">Take Attendance</button>
                    </form>
                    <form action="fetchrecord" method="post">
                        <button type="submit" class="btn btn-primary mt-3">Fetch Class Records</button>
                    </form>
                    <form action="forperrecordtr" method="post">
                        <button type="submit" class="btn btn-primary mt-3">Fetch Student Records</button>
                    </form>
                    <form action="teachercourse" method="post">
                        <button type="submit" class="btn btn-primary mt-3">View Courses</button>
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
