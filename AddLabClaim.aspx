<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddLabClaim.aspx.cs" Inherits="schedule.AddLabClaim" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" /><style>
    body {
        background-color: #121212; /* Dark background */
        color: #ffffff; /* Light text for contrast */
    }
    /* Styling for the entire page */
     body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
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



    .container {
        background-color: #1f1f1f; /* Darker container background */
        border-radius: 8px;
        padding: 20px;
    }

    .form-control {
        background-color: #333333; /* Dark background for form elements */
        color: #ffffff; /* Light text */
        border: 1px solid #444444; /* Dark border */
    }

    .button, .btn {
        background-color: #444444; /* Dark background for buttons */
        color: #ffffff; /* Light text */
    }

    .btn:hover {
        background-color: #555555; /* Slightly lighter on hover */
    }

    .tool {
        background-color: #444444; /* Dark background for tools */
        color: #ffffff; /* Light text */
    }

    .tool:hover {
        background-color: #555555; /* Slightly lighter on hover */
    }

    .header {
        background-color: #333333; /* Dark background for header */
        color: #ffffff; /* Light text */
    }

    /* Adjust table styles for dark theme */
    table {
        background-color: #222222; /* Dark background for tables */
        color: #ffffff; /* Light text */
    }

    th, td {
        border: 1px solid #444444; /* Dark borders */
    }
    .btn {
    background-color: #007bff; /* Blue background color */
    color: white; /* White text */
    border: 1px solid #007bff; /* Blue border */
    padding: 10px 15px;
    border-radius: 5px;
    cursor: pointer;
    text-align: center;
    font-size: 16px;
    transition: background-color 0.3s ease;
}

.btn:hover {
    background-color: #0056b3; /* Darker blue on hover */
    border-color: #0056b3; /* Darker blue border on hover */
}

</style>

</head>
<body>
     <div class="navbar">
        <a href="AddLab.aspx" >Lab Registration Schedule</a>
        <a href="AddLabClaim.aspx">Add Lab Schedule</a>
        <a href="UpdateForm.aspx">Add Class Schedule</a>
        <a href="staffReg.aspx">Staff Registration</a>
        <a href="PrintTimetable.aspx">Class Schedule</a>
        <a href="StaffTimetable.aspx">Staff Schedule</a>
        <a href="Add.aspx">Staff Information</a>
    </div>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Lab Claim Form</h2>

            <!-- Class Selection -->
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
            <!-- Shift Selection (For BCA only) -->
            <div class="form-group" id="shiftField" runat="server" visible="false">
                <label for="ddlShift">Shift</label>
                <asp:DropDownList ID="ddlShift" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlShift_SelectedIndexChanged">
                    <asp:ListItem Text="Select Shift" Value=""></asp:ListItem>
                    <asp:ListItem Text="Shift 1" Value="Shift 1"></asp:ListItem>
                    <asp:ListItem Text="Shift 2" Value="Shift 2"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Shift Timings -->
            <div class="form-group" id="shift1Timings" runat="server" visible="false">
                <label for="ddlShift1Timing">Shift 1 Timing</label>
                <asp:DropDownList ID="ddlShift1Timing" runat="server" CssClass="form-control">
                    <asp:ListItem Text="8:30 - 9:20 to 9:20 - 10:10" Value="8:30 - 9:20 to 9:20 - 10:10"></asp:ListItem>
                    <asp:ListItem Text="9:20 - 10:10 to 10:10 - 11:00" Value="9:20 - 10:10 to 10:10 - 11:00"></asp:ListItem>
                    <asp:ListItem Text="11:30 - 12:20 to 12:20 - 1:10" Value="11:30 - 12:20 to 12:20 - 1:10"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group" id="shift2Timings" runat="server" visible="false">
                <label for="ddlShift2Timing">Shift 2 Timing</label>
                <asp:DropDownList ID="ddlShift2Timing" runat="server" CssClass="form-control">
                    <asp:ListItem Text="11:30 - 12:20 to 12:20 - 1:10" Value="11:30 - 12:20 to 12:20 - 1:10"></asp:ListItem>
                    <asp:ListItem Text="1:40 - 2:30 to 2:30 - 3:20" Value="1:40 - 2:30 to 2:30 - 3:20"></asp:ListItem>
                    <asp:ListItem Text="2:30 - 3:20 to 3:20 - 4:10" Value="2:30 - 3:20 to 3:20 - 4:10"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- MCA Timings -->
            <div class="form-group" id="mcaTimings" runat="server" visible="false">
                <label for="ddlMCATiming">MCA Timing</label>
                <asp:DropDownList ID="ddlMCATiming" runat="server" CssClass="form-control">
                    <asp:ListItem Text="8:30 - 9:25 to 9:25 - 10:20" Value="8:30 - 9:25 to 9:25 - 10:20"></asp:ListItem>
                    <asp:ListItem Text="10:40 - 11:35 to 11:35 - 12:30" Value="10:40 - 11:35 to 11:35 - 12:30"></asp:ListItem>
                    <asp:ListItem Text="1:15 - 2:10 to 2:10 - 3:05" Value="1:15 - 2:10 to 2:10 - 3:05"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- B.Tech Timings -->
            <div class="form-group" id="btechTimings" runat="server" visible="false">
                <label for="ddlBTechTiming">B.Tech Timing</label>
                <asp:DropDownList ID="ddlBTechTiming" runat="server" CssClass="form-control">
                    <asp:ListItem Text="8:30 - 10:20" Value="8:30 - 10:20"></asp:ListItem>
                    <asp:ListItem Text="10:20 - 12:10" Value="10:20 - 12:10"></asp:ListItem>
                    <asp:ListItem Text="12:10 - 2:00" Value="12:10 - 2:00"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
    <label for="ddlCourse">Course Name</label>
    <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control">
        <asp:ListItem Text="Select Course" Value=""></asp:ListItem>
        <asp:ListItem Text="C Programming Lab" Value="C Programming Lab"></asp:ListItem>
        <asp:ListItem Text="Web Tech Lab" Value="Web Tech Lab"></asp:ListItem>
        <asp:ListItem Text="DS Lab" Value="DS Lab"></asp:ListItem>
        <asp:ListItem Text="DBMS Lab" Value="DBMS Lab"></asp:ListItem>
    </asp:DropDownList>
