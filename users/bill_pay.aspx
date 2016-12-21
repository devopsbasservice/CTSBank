<%@ Page Title="Bill Pay - Online Banking" Language="C#" MasterPageFile="~/MasterPageCust.master" AutoEventWireup="true" CodeFile="bill_pay.aspx.cs" Inherits="users_bill_pay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="mainHolder">
    <div class="mainDetails">
        <asp:Panel ID="Panel1" runat="server">
        <%
            int CustId = Convert.ToInt32(Session["Cust_Id"]);
            Customers GetCustDataById = Customers.GetCust_DataById(CustId);
        %>
        <h4 class="heading">Bill Pay</h4>
        <table>
            <tbody>
                <tr>
                    <td>Customer ID :</td>
                    <td><strong><% Response.Write(GetCustDataById.Cust_Id_2); %></strong></td>
                </tr>
                <tr>
                    <td>Account Balance :</td>
                    <td><% Response.Write(GetCustDataById.Cust_AcBlnc); %>/- INR</td>
                </tr>
                <tr>
                    <td>Mitter No. <font color="red">*</font> :</td>
                    <td><asp:TextBox ID="TextBoxMitter" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBoxMitter"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Number Only" ValidationExpression="^[0-9]*$" ForeColor="Red" ControlToValidate="TextBoxMitter"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Amount Pay <font color="red">*</font> :</td>
                    <td><asp:TextBox ID="TextBoxAmt" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBoxAmt"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Number Only" ValidationExpression="^[0-9]*$" ForeColor="Red" ControlToValidate="TextBoxAmt"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Button ID="ButtonPayBill" runat="server" Text="Pay Bill" onclick="ButtonPayBill_Click" /> &nbsp;&nbsp;
                        <asp:Label ID="LabelError" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </tbody>
        </table>
        </asp:Panel>
        <br />
        <asp:Panel ID="Panel2" runat="server">
            <h2 style="color: Green;">Your Transaction is successful.</h2>
        </asp:Panel>
    </div>
</div>
</asp:Content>

