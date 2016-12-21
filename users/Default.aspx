<%@ Page Title="Customer Panal - Onine Banking" Language="C#" MasterPageFile="~/MasterPageCust.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="users_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="mainHolder">
    <div class="mainDetails">
        <%
            int CustId = Convert.ToInt32(Session["Cust_Id"]);
        %>
        <h4 class="heading">Account Statement</h4>
        <table>
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Naration</th>
                    <th>Cheque/Ref.No.</th>
                    <th>Withdrawal</th>
                    <th>Deposit</th>
                    <th>Closing Balance</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ArrayList TransList = Transactions.GetAllTrns_ByCustId(CustId);
                    foreach (Transactions Trans in TransList)
                    {
                        DateTime TranDT = Convert.ToDateTime(Trans.Tr_Data);
                        string TranDate = TranDT.ToString("dd/MM/yyyy");
                %>
                <tr>
                    <td><% Response.Write(TranDate); %></td>
                    <td><% Response.Write(Trans.Tr_Nartn); %></td>
                    <td><% Response.Write(Trans.Tr_ChqRefNo); %></td>
                    <td><% Response.Write(Trans.Tr_WithdAmt); %></td>
                    <td><% Response.Write(Trans.Tr_DpoAmt); %></td>
                    <td><% Response.Write(Trans.Tr_Blnc); %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <br />
    </div>
</div>
</asp:Content>

