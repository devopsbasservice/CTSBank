<%@ Page Title="All Customers - Online Banking" Language="C#" MasterPageFile="~/MasterPageFrAdmin.master" AutoEventWireup="true" CodeFile="all_custs.aspx.cs" Inherits="Admin_all_custs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="AdminHolder">
<div class="AdminDetails">
    <h4 class="heading">All Customers</h4>
    <table>
        <thead>
            <tr>
                <th>Cust. No.</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Mobile No.</th>
                <th>Status</th>
                <th>More Details</th>
            </tr>
        </thead>
        <tbody>
            <%
                ArrayList CustList = Customers.GetAll_Cust();
                foreach (Customers Custs in CustList)
                {
                    string CustStatus = "";
                    if (Custs.Cust_status == "0")
                    {
                        CustStatus = "<font color='Red'>Not Active</font>";
                    }
                    else
                    {
                        CustStatus = "<font color='green'>Active</font>";
                    }
            %>
            <tr>
               <td><% Response.Write(Custs.Cust_Id); %></td>
               <td><% Response.Write(Custs.Cust_Name); %></td>
               <td><% Response.Write(Custs.Cust_Gender); %></td>
               <td><% Response.Write(Custs.Cust_Mobile); %></td>
               <td><% Response.Write(CustStatus); %></td>
               <td><a href="customer.aspx?CustId=<% Response.Write(Custs.Cust_Id); %>">See</a></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
</div>
</asp:Content>

