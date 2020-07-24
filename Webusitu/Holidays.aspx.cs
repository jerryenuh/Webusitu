using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Webusitu
{
    public partial class Holidays : System.Web.UI.Page
    {

        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LeaveApplicationSystemConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LeaveApplicationSystemConnectionString"].ConnectionString);
                string date = holidaytxt.Text;
                cmd.Connection = connection;
                connection.Open();
                cmd.CommandText = "insert into holidays(days) VALUES (@date)";
                cmd.Parameters.AddWithValue("@date", SqlDbType.VarChar).Value = date;
                cmd.ExecuteNonQuery();
                connection.Close();
                errorlbl.Text = "Successfully Added";
            }
            catch
            {
                errorlbl.Text = " ERROR!";
            }
        }
    }
}