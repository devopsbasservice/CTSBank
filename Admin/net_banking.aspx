<%@ Page Title="Net Banking - Online Banking" Language="C#" MasterPageFile="~/MasterPageFrAdmin.master" AutoEventWireup="true" CodeFile="net_banking.aspx.cs" Inherits="Admin_net_banking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="AdminHolder">
<div class="AdminDetails">
    <asp:Panel ID="Panel1" runat="server">
    <h4 class="heading">Net Banking Customers</h4>
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
                ArrayList NBFullReqsLists = NetBanking.GetFull_NBReqs();
                foreach (NetBanking reqs in NBFullReqsLists)
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
    </asp:Panel>

    <asp:Panel ID="Panel2" runat="server">
    <h4 class="heading">Net Banking</h4>
    <% 
        string cust_id = Request.QueryString["cust_id"];
        Customers CustDataById = Customers.GetCust_DataById(Convert.ToInt32(cust_id));
        NetBanking NBCustDataById = NetBanking.NBData_ByCustId(Convert.ToInt32(cust_id));

        string NBStatus = "";
        if (NBCustDataById.NB_Status == "0")
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
                <td>Req No. :</td>
                <td><% Response.Write(NBCustDataById.NB_Id_2); %></td>
            </tr>
            <tr>
                <td>Customer Name :</td>
                <td><strong><% Response.Write(CustDataById.Cust_Name_2); %></strong></td>
            </tr>
            <tr>
                <td>Mobile No. :</td>
                <td><% Response.Write(CustDataById.Cust_Mobile_2); %></td>
            </tr>
            <tr>
                <td>Account No. :</td>
                <td><% Response.Write(CustDataById.Cust_AcNo); %></td>
            </tr>
            <tr>
                <td>Account Balance :</td>
                <td><% Response.Write(CustDataById.Cust_AcBlnc); %>/- INR</td>
            </tr>
            <tr>
                <td>Password :</td>
                <td><% Response.Write(NBCustDataById.NB_Pass); %></td>
            </tr>
            <tr>
                <td>Status :</td>
                <td><% Response.Write(NBStatus); %></td>
            </tr>
        </tbody>
    </table>
        <br />
        <asp:Button ID="ButtonAllowNB" runat="server" Text="Allow Net Banking" onclick="ButtonAllowNB_Click" />
    </asp:Panel>
</div>
</div>
</asp:Content>