using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_add_cust : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        Connection con = new Connection();
        string strConnString = con.GetConnString();
        using (SqlConnection SqlCon = new SqlConnection(strConnString))
        {
            SqlCommand SqlComm = new SqlCommand("", SqlCon);
            SqlCon.Open();

            string req_date = DateTime.Now.ToString();
            string NetBanking = "0";
            string Cust_Status = "0";

            string query = string.Format("INSERT INTO cust_details(c_name, c_gender, c_state, c_city, c_pin, c_email, c_mobNo, c_net_banking, c_status, c_date) VALUES('" + TextBoxCustName.Text + "', '" + DropDownListGender.SelectedValue + "', '" + TextBoxState.Text + "', '" + TextBoxCity.Text + "', '" + TextBoxPin.Text + "', '" + TextBoxEmail.Text + "', '" + TextBoxMobile.Text + "', '" + NetBanking + "', '" + Cust_Status + "', '" + req_date + "')");
            SqlComm.CommandText = query;
            SqlComm.ExecuteNonQuery();

            Response.Redirect("~/Admin/Default.aspx");
        }
    }
}