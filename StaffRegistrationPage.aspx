<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffRegistrationPage.aspx.cs" Inherits="schedule.StaffRegistrationPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <div style="background-color: #ffffff; padding: 40px; margin: 50px auto; border-radius: 10px; box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1); max-width: 750px;">
    <h2 style="text-align: center; color: #007bff; font-weight: bold; margin-bottom: 30px;">Staff Registration Form</h2>

    <div style="margin-bottom: 15px;">
        <label for="StaffID" style="font-weight: 600; color: #333; margin-bottom: 5px;">Staff ID:</label>
        <asp:TextBox ID="txtStaffID" runat="server" placeholder="Enter Staff ID" style="width: 100%; border: 2px solid #007bff; border-radius: 8px; padding: 12px;"></asp:TextBox>
    </div>

    <div style="margin-bottom: 15px;">
        <label for="StaffName" style="font-weight: 600; color: #333; margin-bottom: 5px;">Staff Name:</label>
        <asp:TextBox ID="txtStaffName" runat="server" placeholder="Enter Staff Name" style="width: 100%; border: 2px solid #007bff; border-radius: 8px; padding: 12px;"></asp:TextBox>
    </div>

    <div style="margin-bottom: 15px;">
        <label for="Degree" style="font-weight: 600; color: #333; margin-bottom: 5px;">Degree:</label>
        <asp:TextBox ID="txtDegree" runat="server" placeholder="Enter Degree" style="width: 100%; border: 2px solid #007bff; border-radius: 8px; padding: 12px;"></asp:TextBox>
    </div>

    <div style="margin-bottom: 15px;">
        <label for="Designation" style="font-weight: 600; color: #333; margin-bottom: 5px;">Designation:</label>
        <asp:DropDownList ID="ddlDesignation" runat="server" style="width: 100%; border: 2px solid #007bff; border-radius: 8px; padding: 12px;">
            <asp:ListItem Text="Select Designation" Value="0"></asp:ListItem>
            <asp:ListItem Text="Assistant Professor" Value="Assistant Professor"></asp:ListItem>
            <asp:ListItem Text="Professor" Value="Professor"></asp:ListItem>
        </asp:DropDownList>
    </div>

    <div style="margin-bottom: 15px;">
        <label for="Specialization" style="font-weight: 600; color: #333; margin-bottom: 5px;">Specialization:</label>
        <asp:DropDownList ID="ddlSpecialization" runat="server" style="width: 100%; border: 2px solid #007bff; border-radius: 8px; padding: 12px;">
            <asp:ListItem Text="Select Specialization" Value="0"></asp:ListItem>
            <asp:ListItem Text="Computer Science" Value="Computer Science"></asp:ListItem>
            <asp:ListItem Text="Mathematics" Value="Mathematics"></asp:ListItem>
            <asp:ListItem Text="Physics" Value="Physics"></asp:ListItem>
        </asp:DropDownList>
    </div>

    <div style="margin-bottom: 15px;">
        <label for="AreaOfInterest" style="font-weight: 600; color: #333; margin-bottom: 5px;">Area of Interest:</label>
        <asp:DropDownList ID="ddlAreaOfInterest" runat="server" style="width: 100%; border: 2px solid #007bff; border-radius: 8px; padding: 12px;">
            <asp:ListItem Text="Select Area of Interest" Value="0"></asp:ListItem>
            <asp:ListItem Text="Artificial Intelligence" Value="AI"></asp:ListItem>
            <asp:ListItem Text="Machine Learning" Value="ML"></asp:ListItem>
            <asp:ListItem Text="Data Science" Value="Data Science"></asp:ListItem>
        </asp:DropDownList>
    </div>

    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" style="background-color: #007bff; color: #fff; font-weight: bold; padding: 12px; border-radius: 8px; border: none; width: 100%; margin-top: 20px; cursor: pointer;" />
    <asp:Button ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click" style="background-color: #007bff; color: #fff; font-weight: bold; padding: 12px; border-radius: 8px; border: none; width: 100%; margin-top: 10px; cursor: pointer;" />

    <div style="margin-top: 40px;">
        <asp:GridView ID="gvStaffDetails" runat="server" AutoGenerateColumns="false" style="width: 100%; background-color: #f8f9fa; border-collapse: separate; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); border-spacing: 0; border: 1px solid #ddd;">
            <Columns>
                <asp:BoundField DataField="StaffID" HeaderText="Staff ID" />
                <asp:BoundField DataField="StaffName" HeaderText="Staff Name" />
                <asp:BoundField DataField="Degree" HeaderText="Degree" />
                <asp:BoundField DataField="Designation" HeaderText="Designation" />
                <asp:BoundField DataField="Specialization" HeaderText="Specialization" />
                <asp:BoundField DataField="AreaOfInterest" HeaderText="Area of Interest" />
            </Columns>
            <HeaderStyle BackColor="#007bff" ForeColor="White" />
            <RowStyle BackColor="#f8f9fa" />
            <AlternatingRowStyle BackColor="#e9ecef" />
        </asp:GridView>
    </div>
</div>

    </form>
</body>
</html>
