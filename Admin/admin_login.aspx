<%@ Page Title="Admin Login - Online Banking" Language="C#" MasterPageFile="../MasterPageFrForms.master" AutoEventWireup="true" CodeFile="admin_login.aspx.cs" Inherits="Admin_admin_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="loginForm">
    <h3>Admin Login</h3>
    <table>
        <tr>
            <td>Email Id :</td>
            <td><asp:TextBox ID="TextBoxEmailId" runat="server"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="Please Enter Your Email Id" 
                    ControlToValidate="TextBoxEmailId" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>Password :</td>
            <td><asp:TextBox ID="TextBoxPass" runat="server" TextMode="Password"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="Please Enter Your Password" ControlToValidate="TextBoxPass" 
                    ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button ID="ButtonAdminLogin" runat="server" Text="Login" 
                    onclick="ButtonAdminLogin_Click" /></td>
            <td><asp:Label ID="LabelError" runat="server" ForeColor="Red"></asp:Label></td>
        </tr>
    </table>
</div>
</asp:Content>

