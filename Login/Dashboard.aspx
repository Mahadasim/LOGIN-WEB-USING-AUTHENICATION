﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Login.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="dash.css"/>
<link rel="script"/ href="validation.js" />
<link href="content/bootstrap-theme.css" rel="stylesheet"/>
<title>DASHBOARD</title>
<style type="text/css">
.auto-style1 {
    margin-top: 4px;
}
.auto-style2 {
    float: right;
    margin-top: 35px;
    margin-right: 15px;
    width: 249px;
    height: 35px;
}
.auto-style3 {
    left: 190px;
    top: 150px;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid" id="container">
            <center><h1 style="padding-top:10px;">WELCOME TO THE DASHBOARD</h1></center>
        </div>
        <div class="top topnav">
            <div>
                <asp:Button id="Add" class="button" runat="server" Text="ADD USERS" Height="65px" Width="190px" OnClick="Add_Click"/>
            </div>
            <div>
                <asp:Button id="List" class="button" runat="server" Text="LIST USERS" Height="65px" Width="190px" OnClick="List_Click"/>
            </div>
            <div>
                <asp:Button id="logout" class="button" runat="server" Text="LOGOUT" Height="65px" Width="190px" OnClick="logout_Click"/>
            </div>
        </div>
        <div class="auto-style2">
                <asp:TextBox runat="server" id="search" placeholder=" Search by First Name..."></asp:TextBox>
            <asp:Button runat="server" id="search_btn" class="button" Text="Search" CssClass="auto-style1" Height="26px" OnClick="search_btn_Click"/>
        </div>
        <div>
            <asp:GridView runat="server" id="gridview" CellPadding="4" CssClass="auto-style3" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnRowDeleting="gridview_RowDeleting" OnRowUpdating="gridview_RowUpdating">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="ID" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Cus_ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FIRST NAME">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("FIRST_NAME") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="LAST NAME">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("LAST_NAME") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="GENDER">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("GENDER") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="EMAIL ADDRESS">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("EMAIL_ADDRESS") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DATE CREATED">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("DATE_CREATED") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="UPDATE">
                        <ItemTemplate>
                            <asp:ImageButton ID="UpdateBtn" CommandName="Update" runat="server" Height="20px" ImageUrl="~/fonts/icons8-edit.gif"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DELETE">
                        <ItemTemplate>
                            <asp:ImageButton ID="DeleteBtn" CommandName="Delete" OnClientClick="return confirm('Are you sure to Delete?');" runat="server" Height="20px" ImageUrl="~/fonts/icons8-delete-30.png"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
