<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="mainHolder">
<div class="mainDetails">
    <h4 class="heading">Select Login</h4>
    <p>
    <a href="users/user_login.aspx" target="_blank">Customer Login</a>&nbsp;&nbsp;&nbsp;
    <a href="Admin/admin_login.aspx" target="_blank">Admin Login</a>
    </p>
</div>
</div>
</asp:Content>

