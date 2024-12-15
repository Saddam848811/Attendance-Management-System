<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Course Registration</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
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

   .container {
	margin-top: 50px; /* Spacing from the top */
	background-color: rgba(255, 255, 255, 0.3); /* Container background */
	padding: 40px; /* Inner padding */
	border-radius: 10px; /* Rounded corners */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Subtle shadow for depth */
}

.form-control {
	background-color: rgba(255, 255, 255, 0.3); /* Container background */
	border: none; /* Remove border */
	color: black; /* White text in input fields */
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
		<form action="teachercourse">
			<button type="submit" class="btn btn-primary" style="width: 150px;">Go
				back</button>
		</form>
		<hr>
		<h2 style="color: #ff0000; text-shadow: 2px 2px 5px black;">${msgr}</h2>
<h2 style="color: #16d84d; text-shadow: 2px 2px 5px black;">${msgg}</h2>

		<form action="teachercoursedeletechoose" method="post">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label style="color:black"for="course"></label> <select id="course"
							name="course" class="form-control" required
							onchange="updateSemesters()">
							<option  style="color:black" value="">Select a course</option>
							<option value="mca">MCA</option>
							<option value="bca">BCA</option>
							<option value="bba">BBA</option>
							<option value="mba">MBA</option>
						</select>
					</div>

					<div class="col-md-6">
						<h3>Semesters :</h3>
						<div id="semester-options" class="form-group">
							<!-- Semester radio buttons will be dynamically populated here -->
						</div>
					</div>
				</div>

				<div class="form-group">
					<label style="color:black" for="subject"></label> <select id="subject"
						name="subject" class="form-control" required>
						<option style="color:black" value="">Select a subject</option>
					</select>
				</div>
			</div>



			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>

	<!-- Bootstrap JS and dependencies (optional) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script>
    const subjectsByCourse = {
        mca: {
            1: ["Java", "Mathematics-I", "Computer Organization", "Digital Logic", "Data Structures"],
            2: ["Operating Systems", "Software Engineering", "Mathematics-II", "Database Management Systems", "Computer Networks"],
            3: ["Web Technologies", "Data Mining", "Mobile Application Development", "Object-Oriented Programming", "Theory of Computation"],
            4: ["Cloud Computing", "Cyber Security", "Big Data Analytics", "Artificial Intelligence", "Project Management"]
        },
        bca: {
            1: ["Introduction to Programming", "Mathematics-I", "Computer Fundamentals", "Web Designing", "English Communication"],
            2: ["Data Structures", "Mathematics-II", "Database Management Systems", "Software Engineering", "Computer Networks"],
            3: ["Object-Oriented Programming", "Operating Systems", "Web Technologies", "Mobile Application Development", "Digital Marketing"],
            4: ["Cloud Computing", "E-Commerce", "Cyber Security", "Data Mining", "Project Work"],
            5: ["Advanced Web Development", "Data Analytics", "Software Testing", "Information Systems", "Mobile App Development"],
            6: ["Artificial Intelligence", "Internet of Things", "Blockchain Technology", "Advanced Database Management", "Capstone Project"]
        },
        bba: {
            1: ["Principles of Management", "Business Mathematics", "Financial Accounting", "Business Communication", "Microeconomics"],
            2: ["Marketing Management", "Business Statistics", "Organizational Behavior", "Management Information Systems", "Macroeconomics"],
            3: ["Human Resource Management", "Production and Operations Management", "Business Law", "Research Methods", "Strategic Management"],
            4: ["Financial Management", "Consumer Behavior", "International Business", "Entrepreneurship Development", "Ethics in Business"],
            5: ["Digital Marketing", "Business Analytics", "Project Management", "Supply Chain Management", "Corporate Governance"],
            6: ["Business Strategy", "E-Business", "Business Research Project", "Advanced Financial Management", "Elective Subject"]
        },
        mba: {
            1: ["Management Concepts", "Quantitative Techniques", "Accounting for Managers", "Organizational Behavior", "Managerial Economics"],
            2: ["Marketing Management", "Financial Management", "Human Resource Management", "Operations Management", "Business Research Methods"],
            3: ["Strategic Management", "Entrepreneurship Development", "International Business", "Project Management", "Business Ethics"],
            4: ["Supply Chain Management", "Digital Marketing", "Business Analytics", "Advanced Financial Management", "Elective Subject"]
        }
    };

    function updateSemesters() {
        const course = document.getElementById('course').value;
        const semesterOptions = document.getElementById('semester-options');
        const subjectSelect = document.getElementById('subject');

        // Clear previous semester options
        semesterOptions.innerHTML = '';
        subjectSelect.innerHTML = '<option value="">Select a subject</option>';
        subjectSelect.disabled = true;

        let semesterCount = (course === 'bca' || course === 'bba') ? 6 : 4;

        // Generate semester radio buttons based on semesterCount
        for (let i = 1; i <= semesterCount; i++) {
            const label = document.createElement('label');
            label.classList.add('ml-3');

            const radio = document.createElement('input');
            radio.type = 'radio';
            radio.name = 'semester';
            radio.value = i;
            radio.required = true;
            radio.onclick = () => updateSubjects(course, i); // Update subjects on radio click

            // Determine suffix for the semester
            let suffix = (i == 1 ? 'st' : (i == 2 ? 'nd' : (i == 3 ? 'rd' : 'th')));

            // Set label text to display semester correctly without "Semester"
            label.appendChild(radio);
            label.appendChild(document.createTextNode(`${i}${suffix}`)); // Only the number and suffix

            semesterOptions.appendChild(label);
        }
    }

    function updateSubjects(course, semester) {
        const subjectSelect = document.getElementById('subject');

        // Clear previous subjects
        subjectSelect.innerHTML = '<option value="">Select a subject</option>';
        subjectSelect.disabled = false;

        // Populate subjects based on course and semester
        const subjects = subjectsByCourse[course][semester] || [];
        subjects.forEach(subject => {
            const option = document.createElement('option');

            // Set the value and display text for the option
            // Use the subject as is, no change in capitalization or spacing
            const value = subject; // Do not change the subject

            option.value = value;  // Set the value to the subject (exactly as it is)
            option.textContent = subject;  // Display original subject name (with spaces and capitalization)

            subjectSelect.appendChild(option);
        });
    }


</script>

</body>
</html>
