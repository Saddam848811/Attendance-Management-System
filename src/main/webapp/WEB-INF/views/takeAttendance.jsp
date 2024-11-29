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
    background-color: #343a40; /* Dark grey background */
    color: white; /* White text for contrast */
}

.container {
    margin-top: 50px; /* Top margin for better spacing */
    background-color: #495057; /* Slightly lighter grey for the container */
    border-radius: 10px; /* Rounded corners */
    padding: 20px; /* Inner padding */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Subtle shadow for depth */
}

.card {
    background-color: #6c757d; /* Darker card background */
    border: none; /* Remove border */
    margin-bottom: 20px; /* Spacing between cards */
    transition: transform 0.2s; /* Smooth transition effect */
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
    <h1 class="text-center my-4">Student Attendance</h1>
    <hr>

    <h1 style="color: red">${msg}</h1>
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
