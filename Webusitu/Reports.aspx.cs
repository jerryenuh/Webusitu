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
using System.Configuration;

namespace Webusitu
{
    public partial class Reports : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LeaveApplicationSystemConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            //tabs2.Visible = false;
           

        }

        protected void DepartmentDD_SelectedIndexChanged(object sender, EventArgs e)
        {

            string DBId = "";
            cmd.Parameters.Clear();
            cmd = new SqlCommand("spFindDepIDbyName", connection);
            cmd.CommandType = CommandType.StoredProcedure;
            
            //System.Diagnostics.Debug.WriteLine(DepartmentDD.SelectedValue.ToString());

            cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = DepartmentDD.SelectedValue.ToString();
            connection.Open();
            //cmd.Connection = connection;
            SqlDataReader read = cmd.ExecuteReader();
            while (read.Read())
            {
                DBId = read.GetValue(0).ToString();
                System.Diagnostics.Debug.WriteLine(DepartmentDD.SelectedValue.ToString());
                break;
            }
            read.Close();

            DepID.Text =  DBId;
            
            cmd.ExecuteNonQuery();
            connection.Close();
        }
    }
}