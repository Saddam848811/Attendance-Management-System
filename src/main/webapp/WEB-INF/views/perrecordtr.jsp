<%@ page import="java.util.List"%>
<%@ page import="com.example.demo.model.Attendance"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Attendance Records</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
    display: flex;
    justify-content: center; /* Center the content horizontally */
    align-items: flex-start; /* Align items at the top */
    flex-direction: column; /* Stack content vertically */
    margin: 0;
    min-height: 100vh; /* Ensure the body takes at least the full height of the viewport */
    background-color: #18c6e2; /* Dark background for the body */
    background-image: url('/images/profile3.jpg'); /* Full-page background image */
    background-size: cover; /* Make the image cover the entire body */
    background-position: center; /* Center the image */
    background-attachment: fixed; /* Ensure the image stays fixed while scrolling */
    animation: fadeInBody 1.5s ease-out; /* Fade-in effect for body */
}

/* Fade-in effect for the body */
@keyframes fadeInBody {
    0% { opacity: 0; }
    100% { opacity: 1; }
}

.container {
    background-color: rgba(227, 237, 240, 0.8); /* Semi-transparent background for cards */
    border: none;
    border-radius: 10px;
    padding: 25px; /* Increased padding for better spacing */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    position: relative;
    z-index: 1; /* Ensure card stays above the image */
    margin-bottom: 20px; /* Increased bottom margin */
    max-width: 800px; /* Increased max-width for better spacing */
    width: 100%; /* Ensures cards don’t stretch too far */
    animation: fadeInContainer 2s ease-out; /* Fade-in effect for the container */
}

/* Fade-in effect for the container */
@keyframes fadeInContainer {
    0% { opacity: 0; }
    100% { opacity: 1; }
}

h2 {
    text-align: center;
    font-size: 32px; /* Increased font size for heading */
    color: #fff;
    text-shadow: 0 0 10px black; /* Adding text shadow to make heading more visible */
    margin-bottom: 30px; /* Increased margin for better spacing */
}

.table {
    width: 100%; /* Full-width table */
    animation: fadeInTable 2s ease-out; /* Fade-in effect for table */
}

/* Fade-in effect for table */
@keyframes fadeInTable {
    0% { opacity: 0; }
    100% { opacity: 1; }
}

th, td {
    text-align: center; /* Center align table content */
}

/* Slide-in effect for cards (Total Present and Total Absent) */
.card {
    animation: slideIn 1s ease-out; /* Slide-in effect for cards */
}

@keyframes slideIn {
    0% { opacity: 0; transform: translateX(50px); }
    100% { opacity: 1; transform: translateX(0); }
}

button {
    margin-top: 20px; /* Added margin to the button */
    width: 100%; /* Make button span the full width of the container */
    transition: transform 0.2s ease-in-out; /* Smooth transition for scaling */
}

/* Button hover effect */
button:hover {
    transform: scale(1.05); /* Slightly scale up the button when hovered */
}

hr {
    margin-top: 30px; /* Increased margin for better separation */
}

/* Responsive Design for small screens */
@media (max-width: 767px) {
    .container {
        padding: 15px; /* Reduced padding on small screens */
        margin-bottom: 10px; /* Reduced bottom margin */
    }

    .card {
        margin-bottom: 15px; /* Reduced margin for small screens */
    }

    button {
        width: 100%; /* Full-width button for smaller screens */
    }
}
</style>
</head>
<body>
    <div class="container">
        <h2>${st.name}</h2>
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-6">
                    <div class="card text-white bg-success mb-3">
                        <div class="card-header">Total Present</div>
                        <div class="card-body">
                            <h3 class="card-title">${present}/40</h3>
                            <h5 class="card-text">Present Percentage: ${String.format("%.2f", (present / 40.0 * 100))}%</h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card text-white bg-danger mb-3">
                        <div class="card-header">Total Absent</div>
                        <div class="card-body">
                            <h3 class="card-title">${absent}/40</h3>
                            <h5 class="card-text">Absent Percentage: ${String.format("%.2f", (absent / 40.0 * 100))}%</h5>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <h1 style="color: #007bff; font-family: Arial, sans-serif; text-shadow: 0 0 15px yellow, 0 0 25px cyan; background-color: transparent;">💰 Fine Imposed: ₹${fine} 💰</h1>
            <h1 style="color: #007bff; font-family: Arial, sans-serif; text-shadow: 0 0 15px yellow, 0 0 25px cyan; background-color: transparent;">💰 Total Fine (All Subjects): ₹${tfine} 💰</h1>
        </div>

        <form action="goback">
            <button type="submit" class="btn btn-primary">Go Back</button>
        </form>

        <table class="table table-dark table-striped mt-3">
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                List<Attendance> list = (List<Attendance>) request.getAttribute("list");
                if (list != null && !list.isEmpty()) {
                    for (Attendance attendance : list) {
                %>
                <tr>
                    <td><%=attendance.getDate()%></td>
                    <td><%=attendance.getStatus()%></td>
                </tr>
                <%
                }
                } else {
                %>
                <tr>
                    <td colspan="2">No records found.</td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>

    <!-- Optional JavaScript; choose one of the two! -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
