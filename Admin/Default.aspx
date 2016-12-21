<%@ Page Title="Admin Panal - Onine Banking" Language="C#" MasterPageFile="~/MasterPageFrAdmin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="AdminHolder">
<div class="AdminDetails">
    <h4 class="heading">Net Banking Requests</h4>
    <table>
        <thead>
            <tr>
                <th>Req. No.</th>
                <th>Cust. No.</th>
                <th>Req. Date</th>
                <th>Status</th>
                <th>More Details</th>
            </tr>
        </thead>
        <tbody>
            <%
                ArrayList NBReqsLists = NetBanking.GetAll_NBReqs();
                foreach (NetBanking reqs in NBReqsLists)
                {
                    DateTime ReqDT = Convert.ToDateTime(reqs.NB_reqData);
                    string reqDate = ReqDT.ToString("dd/MM/yyyy");

                    string status = "";
                    if (reqs.NB_status == "0")
                    {
                        status = "<font color='Red'>Not Active</font>";
                    }
                    else
                    {
                        status = "<font color='green'>Active</font>";
                    }
            %>
            <tr>
                <td><% Response.Write(reqs.NB_Id); %></td>
                <td><% Response.Write(reqs.NBC_Id); %></td>
                <td><% Response.Write(reqDate); %></td>
                <td><% Response.Write(status); %></td>
                <td><a href="net_banking.aspx?cust_id=<% Response.Write(reqs.NBC_Id); %>">See</a></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
</div>
<div class="AdminHolder">
<div class="AdminDetails">
    <h4 class="heading">Customer Haven't a/c No.</h4>
    <table>
        <thead>
            <tr>
                <th>Cust. No.</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Mobile No.</th>
                <th>Status</th>
                <th>Allote</th>
            </tr>
        </thead>
        <tbody>
            <%
                ArrayList CustListByStatus = Customers.GetAll_CustByStatus();
                foreach (Customers CustsByStatus in CustListByStatus)
                {
                    string CustStatus = "";
                    if (CustsByStatus.Cust_status == "0")
                    {
                        CustStatus = "<font color='Red'>Not Active</font>";
                    }
                    else
                    {
                        CustStatus = "<font color='green'>Active</font>";
                    }
            %>
            <tr>
               <td><% Response.Write(CustsByStatus.Cust_Id); %></td>
               <td><% Response.Write(CustsByStatus.Cust_Name); %></td>
               <td><% Response.Write(CustsByStatus.Cust_Gender); %></td>
               <td><% Response.Write(CustsByStatus.Cust_Mobile); %></td>
               <td><% Response.Write(CustStatus); %></td>
               <td><a href="customer.aspx?CustId=<% Response.Write(CustsByStatus.Cust_Id); %>">A/c No.</a></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
</div>
</asp:Content>

