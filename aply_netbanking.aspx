<%@ Page Title="Apply For Net Banking - Online Bank" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="aply_netbanking.aspx.cs" Inherits="aply_netbanking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="mainHolder">
<div class="mainDetails">
    <asp:Panel ID="Panel1" runat="server">
    <h4 class="heading">Apply For Net Banking</h4>
    <table>
        <tbody>
            <tr>
                <td>Customer ID <font color="red">*</font> :</td>
                <td><asp:TextBox ID="TextBoxCustId" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBoxCustId"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Number Only" ValidationExpression="^[0-9]*$" ForeColor="Red" ControlToValidate="TextBoxCustId"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Password <font color="red">*</font> :</td>
                <td><asp:TextBox ID="TextBoxPass" TextMode="Password" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBoxPass"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Confirm Password <font color="red">*</font> :</td>
                <td><asp:TextBox ID="TextBoxConfirmPass" TextMode="Password" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBoxConfirmPass"></asp:RequiredFieldValidator>
                    <small>At least 6 characters.</small>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><asp:Button ID="ButtonSubmit" runat="server" Text="Submit" onclick="ButtonSubmit_Click" /> &nbsp;&nbsp;
                    <asp:Label ID="LabelError" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </tbody>
    </table>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server">
    <h4 class="heading">Request successful submited. We will get in touch with you shortly.</h4>
    </asp:Panel>
</div>
</div>
</asp:Content>

