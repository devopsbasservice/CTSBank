using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_admin_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["id"] != null)
            {
                Response.Redirect("~/Admin/Default.aspx");
            }
        }
    }
    protected void ButtonAdminLogin_Click(object sender, EventArgs e)
    {
        string adminEmail = TextBoxEmailId.Text;
        string adminPass = TextBoxPass.Text;

        Connection con = new Connection();
        string strConnString = con.GetConnString();

        using (SqlConnection SqlCon = new SqlConnection(strConnString))
        {
            SqlCommand SqlComm = new SqlCommand("", SqlCon);
            SqlCon.Open();

            string query = string.Format("SELECT COUNT(*) FROM admin WHERE email='"+ adminEmail +"'");
            SqlComm.CommandText = query;
            int result = (int)SqlComm.ExecuteScalar();

            if (result == 1)
            {
                query = string.Format("SELECT password FROM admin WHERE email='"+ adminEmail +"'");
                SqlComm.CommandText = query;
                string dbPass = (String)SqlComm.ExecuteScalar();

                if (dbPass == adminPass)
                {
                    Admin adminDataByEmail = Admin.GetAll_DataByEmail(adminEmail);
                    Session["id"] = adminDataByEmail.Id;

                    Response.Redirect("~/Admin/Default.aspx");
                }
                else
                {
                    LabelError.Text = "Wrong password.";
                }
            }
            else if (result == 0)
            {
                LabelError.Text = "Email ID does not exists.";
            }
        }
    }
}