<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="schedule.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #121212;
            color: #ffffff;
        }
        .login-container {
            background-color: #1e1e1e;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
            width: 320px;
        }
        .login-container h2 {
            margin-bottom: 20px;
            text-align: center;
            font-size: 24px;
            color: #ffffff;
        }
        .login-container label {
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
            color: #ffffff;
        }
        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #444;
            border-radius: 5px;
            background-color: #2c2c2c;
            color: #ffffff;
            outline: none;
        }
        .login-container input[type="text"]::placeholder,
        .login-container input[type="password"]::placeholder {
            color: #888;
        }
        .login-container button,
        .login-container input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .login-container button:hover,
        .login-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: #ff4d4d;
            text-align: center;
            margin-bottom: 10px;
            font-size: 14px;
        }
        .login-container a {
            display: block;
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
            color: #007bff;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .login-container a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Login</h2>
            <asp:Label ID="lblError" runat="server" CssClass="error-message" Visible="false"></asp:Label>
            <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
            <asp:TextBox ID="txtUsername" runat="server" Placeholder="Enter username"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="Enter password"></asp:TextBox>
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="login-button" OnClick="btnLogin_Click" />
            <a href="#">Forgot your password?</a>
        </div>
    </form>
</body>
</html>
