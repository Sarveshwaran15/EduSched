<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="schedule.Add" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Staff Schedule</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #121212;
            color: #e0e0e0;
            font-family: Arial, sans-serif;
        }
        .container {
            background-color: #1f1f1f;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            margin-top: 50px;
        }
        h2 {
            color: #1e90ff;
            text-align: center;
            font-weight: bold;
            margin-bottom: 30px;
        }
        label {
            font-weight: 600;
            color: #ddd;
        }
        .form-control {
            background-color: #333;
            color: #fff;
            border: 1px solid #444;
            border-radius: 5px;
            padding: 5px;
        }
        .form-control:focus {
            border-color: #1e90ff;
            background-color: #444;
            color:white;
        }
        .btn-primary {
            background-color: #1e90ff;
            border-color: #1e90ff;
            color: white;
            font-weight: bold;
            padding: 12px;
            border-radius: 8px;
            width: 100%;
            margin-top: 20px;
        }
        .btn-primary:hover {
            background-color: #1c86e4;
            border-color: #1c86e4;
        }
        .table {
            background-color: #333;
            color: #fff;
            border-collapse: separate;
            border-spacing: 0;
            width: 100%;
        }
        .table-bordered {
            border: 1px solid #444;
        }
        .table th, .table td {
            padding: 10px;
            text-align: center;
            border: 1px solid #444;
        }
        .table th {
            background-color: #1e90ff;
        }
        .table td {
            background-color: #444;
        }
        .table-responsive {
            margin-top: 30px;
        }
        .text-danger {
            color: #f44336;
        }
        .form-group {
            margin-bottom: 25px;
        }
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
        <div class="container">
            <h2>Staff Schedule</h2>

            <!-- Staff Dropdown -->
            <div class="form-group">
                <label for="ddlStaff">Select Staff:</label>
                <asp:DropDownList ID="ddlStaff" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>

            <!-- Submit Button -->
            <div class="form-group">
                <asp:Button ID="btnSearch" runat="server" Text="Show Schedule" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
            </div>

            <!-- Schedule Grid -->
            <div class="table-responsive">
                <asp:GridView ID="GridViewSchedule" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
                    <Columns>
                        <asp:BoundField DataField="course_code" HeaderText="Course Code" />
                        <asp:BoundField DataField="course_name" HeaderText="Course Name" />
                        <asp:BoundField DataField="subject" HeaderText="Subject" />
                        <asp:BoundField DataField="day" HeaderText="Day" />
                        <asp:BoundField DataField="period_time" HeaderText="Period Time" />
                        <asp:BoundField DataField="room_number" HeaderText="Room" />
                    </Columns>
                </asp:GridView>
            </div>

            <!-- Total Classes Label -->
            <div class="form-group">
                <asp:Label ID="lblTotalClasses" runat="server" CssClass="text-danger"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
