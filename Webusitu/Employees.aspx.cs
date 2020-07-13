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
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LeaveApplicationSystemConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            connection.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                using (cmd = new SqlCommand("spInsEmployee", connection))
                {
                    //connection setup and opening
                    connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LeaveApplicationSystemConnectionString"].ConnectionString);
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter();
                    //Code to send things to DB
                    long empid = Convert.ToInt32(IDtxt.Text);
                    long telephone = Convert.ToInt64(telephonetxt.Text);
                    cmd = new SqlCommand("spInsEmployee", connection);
                    cmd.Parameters.AddWithValue("ID", SqlDbType.Int).Value = empid;
                    cmd.Parameters.AddWithValue("@Name", SqlDbType.NChar).Value = nametxt.Text;
                    cmd.Parameters.AddWithValue("@Email", SqlDbType.NChar).Value = emailtxt.Text;
                    cmd.Parameters.AddWithValue("@Telephone", SqlDbType.Int).Value = telephone;
                    cmd.Parameters.AddWithValue("@Department", SqlDbType.NChar).Value = departmenttxt.Text;
                    cmd.Parameters.AddWithValue("@JobTitle", SqlDbType.NChar).Value = jobtitletxt.Text;
                    cmd.CommandType = CommandType.StoredProcedure;
                    //connection.Open();
                    cmd.ExecuteNonQuery();
                    //rd.Close();
                    connection.Close();

                    errorlbl.Text = "Successfully Added";

                }
            }
            catch (Exception)
            {
                errorlbl.Text = "There was an error contact admin for assistance";
                

            }
        }
    }
}