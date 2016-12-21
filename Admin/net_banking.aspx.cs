using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_net_banking : System.Web.UI.Page
{
    protected void ChckCustId()
    {
        string cust_id = Request.QueryString["cust_id"];

        if (cust_id != null)
        {
            Customers ChckCust = new Customers();
            bool result = ChckCust.ChckCustById(Convert.ToInt32(cust_id));
            bool CustNb = ChckCust.ChckCustNetBankingById(Convert.ToInt32(cust_id));

            if (result != false)
            {
                if (CustNb != false)
                {
                    Panel2.Visible = true;
                    Panel1.Visible = false;
                    NetBanking NBCustDataById = NetBanking.NBData_ByCustId(Convert.ToInt32(cust_id));

                    if (NBCustDataById.NB_Status == "1")
                    {
                        ButtonAllowNB.Visible = false;
                    }
                }
                else
                {
                    Panel1.Visible = true;
                }
            }
            else
            {
                Panel1.Visible = true;
            }
        }
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Panel2.Visible = false;
            ChckCustId();
        }
    }
    protected void ButtonAllowNB_Click(object sender, EventArgs e)
    {
        int CustID = Convert.ToInt32(Request.QueryString["cust_id"]);

        Connection con = new Connection();
        string strConnString = con.GetConnString();
        using (SqlConnection SqlCon = new SqlConnection(strConnString))
        {
            SqlCommand SqlComm = new SqlCommand("", SqlCon);
            SqlCon.Open();

            string query = string.Format("UPDATE net_banking SET nb_status='1' WHERE nb_cid='" + CustID + "'");
            SqlComm.CommandText = query;
            SqlComm.ExecuteNonQuery();

            string SetStatus = string.Format("UPDATE cust_details SET c_net_banking='1' WHERE c_id='" + CustID + "'");
            SqlComm.CommandText = SetStatus;
            SqlComm.ExecuteNonQuery();

            Response.Redirect("~/Admin/net_banking.aspx?cust_id=" + CustID + "");
        }
    }
}