using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webusitu
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Remove("ID");
            Session.Remove("Role");
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }
    }
}