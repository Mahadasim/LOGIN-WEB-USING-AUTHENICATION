<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegForm.aspx.cs" Inherits="Login.RegForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="reg.css"/>
<link rel="script" href="Reg.js"/>
<link href="ref/bootstrap.min.css" rel="stylesheet"/>
<title>REGISTRATION FORM</title>
<style type="text/css">
    .auto-style1 {
        left: 0px;
        top: 0px;
    }
    .auto-style2{
        font-weight:bold;
        padding-left:30px;
        font-style:italic;
    }
    .auto-style3{
    font-weight:bold;
    position:absolute;
    top:280px;
    right:130px;
    font-style:italic;
    }
</style>
</head>
<body>
    <div>
    <center><h1>REGISTRATION FORM</h1></center>
    </div>
    <form runat="server">
    <div class="container" aria-readonly="True">  
        <div class="label">
        <label>First Name :</label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fname" CssClass="auto-style2" ErrorMessage="First Name is Empty" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        </div>
        <asp:TextBox type="name" runat="server" placeholder="Enter First Name" id="fname"/>
        <div class="label">
        <label aria-readonly="True">Last Name :</label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lname" CssClass="auto-style2" ErrorMessage="Last Name is Empty" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        </div>
        <asp:TextBox type="name" runat="server" placeholder="Enter Last Name" id="lname"/>
        <div class="label">
        <label aria-hidden="False">Email Address : </label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="email" CssClass="auto-style2" ErrorMessage="Email Address is Empty" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        </div>
        <asp:TextBox type="email" runat="server" Textmode="Email" placeholder="xyz@example.com" id="email" CssClass="auto-style1"/>
        <div>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList" CssClass="auto-style3" ErrorMessage="Gender Required" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        </div>
        <div class="label">
        <label>Gender : </label>
        <asp:DropDownList ID="DropDownList" class="table" runat="server">
        <asp:ListItem Enabled="true" Text= "Choose Gender" Value = " "  ></asp:ListItem>
        <asp:ListItem Text= "MALE" Value="MALE"></asp:ListItem>
        <asp:ListItem Text= "FEMALE" Value="FEMALE"></asp:ListItem>
        </asp:DropDownList>
        </div>
        <asp:Button id="Submit" Text="Submit" runat="server" OnClick="Submit_Click"/>
        <asp:Button id="Clear" Text="Clear" runat="server" OnClick="Clear_Click" CausesValidation="false" />
    </div>
    <div>
        <asp:Button id="Cancel" Text="Back To Dashboard" runat="server" OnClick="Cancel_Click" CausesValidation="false"/>
    </div>
    </form>
    </body>
</html>
