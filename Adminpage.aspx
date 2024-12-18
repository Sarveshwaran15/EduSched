<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminpage.aspx.cs" Inherits="schedule.Adminpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
   <style>
    /* Styling for the entire page */
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #121212;
        color: #ffffff;
    }

    /* Styling for the navigation bar with rounded edges */
    .navbar {
        background-color: #1e1e1e;
        display: flex;
        justify-content: center;
        align-items: center;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
        border-radius: 50px; /* Makes the navbar rounded */
        margin: 20px auto; /* Center the navbar and add space */
        width: 90%; /* Restrict width for better appearance */
        overflow: hidden;
        border: 2px solid #007bff;
    }

    /* Styling for navbar links */
    .navbar a {
        display: inline-block;
        color: #ffffff;
        text-align: center;
        padding: 12px 20px;
        text-decoration: none;
        font-size: 16px;
        transition: all 0.3s ease;
        border-radius: 25px; /* Rounded corners for individual links */
        margin: 5px; /* Add spacing between links */
    }

    /* Hover effect for navbar links */
    .navbar a:hover {
        background-color: #007bff;
        color: #ffffff;
        box-shadow: 0 4px 8px rgba(0, 123, 255, 0.5);
        transform: translateY(-3px); /* Slight lift effect */
    }

    /* Active link styling */
    .navbar a.active {
        background-color: #007bff;
        color: #ffffff;
        font-weight: bold;
        box-shadow: 0 4px 8px rgba(0, 123, 255, 0.7);
    }

    /* Add spacing and alignment for content */
    .content {
        padding: 20px;
        text-align: center;
    }

    /* Styling for the project description */
    .project-description {
        margin-top: 20px;
        font-size: 18px;
        line-height: 1.6;
    }

    .project-description p {
        margin-bottom: 15px;
    }
    /* Styling for the content section */
.content {
    padding: 20px;
    text-align: center;
    font-family: 'Arial', sans-serif;
    color: #ffffff;
}

/* Styling for headings */
.content h1 {
    font-size: 2.5em;
    margin-bottom: 10px;
    color: #007bff;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);
}

/* Styling for the box container */
.box {
    background: #1e1e1e;
    border: 2px solid #007bff;
    border-radius: 15px;
    box-shadow: 0 4px 8px rgba(0, 123, 255, 0.3), 0 6px 20px rgba(0, 0, 0, 0.5);
    padding: 30px;
    margin: 20px auto;
    max-width: 800px;
    text-align: left;
    line-height: 1.8;
    color: #f0f0f0;
}

/* Styling for headings inside the box */
.box h2 {
    text-align: center;
    color: #007bff;
    margin-bottom: 15px;
    font-size: 2em;
    text-transform: uppercase;
}

/* Styling for paragraphs inside the box */
.box p {
    margin-bottom: 15px;
    font-size: 1.1em;
}

/* Styling for the list */
.box ul {
    padding-left: 20px;
    margin-bottom: 15px;
}

.box ul li {
    margin: 10px 0;
    font-size: 1.1em;
    position: relative;
    padding-left: 20px;
    color: #00d9ff;
}

.box ul li::before {
    content: '✔';
    position: absolute;
    left: 0;
    color: #007bff;
    font-weight: bold;
}

/* Add a hover effect for the box */
.box:hover {
    transform: scale(1.02);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    box-shadow: 0 6px 12px rgba(0, 123, 255, 0.5), 0 10px 30px rgba(0, 0, 0, 0.6);
}

</style>

</head>
<body>
    <div class="navbar">
        <a href="AddLab.aspx">Lab Registration Schedule</a>
        <a href="AddLabClaim.aspx">Add Lab Schedule</a>
        <a href="UpdateForm.aspx">Add Class Schedule</a>
        <a href="staffReg.aspx">Staff Registration</a>
        <a href="PrintTimetable.aspx">Class Schedule</a>
        <a href="StaffTimetable.aspx">Staff Schedule</a>
        <a href="Add.aspx">Staff Information</a>
    </div>
    <form id="form1" runat="server">
       <div class="content">
    <h1>Welcome to the Admin Dashboard</h1>
    <p>Your go-to hub for managing and scheduling lab and class timetables, staff registrations, and more.</p>

    <div class="project-description">
        <div class="box">
            <h2>About the Project</h2>
            <p>
                This project is designed to streamline the management of timetables, lab schedules, and staff registrations 
                for educational institutions. It provides an easy-to-use interface to:
            </p>
            <ul>
                <li>Register and manage lab schedules</li>
                <li>Claim and allocate lab rooms for classes</li>
                <li>Add and update class schedules</li>
                <li>Register staff members and assign them to specific schedules</li>
                <li>Print and view class and staff timetables</li>
            </ul>
            <p>
                With this platform, administrators can efficiently oversee the entire scheduling process, ensuring smooth 
                operations within academic institutions.
            </p>
        </div>
    </div>
</div>

    </form>
</body>
</html>