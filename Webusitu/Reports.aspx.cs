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

        }

        protected void DepartmentDD_SelectedIndexChanged(object sender, EventArgs e)
        {
            connection.Open();
            cmd.Connection = connection;
            Console.WriteLine("Work");
            string DBId = "";
            cmd.Parameters.Clear();
            cmd.CommandText = "select Id from[Department] where Name = @Name";
            cmd.Parameters.AddWithValue("@Name", DepartmentDD.SelectedValue);
            System.Diagnostics.Debug.WriteLine(DepartmentDD.SelectedValue);
            SqlDataReader read = cmd.ExecuteReader();
            while (read.Read())
            {
                DBId = read.GetValue(0).ToString();
                System.Diagnostics.Debug.WriteLine(DBId);
                break;
            }
            read.Close();

            DepID.Text =  DBId;

        }
    }
}