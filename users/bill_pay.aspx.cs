using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class users_bill_pay : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Panel2.Visible = false;
        }
    }
    protected void ButtonPayBill_Click(object sender, EventArgs e)
    {
        int CustId = Convert.ToInt32(Session["Cust_Id"]);

        Customers GetCustDataById = Customers.GetCust_DataById(CustId);
        decimal CurntBlnc = GetCustDataById.Cust_AcBlnc;
        decimal BillPayAmt = Convert.ToDecimal(TextBoxAmt.Text);

        if (BillPayAmt > CurntBlnc)
        {
            LabelError.Text = "Low balance.";
        }
        else
        {
            Connection con = new Connection();
            string strConnString = con.GetConnString();
            using (SqlConnection SqlCon = new SqlConnection(strConnString))
            {
                SqlCommand SqlComm = new SqlCommand("", SqlCon);
                SqlCon.Open();

                string Nartion = "Bill pay MitrNo.-"+ TextBoxMitter.Text;
                string NowDate = DateTime.Now.ToString();

                General GetNewCode = new General();
                string ChqRefNo = GetNewCode.GenerateCode();

                decimal NewBlnc = CurntBlnc - BillPayAmt;

                string queryFrTrns = string.Format("INSERT INTO transactions(t_cid, t_nartion, t_refNo, t_withdrawal, t_blnc, t_date) VALUES('" + CustId + "', '" + Nartion + "', '" + ChqRefNo + "', '" + BillPayAmt + "', '" + NewBlnc + "', '" + NowDate + "')");
                SqlComm.CommandText = queryFrTrns;
                SqlComm.ExecuteNonQuery();

                string SetStatus = string.Format("UPDATE account SET ac_blnc='" + NewBlnc + "' WHERE ac_cid='" + CustId + "'");
                SqlComm.CommandText = SetStatus;
                SqlComm.ExecuteNonQuery();

                Panel1.Visible = false;
                Panel2.Visible = true;
            }
        }
    }
}