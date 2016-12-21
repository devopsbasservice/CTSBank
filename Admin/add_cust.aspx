<%@ Page Title="Add New Customer" Language="C#" MasterPageFile="~/MasterPageFrAdmin.master" AutoEventWireup="true" CodeFile="add_cust.aspx.cs" Inherits="Admin_add_cust" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="AdminHolder">
<div class="AdminDetails">
    <h4 class="heading">Add New Customer</h4>
    <div class="FormTableOne">
        <table id="Table1" cellspacing="8" runat="server">
            <tbody>
                <tr>
                    <td class="Label">Customer Name <font color="red">*</font> :</td>
                    <td><asp:TextBox ID="TextBoxCustName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBoxCustName"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="Label">Gender <font color="red">*</font> :</td>
                    <td><asp:DropDownList ID="DropDownListGender" runat="server">
                            <asp:ListItem Value="">Select Gender</asp:ListItem>
                            <asp:ListItem Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="F">FeMale</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="DropDownListGender"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="Label">State <font color="red">*</font> :</td>
                    <td><asp:TextBox ID="TextBoxState" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBoxState"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="Label">City <font color="red">*</font> :</td>
                    <td><asp:TextBox ID="TextBoxCity" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBoxCity"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="Label">PIN Code <font color="red">*</font> :</td>
                    <td><asp:TextBox ID="TextBoxPin" MaxLength="6" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBoxPin"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Number Only" ValidationExpression="^[0-9]*$" ForeColor="Red" ControlToValidate="TextBoxPin"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="Label">E-Mail ID <font color="red">*</font> :</td>
                    <td><asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBoxEmail"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invailid Email ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" ControlToValidate="TextBoxEmail"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="Label">Mobile No. <font color="red">*</font> :</td>
                    <td><asp:TextBox ID="TextBoxMobile" MaxLength="11" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBoxMobile"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Number Only" ValidationExpression="^[0-9]*$" ForeColor="Red" ControlToValidate="TextBoxMobile"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="Label"></td>
                    <td><asp:Button ID="ButtonSubmit" runat="server" Text="Submit" onclick="ButtonSubmit_Click" /></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
</div>
</asp:Content>

