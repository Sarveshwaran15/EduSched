<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateForm.aspx.cs" Inherits="schedule.UpdateForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
      body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #121212;
            color: #ffffff;
        }
   .container {
        background-color: #1f1f1f; /* Darker container background */
        border-radius: 8px;
        padding: 20px;
    
    }
    h2 {
        color: #f0f0f0;
        font-weight: bold;
        margin-bottom: 25px;
    }
    label {
        font-size: 1.1rem;
        color: #d1d1d1;
    }
    .form-control {
        background-color:#121212;
        border: 1px solid #555;
        color: white;
    }
    .form-control:focus {
        background-color:#121212;
        border-color: #007bff;
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        color:white;
    }
    .btn {
        padding: 10px 20px;
        font-size: 1rem;
        border-radius: 5px;
    }
    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
    }
    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #0056b3;
    }
    .btn-secondary {
        background-color: #6c757d;
        border-color: #6c757d;
    }
    .btn-secondary:hover {
        background-color: #5a6268;
        border-color: #545b62;
    }
    .btn-info {
        background-color: #17a2b8;
        border-color: #17a2b8;
    }
    .btn-info:hover {
        background-color: #138496;
        border-color: #117a8b;
    }
    .mt-3 {
        margin-top: 15px;
    }
    .form-group {
        margin-bottom: 15px;
    }
    .form-group select,
    .form-group input {
        border-radius: 5px;
    }
    .form-group button {
        margin-top: 15px;
    }
    .form-group label {
        font-weight: 500;
    }
    .form-group .dropdown-toggle::after {
        filter: invert(1);
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
        <div class="container mt-5">
            

            <h2>Enter Class Schedule</h2>

            <div class="form-group">
                <label for="ddlYear">Year</label>
                <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Year" Value=""></asp:ListItem>
                    <asp:ListItem Text="1st Year" Value="1st Year"></asp:ListItem>
                    <asp:ListItem Text="2nd Year" Value="2nd Year"></asp:ListItem>
                    <asp:ListItem Text="3rd Year" Value="3rd Year"></asp:ListItem>
                    <asp:ListItem Text="4th Year" Value="4th Year"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Day Selection -->
            <div class="form-group">
                <label for="ddlDay">Day</label>
                <asp:DropDownList ID="ddlDay" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Day" Value=""></asp:ListItem>
                    <asp:ListItem Text="Monday" Value="Monday"></asp:ListItem>
                    <asp:ListItem Text="Tuesday" Value="Tuesday"></asp:ListItem>
                    <asp:ListItem Text="Wednesday" Value="Wednesday"></asp:ListItem>
                    <asp:ListItem Text="Thursday" Value="Thursday"></asp:ListItem>
                    <asp:ListItem Text="Friday" Value="Friday"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="ddlClass">Class</label>
                <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
                    <asp:ListItem Text="Select Class" Value=""></asp:ListItem>
                    <asp:ListItem Text="BCA A" Value="BCA A"></asp:ListItem>
                    <asp:ListItem Text="BCA B" Value="BCA B"></asp:ListItem>
                    <asp:ListItem Text="BCA C" Value="BCA C"></asp:ListItem>
                    <asp:ListItem Text="MCA A" Value="MCA A"></asp:ListItem>
                    <asp:ListItem Text="MCA B" Value="MCA B"></asp:ListItem>
                    <asp:ListItem Text="MCA C" Value="MCA C"></asp:ListItem>
                    <asp:ListItem Text="B.Tech CS A" Value="B.Tech CS A"></asp:ListItem>
                    <asp:ListItem Text="B.Tech CS B" Value="B.Tech CS B"></asp:ListItem>
                    <asp:ListItem Text="B.Tech CS C" Value="B.Tech CS C"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Shift Selection (for BCA only) -->
            <div class="form-group" id="shiftField" runat="server" visible="false">
                <label for="ddlShift">Shift</label>
                <asp:DropDownList ID="ddlShift" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlShift_SelectedIndexChanged">
                    <asp:ListItem Text="Select Shift" Value=""></asp:ListItem>
                    <asp:ListItem Text="Shift 1" Value="Shift 1"></asp:ListItem>
                    <asp:ListItem Text="Shift 2" Value="Shift 2"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Shift 1 Timings -->
            <div class="form-group" id="shift1Timings" runat="server" visible="false">
                <label for="ddlShift1Timing">Shift 1 Timing</label>
                <asp:DropDownList ID="ddlShift1Timing" runat="server" CssClass="form-control">
                    <asp:ListItem Text="8:30 - 9:20" Value="8:30 - 9:20"></asp:ListItem>
                    <asp:ListItem Text="9:20 - 10:10" Value="9:20 - 10:10"></asp:ListItem>
                    <asp:ListItem Text="10:10 - 11:00" Value="10:10 - 11:00"></asp:ListItem>
                    <asp:ListItem Text="11:30 - 12:20" Value="11:30 - 12:20"></asp:ListItem>
                    <asp:ListItem Text="12:20 - 1:10" Value="12:20 - 1:10"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <!-- Shift 2 Timings -->
            <div class="form-group" id="shift2Timings" runat="server" visible="false">
                <label for="ddlShift2Timing">Shift 2 Timing</label>
                <asp:DropDownList ID="ddlShift2Timing" runat="server" CssClass="form-control">
                    <asp:ListItem Text="11:30 - 12:20" Value="11:30 - 12:20"></asp:ListItem>
                    <asp:ListItem Text="12:20 - 1:10" Value="12:20 - 1:10"></asp:ListItem>
                    <asp:ListItem Text="1:40 - 2:30" Value="1:40 - 2:30"></asp:ListItem>
                    <asp:ListItem Text="2:30 - 3:20" Value="2:30 - 3:20"></asp:ListItem>
                    <asp:ListItem Text="3:20 - 4:10" Value="3:20 - 4:10"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- MCA Timings -->
            <div class="form-group" id="mcaTimings" runat="server" visible="false">
                <label for="ddlMCATiming">MCA Timing</label>
                <asp:DropDownList ID="ddlMCATiming" runat="server" CssClass="form-control">
                    <asp:ListItem Text="8:30 - 9:25" Value="8:30 - 9:25"></asp:ListItem>
                    <asp:ListItem Text="9:25 - 10:20" Value="9:25 - 10:20"></asp:ListItem>
                    <asp:ListItem Text="10:40 - 11:35" Value="10:40 - 11:35"></asp:ListItem>
                    <asp:ListItem Text="11:35 - 12:30" Value="11:35 - 12:30"></asp:ListItem>
                    <asp:ListItem Text="1:15 - 2:10" Value="1:15 - 2:10"></asp:ListItem>
                    <asp:ListItem Text="2:10 - 3:05" Value="2:10 - 3:05"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <!-- B.Tech Timings -->
            <div class="form-group" id="btechTimings" runat="server" visible="false">
                <label for="ddlBTechTiming">B.Tech Timing</label>
                <asp:DropDownList ID="ddlBTechTiming" runat="server" CssClass="form-control">
                    <asp:ListItem Text="8:30 - 9:25" Value="8:30 - 9:25"></asp:ListItem>
                    <asp:ListItem Text="9:25 - 10:20" Value="9:25 - 10:20"></asp:ListItem>
                    <asp:ListItem Text="10:40 - 11:35" Value="10:40 - 11:35"></asp:ListItem>
                    <asp:ListItem Text="11:35 - 12:30" Value="11:35 - 12:30"></asp:ListItem>
                    <asp:ListItem Text="1:15 - 2:10" Value="1:15 - 2:10"></asp:ListItem>
                    <asp:ListItem Text="2:10 - 3:05" Value="2:10 - 3:05"></asp:ListItem>
                    <asp:ListItem Text="3:05 - 4:05" Value="3:05 - 4:05"></asp:ListItem>
                </asp:DropDownList>
            </div>

               <!-- Course Name -->
            <div class="form-group">
                <label for="ddlCourse">Course Name</label>
                <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Course" Value=""></asp:ListItem>
                    <asp:ListItem Text="Introduction to Programming" Value="Introduction to Programming"></asp:ListItem>
                    <asp:ListItem Text="Web Technologies" Value="Web Technologies"></asp:ListItem>
                    <asp:ListItem Text="Data Structures" Value="Data Structures"></asp:ListItem>
                    <asp:ListItem Text="Database Management Systems" Value="Database Management Systems"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="txtSubject">Subject</label>
                <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtTeacher">Teacher</label>
                <asp:TextBox ID="txtTeacher" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtRoom">Room</label>
                <asp:TextBox ID="txtRoom" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

         <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
            <asp:Label ID="lblMessage" runat="server" CssClass="mt-3" ForeColor="Red"></asp:Label>

            <div class="form-group" style="display:none;">
                <asp:Button ID="btnPrintTable" runat="server" Text="Print Timetable" CssClass="btn btn-info" OnClick="btnPrintTable_Click" />
            </div>
        </div>
    </form>
</body>
</html>
