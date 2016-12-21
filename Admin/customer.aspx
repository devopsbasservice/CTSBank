<%@ Page Title="Customer Details - Online Banking" Language="C#" MasterPageFile="~/MasterPageFrAdmin.master" AutoEventWireup="true" CodeFile="customer.aspx.cs" Inherits="Admin_customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="AdminHolder">
<div class="AdminDetails">
    <asp:Panel ID="Panel1" runat="server">
    <h2>Customer Id does not exists</h2>
    </asp:Panel>

    <asp:Panel ID="Panel2" runat="server">
    <h4 class="heading">Customer Details</h4>
    <% 
        string CustId = Request.QueryString["CustId"];
        Customers CustDataById = Customers.GetCust_DataById(Convert.ToInt32(CustId));

        string status = "";
        if (CustDataById.Cust_status_2 == "0")
        {
            status = "<font color='Red'>Not Active</font>";
        }
        else
        {
            status = "<font color='green'>Active</font>";
        }

        string NBStatus = "";
        if (CustDataById.Cust_NetBank != "1")
        {
            NBStatus = "<font color='Red'>Not Active</font>";
        }
        else
        {
            NBStatus = "<font color='green'>Active</font>";
        }
    %>
    <table>
        <tbody>
            <tr>
                <td class="Label">Customer Name :</td>
                <td><strong><% Response.Write(CustDataById.Cust_Name_2); %></strong></td>
            </tr>
            <tr>
                <td class="Label">Gender :</td>
                <td><% Response.Write(CustDataById.Cust_Gender_2); %></td>
            </tr>
            <tr>
                <td class="Label">State :</td>
                <td><% Response.Write(CustDataById.Cust_State); %></td>
            </tr>
            <tr>
                <td class="Label">City :</td>
                <td><% Response.Write(CustDataById.Cust_City); %></td>
            </tr>
            <tr>
                <td class="Label">PIN :</td>
                <td><% Response.Write(CustDataById.Cust_Pin); %></td>
            </tr>
            <tr>
                <td class="Label">E-Mail ID :</td>
                <td><% Response.Write(CustDataById.Cust_Email); %></td>
            </tr>
            <tr>
                <td class="Label">Mobile No. :</td>
                <td><% Response.Write(CustDataById.Cust_Mobile_2); %></td>
            </tr>
            <tr>
                <td class="Label">Net Banking :</td>
                <td><% Response.Write(NBStatus); %></td>
            </tr>
            <tr>
                <td class="Label">Customer Status :</td>
                <td><% Response.Write(status); %></td>
            </tr>
            <tr>
                <td class="Label">Account No. :</td>
                <td><% Response.Write(CustDataById.Cust_AcNo); %></td>
            </tr>
            <tr>
                <td class="Label">Account Type :</td>
                <td><% Response.Write(CustDataById.Cust_AcType); %></td>
            </tr>
            <tr>
                <td class="Label">Account Balance :</td>
                <td><strong><% Response.Write(CustDataById.Cust_AcBlnc); %></strong>/- INR</td>
            </tr>
        </tbody>
    </table>
    </asp:Panel>

    <asp:Panel ID="Panel3" runat="server">
    <%
        string CustId = Request.QueryString["CustId"];
        Customers CustLightDataById = Customers.GetLight_DataById(Convert.ToInt32(CustId));
    %>
    <h4 class="heading">Allote A/c No.</h4>
    <table id="Table11" cellspacing="8">
       <tbody>
            <tr>
                <td class="Label">Account Holder Name :</td>
                <td><strong><% Response.Write(CustLightDataById.Cust_Name); %></strong></td>
            </tr>
            <tr>
                <td class="Label">Account Type <font color="red">*</font> :</td>
                <td><asp:DropDownList ID="DropDownListAcType" runat="server">
                        <asp:ListItem Value="">Select Type</asp:ListItem>
                        <asp:ListItem Value="Saving Account">Saving Account</asp:ListItem>
                        <asp:ListItem Value="Salary Account">Salary Account</asp:ListItem>
                        <asp:ListItem Value="Current Account">Current Account</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="DropDownListAcType"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="Label">Enter Balance <font color="red">*</font> :</td>
                <td><asp:TextBox ID="TextBoxBlnc" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBoxBlnc"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Number Only" ValidationExpression="^[0-9]*$" ForeColor="Red" ControlToValidate="TextBoxBlnc"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="Label"></td>
                <td><asp:Button ID="ButtonSubmit" runat="server" Text="Submit" onclick="ButtonSubmit_Click" /></td>
            </tr>
        </tbody>
    </table>
    </asp:Panel>
</div>
</div>
</asp:Content>

