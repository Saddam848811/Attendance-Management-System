<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.demo.model.Student"%>
<%@ page import="java.util.List"%>

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
        height: 100vh;
        background-image: url('/images/profile3.jpg'); /* Full-page background image */
        background-size: cover; /* Make the image cover the entire body */
        background-attachment: fixed; /* Ensure the image stays fixed while scrolling */
        animation: fadeInBody 1s ease-in-out; /* Fade-in animation for body */
    }

    @keyframes fadeInBody {
        0% { opacity: 0; }
        100% { opacity: 1; }
    }

    .container {
        background-color: rgba(227, 237, 240, 0.8); /* Semi-transparent background for cards */
        border: none;
        border-radius: 10px;
        padding: 30px; /* More padding to ensure content has space */
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Subtle shadow for depth */
        position: relative;
        z-index: 1; /* Ensure container stays above the background image */
        max-width: 900px; /* Increased max width */
        width: 100%; /* Ensures the container doesn’t stretch too far */
        box-sizing: border-box; /* Ensures padding is included in the container's total width */
        min-height: 80%; /* Ensures the container takes enough height */
        animation: slideInContainer 1.5s ease-out; /* Slide-in effect for the container */
    }

    @keyframes slideInContainer {
        0% { opacity: 0; transform: translateX(-50px); }
        100% { opacity: 1; transform: translateX(0); }
    }

    h1 {
        color: red;
        margin-bottom: 20px; /* Add space between the message and the form */
        text-align: center; /* Center align the message */
        animation: fadeInHeader 2s ease-out; /* Fade-in animation for the header */
    }

    @keyframes fadeInHeader {
        0% { opacity: 0; transform: translateY(-10px); }
        100% { opacity: 1; transform: translateY(0); }
    }

    /* Ensure the "Go back" button is properly centered and visible */
    form button {
        width: 150px;
        margin: 0 auto;
        display: block; /* Center the button within the form */
        transition: transform 0.3s ease; /* Smooth transition for button */
        animation: fadeInButton 1.5s ease-out; /* Fade-in animation for the button */
    }

    @keyframes fadeInButton {
        0% { opacity: 0; transform: translateY(20px); }
        100% { opacity: 1; transform: translateY(0); }
    }

    .card {
        background-color: #6c757d; /* Darker card background */
        border: none; /* Remove border */
        margin-bottom: 20px; /* Spacing between cards */
        transition: transform 0.2s ease; /* Smooth transition effect */
        animation: fadeInCard 1.5s ease-out; /* Fade-in effect for cards */
    }

    @keyframes fadeInCard {
        0% { opacity: 0; transform: translateY(20px); }
        100% { opacity: 1; transform: translateY(0); }
    }

    .card:hover {
        transform: scale(1.05); /* Slightly enlarge card on hover */
    }

    .card-header {
        background-color: #007bff; /* Header color */
        color: white; /* Header text color */
        font-weight: bold; /* Bold text */
    }

    .form-check {
        margin: 0 10px; /* Margin for inline checkboxes */
        transition: background-color 0.2s; /* Transition for checkbox background */
    }

    .form-check-input:checked + .form-check-label {
        background-color: #28a745; /* Change background when checked */
        color: white; /* Change text color when checked */
        transition: background-color 0.2s, color 0.2s; /* Smooth transition for checked state */
    }

    .btn-primary {
        background-color: #28a745; /* Green button color */
        border-color: #28a745; /* Border color */
        transition: background-color 0.3s ease, transform 0.3s ease; /* Smooth button transition */
    }

    .btn-primary:hover {
        background-color: #218838; /* Darker green on hover */
        transform: scale(1.05); /* Slight scale-up effect on hover */
    }

    /* Optional: Increase space for the "Logout" button and the message */
    h1 {
        margin-top: 10px; /* Ensure there's space for the message */
    }

    .form-group {
        animation: fadeInFormGroup 2s ease-out; /* Fade-in for form group */
    }

    @keyframes fadeInFormGroup {
        0% { opacity: 0; transform: translateX(-30px); }
        100% { opacity: 1; transform: translateX(0); }
    }
</style>
<script>
function toggleAttendance(rollNo) {
    const presentCheckbox = document.getElementById(`present-${rollNo}`);
    const absentCheckbox = document.getElementById(`absent-${rollNo}`);

    if (presentCheckbox.checked) {
        absentCheckbox.checked = false;
    } else if (absentCheckbox.checked) {
        presentCheckbox.checked = false;
    }
}
</script>
</head>
<body>
<div class="container">

    <!-- Displaying the message at the top, with proper spacing -->
    <h1>${msg}</h1>

    <!-- Go Back Button -->
    <form action="goback">
        <button type="submit" class="btn btn-primary" style="width: 150px;">Go back</button>
    </form>

    <br>

    <%
    List<String> list = (List<String>) request.getAttribute("list");
    List<Student> studentsList = (List<Student>) request.getAttribute("students");
    %>

    <form action="attendancesubmit" method="post">
        <div class="form-group">
            <label for="date">Select Date:</label>
            <input type="date" name="date" class="form-control" id="date" required>
        </div>
        <div>
            <div class="form-group">
                <label for="subject">Select Subject:</label>
                <select id="subject" name="subject" class="form-control" required>
                    <option value="">Select a subject</option>
                    <%
                    if (list != null) {
                        for (String li : list) {
                    %>
                    <option value="<%=li%>"><%=li%></option>
                    <%
                        }
                    }
                    %>
                </select>
            </div>
        </div>
        <br>
        
        <div class="row">
            <%
            if (studentsList != null && !studentsList.isEmpty()) {
                for (Student student : studentsList) {
            %>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        <%=student.getName()%> (Roll No: <%=student.getRollno()%>)
                    </div>
                    <div class="card-body text-center">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox"
                                   id="present-<%=student.getRollno()%>" name="attendance"
                                   value="<%=student.getRollno()%>:present"
                                   onclick="toggleAttendance('<%=student.getRollno()%>')">
                            <label class="form-check-label">Present</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox"
                                   id="absent-<%=student.getRollno()%>" name="attendance"
                                   value="<%=student.getRollno()%>:absent"
                                   onclick="toggleAttendance('<%=student.getRollno()%>')">
                            <label class="form-check-label">Absent</label>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            } else {
            %>
            <div class="col-12 text-center">
                <div class="alert alert-warning" role="alert">No students registered for this course.</div>
            </div>
            <%
            }
            %>
        </div>

        <button type="submit" class="btn btn-primary mt-3 btn-block">Submit Attendance</button>
    </form>
</div>

<!-- Bootstrap JS and dependencies (optional) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
