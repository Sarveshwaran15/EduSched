<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="staffReg.aspx.cs" Inherits="schedule.staffReg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            background-color: #121212;
            color: #e0e0e0;
            font-family: Arial, sans-serif;
        }
        .container {
            background-color: #1e1e1e;
            padding: 40px;
            margin: 50px auto;
            border-radius: 10px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            max-width: 750px;
        }
        h2 {
            text-align: center;
            color: #1e90ff;
            font-weight: bold;
            margin-bottom: 30px;
        }
        label {
            font-weight: 600;
            color: #ddd;
            margin-bottom: 5px;
        }
        .input-field {
            width: 100%;
            border: 2px solid #1e90ff;
            border-radius: 8px;
            padding: 12px;
            background-color: #333;
            color: #fff;
            outline: none; /* Remove outline */
        }
        .input-field:focus {
            border-color: #1e90ff; /* Keep border color on focus */
        }
        .submit-button {
            background-color: #1e90ff;
            color: #fff;
            font-weight: bold;
            padding: 12px;
            border-radius: 8px;
            border: none;
            width: 100%;
            margin-top: 20px;
            cursor: pointer;
        }
        .submit-button:hover {
            background-color: #1c86e4;
        }
        .gridview {
            width: 100%;
            background-color: #2a2a2a;
            border-collapse: separate;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-spacing: 0;
            border: 1px solid #444;
            color: #fff;
        }
        .gridview th {
            background-color: #1e90ff;
            color: white;
        }
        .gridview tr:nth-child(even) {
            background-color: #333;
        }
        .gridview tr:nth-child(odd) {
            background-color: #444;
        }
        .gridview td {
            padding: 10px;
            text-align: center;
        }
        .gridview th, .gridview td {
            border: 1px solid #444;
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
            <h2>Staff Registration Form</h2>

            <div style="margin-bottom: 15px;">
                <label for="StaffID">Staff ID:</label>
                <asp:TextBox ID="txtStaffID" runat="server" placeholder="Enter Staff ID" class="input-field"></asp:TextBox>
            </div>

            <div style="margin-bottom: 15px;">
                <label for="StaffName">Staff Name:</label>
                <asp:TextBox ID="txtStaffName" runat="server" placeholder="Enter Staff Name" class="input-field"></asp:TextBox>
            </div>

            <div style="margin-bottom: 15px;">
                <label for="Degree">Degree:</label>
                <asp:TextBox ID="txtDegree" runat="server" placeholder="Enter Degree" class="input-field"></asp:TextBox>
            </div>

            <div style="margin-bottom: 15px;">
                <label for="Designation">Designation:</label>
                <asp:DropDownList ID="ddlDesignation" runat="server" class="input-field">
                    <asp:ListItem Text="Select Designation" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Assistant Professor" Value="Assistant Professor"></asp:ListItem>
                    <asp:ListItem Text="Professor" Value="Professor"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div style="margin-bottom: 15px;">
                <label for="Specialization">Specialization:</label>
                <asp:DropDownList ID="ddlSpecialization" runat="server" class="input-field">
                    <asp:ListItem Text="Select Specialization" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Computer Science" Value="Computer Science"></asp:ListItem>
                    <asp:ListItem Text="Mathematics" Value="Mathematics"></asp:ListItem>
                    <asp:ListItem Text="Physics" Value="Physics"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div style="margin-bottom: 15px;">
                <label for="AreaOfInterest">Area of Interest:</label>
                <asp:DropDownList ID="ddlAreaOfInterest" runat="server" class="input-field">
                    <asp:ListItem Text="Select Area of Interest" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Artificial Intelligence" Value="AI"></asp:ListItem>
                    <asp:ListItem Text="Machine Learning" Value="ML"></asp:ListItem>
                    <asp:ListItem Text="Data Science" Value="Data Science"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" class="submit-button" />
            <asp:Button ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click" class="submit-button" />

            <div style="margin-top: 40px;">
                <asp:GridView ID="gvStaffDetails" runat="server" AutoGenerateColumns="false" class="gridview">
                    <Columns>
                        <asp:BoundField DataField="StaffID" HeaderText="Staff ID" />
                        <asp:BoundField DataField="StaffName" HeaderText="Staff Name" />
                        <asp:BoundField DataField="Degree" HeaderText="Degree" />
                        <asp:BoundField DataField="Designation" HeaderText="Designation" />
                        <asp:BoundField DataField="Specialization" HeaderText="Specialization" />
                        <asp:BoundField DataField="AreaOfInterest" HeaderText="Area of Interest" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
