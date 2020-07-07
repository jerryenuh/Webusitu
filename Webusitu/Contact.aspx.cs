using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace Webusitu
{
    public partial class Contact : Page
    {

        string connectionString = WebConfigurationManager.ConnectionStrings["LeaveSystemDB"].ConnectionString;

        

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(connectionString);

            if (connection != null && connection.State == ConnectionState.Closed)
            {
                connlbl.Text = "Connection has Active";

            }
            else
            {
                connlbl.Text = "Connection is failed";
            }


        }

        protected void btnSubmit_Click(object sender, EventArgs e)
            
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            SqlCommand cmd = new SqlCommand("insertLeave",connection);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@empid", SqlDbType.Int).Value = txtID.Text;
            cmd.Parameters.AddWithValue("@lastdays", SqlDbType.Int).Value = txtDays.Text;
            cmd.Parameters.AddWithValue("@startDay", SqlDbType.VarChar).Value = startdate.Value;
            cmd.Parameters.AddWithValue("@endDay", SqlDbType.VarChar).Value = enddate.Value;
        }
    }
}