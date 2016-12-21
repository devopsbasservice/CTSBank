using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class aply_netbanking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Panel2.Visible = false;
        }
    }
    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        int CustID = Convert.ToInt32(TextBoxCustId.Text);

        Customers ChckCustID = new Customers();
        bool ChckCust = ChckCustID.ChckCustById(CustID);
        bool ChckCustNB = ChckCustID.ChckCustNetBankingById(CustID);

        if(ChckCust != true)
        {
            LabelError.Text = "You enter wrong customer ID.";
        }
        else if (ChckCustNB != false)
        {
            LabelError.Text = "You already apply for it.";
        }
        else if (TextBoxPass.Text.Length < 6)
        {
            LabelError.Text = "Your password must be at least 6 characters.";
        }
        else if (TextBoxPass.Text != TextBoxConfirmPass.Text)
        {
            LabelError.Text = "Your confirm password did not match.";
        }
        else
        {
            Connection con = new Connection();
            string strConnString = con.GetConnString();
            using (SqlConnection SqlCon = new SqlConnection(strConnString))
            {
                SqlCommand SqlComm = new SqlCommand("", SqlCon);
                SqlCon.Open();

                string ReqDate = DateTime.Now.ToString();
                string Status = "0";

                string query = string.Format("INSERT INTO net_banking(nb_cid, nb_pass, nb_date, nb_status) VALUES('" + CustID + "', '" + TextBoxPass.Text + "', '" + ReqDate + "', '" + Status + "')");
                SqlComm.CommandText = query;
                SqlComm.ExecuteNonQuery();

                /*string SetStatus = string.Format("UPDATE cust_details SET c_net_banking='1' WHERE c_id='" + CustID + "'");
                SqlComm.CommandText = SetStatus;
                SqlComm.ExecuteNonQuery();*/
            }
            
            Panel1.Visible = false;
            Panel2.Visible = true;
        }
    }
}