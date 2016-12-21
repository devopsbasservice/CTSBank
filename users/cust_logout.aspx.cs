using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class users_cust_logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Cust_Id"] != null) Session.Remove("Cust_Id");
            Session.Abandon();
            Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId") { Expires = DateTime.Now.AddDays(-1d) });

            Response.Redirect("~/users/user_login.aspx");
        }
    }
}