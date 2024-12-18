<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacultyTable.aspx.cs" Inherits="schedule.FacultyTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
     <form id="form1" runat="server">
        <div class="container mt-5">
            <h2>View Class Schedule</h2>

            <!-- Year Selection -->
            <div class="form-group">
                <label for="ddlYear">Year</label>
                <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Year" Value=""></asp:ListItem>
                    <asp:ListItem Text="1st Year" Value="1st Year"></asp:ListItem>
                    <asp:ListItem Text="2nd Year" Value="2nd Year"></asp:ListItem>
                    <asp:ListItem Text="3rd Year" Value="3rd Year"></asp:ListItem>
                </asp:DropDownList>
            </div>

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
                    <asp:ListItem Text="B.Tech CS" Value="B.Tech CS"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Shift Selection (for BCA only) -->
            <div class="form-group" runat="server" id="shiftField" visible="false">
                <label for="ddlShift">Shift</label>
                <asp:DropDownList ID="ddlShift" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Shift" Value=""></asp:ListItem>
                    <asp:ListItem Text="Shift 1" Value="Shift 1"></asp:ListItem>
                    <asp:ListItem Text="Shift 2" Value="Shift 2"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Submit Button -->
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />

            <!-- GridView for displaying the schedule -->
            <asp:GridView ID="gvSchedule" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false" Visible="false">
                <Columns>
                    <asp:BoundField DataField="day" HeaderText="Day" />
                    <asp:BoundField DataField="period_time" HeaderText="Period Time" />
                    <asp:BoundField DataField="course_code" HeaderText="Course Code" />
                    <asp:BoundField DataField="course_name" HeaderText="Course Name" />
                    <asp:BoundField DataField="teacher" HeaderText="Teacher" />
                </Columns>
            </asp:GridView>
        </div>
    </form>

      <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
