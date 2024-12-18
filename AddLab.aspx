<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddLab.aspx.cs" Inherits="schedule.AddLab" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Lab</title>
    <style>
     body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #121212;
    color: #ffffff;
}

/* Container */
.container {
    max-width: 600px;
    margin: 40px auto;
    padding: 25px;
    background-color: #1e1e1e;
    border-radius: 10px;
    box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.5);
}

/* Headings */
h2, .box h2 {
    text-align: center;
    color: #007bff;
    font-size: 24px;
    margin-bottom: 20px;
}

/* Content Styling */
.content {
    padding: 20px;
    text-align: center;
}

/* Box Styling */
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

/* Box Paragraphs */
.box p {
    margin-bottom: 15px;
    font-size: 1.1em;
}

/* List inside Box */
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

/* Hover Effect for Box */
.box:hover {
    transform: scale(1.02);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    box-shadow: 0 6px 12px rgba(0, 123, 255, 0.5), 0 10px 30px rgba(0, 0, 0, 0.6);
}

/* Form Elements */
label {
    font-weight: bold;
    display: block;
    margin-bottom: 8px;
    color: #cccccc;
}

input[type="text"], select {
    width: 100%;
    padding: 10px;
    border: 1px solid #444;
    border-radius: 5px;
    background-color: #2a2a2a;
    color: #ffffff;
    margin-bottom: 15px;
    font-size: 14px;
}

input[type="text"]::placeholder {
    color: #aaaaaa;
}

/* Buttons */
button, .asp-button {
    width: 100%;
    padding: 12px;
    background-color: #007bff;
    color: white;
    font-weight: bold;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    margin-top: 10px;
}

button:hover, .asp-button:hover {
    background-color: #0056b3;
}

/* Table Styling */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    background-color: #1e1e1e;
    color: #ffffff;
}

th, td {
    border: 1px solid #444;
    padding: 10px;
    text-align: left;
}

th {
    background-color: #2a2a2a;
    font-weight: bold;
}

/* Navbar Styling */
.navbar {
    background-color: #1e1e1e;
    display: flex;
    justify-content: center;
    align-items: center;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
    border-radius: 50px;
    margin: 20px auto;
    width: 90%;
    overflow: hidden;
    border: 2px solid #007bff;
}

/* Navbar Links */
.navbar a {
    display: inline-block;
    color: #ffffff;
    text-align: center;
    padding: 12px 20px;
    text-decoration: none;
    font-size: 16px;
    transition: all 0.3s ease;
    border-radius: 25px;
    margin: 5px;
}

/* Navbar Hover Effect */
.navbar a:hover {
    background-color: #007bff;
    color: #ffffff;
    box-shadow: 0 4px 8px rgba(0, 123, 255, 0.5);
    transform: translateY(-3px);
}

/* Active Navbar Link */
.navbar a.active {
    background-color: #007bff;
    color: #ffffff;
    font-weight: bold;
    box-shadow: 0 4px 8px rgba(0, 123, 255, 0.7);
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
            <h2>Add Lab</h2>

            <label for="txtLabName">Lab Name:</label>
            <asp:TextBox ID="txtLabName" runat="server" placeholder="Enter Lab Name"></asp:TextBox>

            <label for="ddlLocation">Location:</label>
            <asp:DropDownList ID="ddlLocation" runat="server">
                <asp:ListItem Text="Select Location" Value="" />
                <asp:ListItem Text="PKC" Value="PKC" />
                <asp:ListItem Text="Main Block" Value="Main Block" />
                <asp:ListItem Text="Education Block" Value="Education Block" />
            </asp:DropDownList>

            <label for="ddlTools">Tools:</label>
            <asp:DropDownList ID="ddlTools" runat="server">
                <asp:ListItem Text="Select Tool" Value="" />
                <asp:ListItem Text="Visual Studio" Value="Visual Studio" />
                <asp:ListItem Text="Eclipse" Value="Eclipse" />
                <asp:ListItem Text="PyCharm" Value="PyCharm" />
                <asp:ListItem Text="NetBeans" Value="NetBeans" />
            </asp:DropDownList>

            <asp:Button ID="btnAddLab" runat="server" CssClass="asp-button" Text="Add Lab" OnClick="btnAddLab_Click" />

            <asp:GridView ID="gvLabs" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="LabName" HeaderText="Lab Name" />
                    <asp:BoundField DataField="Location" HeaderText="Location" />
                    <asp:BoundField DataField="Tools" HeaderText="Tools" />
                </Columns>
            </asp:GridView>

            <asp:Button ID="btnSubmit" runat="server" CssClass="asp-button" Text="Submit" OnClick="btnSubmit_Click" />
        </div>
    </form>
</body>
</html>