</div>


            <!-- Find Tools -->
            <div class="form-group">
                <label for="txtTools">Find Tools</label>
                <asp:TextBox ID="txtTools" runat="server" CssClass="form-control" AutoPostBack="True" OnTextChanged="txtTools_TextChanged"></asp:TextBox>
            </div>
            <div id="toolsList" runat="server">
                <!-- Tools List will be displayed here based on the search -->
            </div>

            <!-- Lab Details Section -->
            <div id="labDetails" runat="server" visible="false">
                <h3>Lab Details</h3>
                <p><strong>Lab Name:</strong> <span id="labName" runat="server"></span></p>
                <p><strong>Location:</strong> <span id="labLocation" runat="server"></span></p>
            </div>
            

            <asp:Button ID="btnClaimLab" runat="server" Text="Claim Lab" CssClass="btn btn-primary" OnClick="btnClaimLab_Click" Visible="false" />

            <div class="form-group">
    <label for="txtTeacher">Teacher</label>
    <asp:TextBox ID="txtTeacher" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<asp:Button ID="btnSubmitLabClaim" runat="server" Text="Submit Lab Claim" CssClass="btn" OnClick="btnSubmitLabClaim_Click" />
       <div id="successMessage" runat="server" style="display:none; color: green;">
    <strong>Lab claim submitted successfully!</strong>
</div>

        </div>
    </form>
</body>
     <script>
        function searchTools() {
            var searchText = document.getElementById("txtTools").value;

            if (searchText.length > 0) {
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "AddLabClaim.aspx/GetTools?searchText=" + searchText, true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                xhr.onload = function () {
                    if (xhr.status === 200) {
                        document.getElementById("toolsList").innerHTML = xhr.responseText;
                    }
                };

                xhr.send();
            } else {
                document.getElementById("toolsList").innerHTML = "";
            }
         }

    </script>
</html>
