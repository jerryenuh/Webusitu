using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webusitu
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string role = Session["Role"].ToString();
            System.Diagnostics.Debug.WriteLine(role);
            if (String.Equals(role, "admin"))
            {
                adminReports.Visible = true;
                adminHoliday.Visible = true;
                dropdown.Visible = true;

            }
            else
            {
                adminReports.Visible = false;
                adminHoliday.Visible = false;
                dropdown.Visible = false;
            }


        }
    }
}