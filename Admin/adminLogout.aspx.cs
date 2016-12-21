using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_adminLogout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["id"] != null) Session.Remove("id");
            Session.Abandon();
            Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId") { Expires = DateTime.Now.AddDays(-1d) });

            Response.Redirect("~/Admin/admin_login.aspx");
        }
    }
}