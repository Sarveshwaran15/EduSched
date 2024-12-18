﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintTimetable.aspx.cs" Inherits="schedule.PrintTimetable" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Print Timetable</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript">
        function toggleShiftDropdown() {
            var selectedClass = document.getElementById('<%= ddlClass.ClientID %>').value;
            var shiftField = document.getElementById('shiftField');
            if (selectedClass.startsWith("BCA")) {
                shiftField.style.display = 'block';
            } else {
                shiftField.style.display = 'none';
            }
        }
    </script>
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
            width: 100%;
            max-width: 100%;
            margin-top: 50px;
        }
        h2 {
            color: #1e90ff;
            text-align: center;
            font-weight: bold;
            margin-bottom: 30px;
        }
        h3 {
            color: #ffffff;
            margin-top: 30px;
        }
        label {
            font-weight: 600;
            color: #ddd;
        }
        .form-control {
            background-color: #333;
            color: white;
            border: 2px solid #444;
            border-radius: 8px;
            
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
        /* White text for dropdown options */
        .form-control option {
            color: #000;
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
            <h2>Print Class Timetable</h2>

            <!-- Class Dropdown -->
            <div class="form-group">
                <label for="ddlClass">Class:</label>
                <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" onchange="toggleShiftDropdown()">
                    <asp:ListItem Text="Select Class" Value=""></asp:ListItem>
                    <asp:ListItem Text="BCA A" Value="BCA A"></asp:ListItem>
                    <asp:ListItem Text="BCA B" Value="BCA B"></asp:ListItem>
                    <asp:ListItem Text="BCA C" Value="BCA C"></asp:ListItem>
                    <asp:ListItem Text="MCA A" Value="MCA A"></asp:ListItem>
                    <asp:ListItem Text="MCA B" Value="MCA B"></asp:ListItem>
                    <asp:ListItem Text="MCA C" Value="MCA C"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Shift Dropdown for BCA -->
            <div id="shiftField" class="form-group" style="display:none;">
                <label for="ddlShift">Shift:</label>
                <asp:DropDownList ID="ddlShift" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Shift" Value=""></asp:ListItem>
                    <asp:ListItem Text="Shift 1" Value="Shift 1"></asp:ListItem>
                    <asp:ListItem Text="Shift 2" Value="Shift 2"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Submit Button -->
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
            </div>

            <!-- Timetable Display -->
            <div id="timetableContainer" runat="server" style="display:none;" class="table-responsive">
                <h3>Timetable</h3>
                <asp:Table ID="tblTimetable" runat="server" CssClass="table table-bordered"></asp:Table>
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
        </div>
    </form>
</body>
</html>
