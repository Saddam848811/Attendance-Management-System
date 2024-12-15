<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.model.Attendance" %>
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

        table {
            width: 100%; /* Full-width table */
            animation: fadeInTable 1.5s ease-out; /* Fade-in effect for table */
        }

        /* Fade-in effect for table */
        @keyframes fadeInTable {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }

        th, td {
            text-align: center; /* Center align table content */
        }

        tr {
            opacity: 0; /* Initially hide rows */
            animation: fadeInRows 1s ease-out forwards; /* Animation for table rows */
        }

        /* Fade-in effect for rows */
        @keyframes fadeInRows {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }

        tr:nth-child(1) { animation-delay: 0.5s; }
        tr:nth-child(2) { animation-delay: 1s; }
        tr:nth-child(3) { animation-delay: 1.5s; }
        /* Add more delays if needed for additional rows */

        button {
            width: 150px;
            animation: fadeInButton 1s ease-out; /* Fade-in effect for button */
        }

        /* Fade-in effect for button */
        @keyframes fadeInButton {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }

        /* Button hover effect */
        button:hover {
            transform: scale(1.05); /* Scale up the button slightly on hover */
            transition: transform 0.2s ease-in-out; /* Smooth transition for scaling */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 style="color:black" class="text-center">{<%= request.getAttribute("date") %>}</h1>

        <form action="goback">
            <button type="submit" class="btn btn-primary">Go back</button>
        </form>

        <table class="table table-dark table-striped mt-3">
            <thead>
                <tr>
                    <th>Roll No</th>
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
                        <td><%= attendance.getRollno() %></td>
                        <td><%= attendance.getStatus() %></td>
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
    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
