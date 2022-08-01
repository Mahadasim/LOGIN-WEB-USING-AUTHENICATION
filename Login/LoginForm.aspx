<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="Login.LoginForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="login.css"/>
    <link rel="script" href="validation.js" />
    <link href="ref/bootstrap.min.css" rel="stylesheet"/>
    <title>LOGIN FORM</title>
</head>
<body>
    <div>
    <center><h1>LOGIN FORM</h1></center>
    </div>
    <form runat="server">
    <div class="container">  
        <div class="label">
        <label aria-readonly="True">Username: </label>
        </div>
        <asp:TextBox type="text" style= "width:90%;" runat="server" placeholder="Enter Username" id="username" required/>
        <div class="label">
        <label aria-readonly="True">Password: </label>
        </div>
        <asp:TextBox type="password" style= "width:90%;" runat="server" Textmode="Password" placeholder="Enter Password" id="password" required/>
        <asp:Button id="Submit" Text="LOGIN" runat="server" OnClick="Submit_Click"/>
    </div>
    </form>
    </body>
</html>
