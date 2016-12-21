using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class users_user_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Cust_Id"] != null)
            {
                Response.Redirect("~/users/Default.aspx");
            }
        }
    }
    protected void ButtonCustLogin_Click(object sender, EventArgs e)
    {
        string CustID = TextBoxCustId.Text;
        string CustPass = TextBoxPass.Text;

        Customers ChckCustID = new Customers();
        bool ChckCust = ChckCustID.ChckCustById(Convert.ToInt32(CustID));
        bool ChckCustNB = ChckCustID.ChckCustNetBankingById(Convert.ToInt32(CustID));
        bool ChckCustNBSt = ChckCustID.ChckCustNBStById(Convert.ToInt32(CustID));

        if (ChckCust != true)
        {
            LabelError.Text = "You entered wrong customer ID.";
        }
        else if (ChckCustNB != true)
        {
            LabelError.Text = "1st aplly for it.";
        }
        else if (ChckCustNBSt != true)
        {
            LabelError.Text = "Your request stil panding.";
        }
        else
        {
            Connection con = new Connection();
            string strConnString = con.GetConnString();
            using (SqlConnection SqlCon = new SqlConnection(strConnString))
            {
                SqlCommand SqlComm = new SqlCommand("", SqlCon);
                SqlCon.Open();

                string query = string.Format("SELECT nb_pass FROM net_banking WHERE nb_cid='" + Convert.ToInt32(CustID) + "'");
                SqlComm.CommandText = query;
                string dbPass = (String)SqlComm.ExecuteScalar();

                if (dbPass == CustPass)
                {
                    Session["Cust_Id"] = Convert.ToInt32(CustID);
                    Response.Redirect("~/users/Default.aspx");
                }
                else
                {
                    LabelError.Text = "Wrong password.";
                }
            }
        }
    }
}