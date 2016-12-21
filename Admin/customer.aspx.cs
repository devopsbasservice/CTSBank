using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_customer : System.Web.UI.Page
{
    protected void ChckCustId()
    {
        string CustId = Request.QueryString["CustId"];

        if (CustId != null)
        {
            Customers ChckCust = new Customers();
            bool result = ChckCust.ChckCustById(Convert.ToInt32(CustId));

            if (result != false)
            {
                Panel1.Visible = false;
                Panel2.Visible = true;

                Connection con = new Connection();
                string strConnString = con.GetConnString();
                using (SqlConnection SqlCon = new SqlConnection(strConnString))
                {
                    SqlCommand SqlComm = new SqlCommand("", SqlCon);
                    SqlCon.Open();
                    
                    string query = string.Format("SELECT COUNT(*) FROM account WHERE ac_cid='" + Convert.ToInt32(CustId) + "'");
                    SqlComm.CommandText = query;
                    int ac_result = (int)SqlComm.ExecuteScalar();

                    if (ac_result == 0)
                    {
                        Panel3.Visible = true;
                        Panel2.Visible = false;
                    }
                }
            }
            else
            {
                Panel1.Visible = true;
                Panel2.Visible = false;
            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Panel3.Visible = false;
            ChckCustId();
        }
    }
    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        string CustId = Request.QueryString["CustId"];
        
        Connection con = new Connection();
        string strConnString = con.GetConnString();
        using (SqlConnection SqlCon = new SqlConnection(strConnString))
        {
            SqlCommand SqlComm = new SqlCommand("", SqlCon);
            SqlCon.Open();

            int ac_HolderId = Convert.ToInt32(CustId);
            decimal ac_Blnc = Convert.ToDecimal(TextBoxBlnc.Text);
            string ac_AltDate = DateTime.Now.ToString();

            string query = string.Format("INSERT INTO account(ac_cid, ac_type, ac_blnc, ac_date) VALUES('" + ac_HolderId + "', '" + DropDownListAcType.SelectedValue + "', '" + ac_Blnc + "', '" + ac_AltDate + "')");
            SqlComm.CommandText = query;
            SqlComm.ExecuteNonQuery();

            string SetStatus = string.Format("UPDATE cust_details SET c_status='1' WHERE c_id='" + ac_HolderId + "'");
            SqlComm.CommandText = SetStatus;
            SqlComm.ExecuteNonQuery();

            General GetNewCode = new General();
            string ChqRefNo = GetNewCode.GenerateCode();
            string Nartion = "Cash";
            string NowDate = DateTime.Now.ToString();

            string queryFrTrns = string.Format("INSERT INTO transactions(t_cid, t_nartion, t_refNo, t_deposit, t_blnc, t_date) VALUES('" + ac_HolderId + "', '" + Nartion + "', '" + ChqRefNo + "', '" + ac_Blnc + "', '" + ac_Blnc + "', '" + NowDate + "')");
            SqlComm.CommandText = queryFrTrns;
            SqlComm.ExecuteNonQuery();

            Response.Redirect("~/Admin/customer.aspx?CustId="+ CustId + "");
        }
    }
}