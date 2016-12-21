<%@ Page Title="Customer Login - Online Banking" Language="C#" MasterPageFile="~/MasterPageFrForms.master" AutoEventWireup="true" CodeFile="user_login.aspx.cs" Inherits="users_user_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="loginForm">
    <h3>Customer Login</h3>
    <table>
        <tr>
            <td>Customer Id :</td>
            <td><asp:TextBox ID="TextBoxCustId" runat="server"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="Please Enter Your Customer Id" 
                    ControlToValidate="TextBoxCustId" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>Password :</td>
            <td><asp:TextBox ID="TextBoxPass" TextMode="Password" runat="server"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="Please Enter Your Password" ControlToValidate="TextBoxPass" 
                    ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button ID="ButtonCustLogin" runat="server" Text="Login" onclick="ButtonCustLogin_Click" /> &nbsp;&nbsp;
                <asp:Label ID="LabelError" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td></td>
        </tr>
    </table>
</div>
</asp:Content>

