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
            addEmployeeDiv.Visible = true;
            addEmployeeBtn.Visible = false;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                connection.Open();
                cmd.Connection = connection;

                int DBId = 0;
                cmd.Parameters.Clear();
                cmd = new SqlCommand("spFindDepIDbyName", connection);
                cmd.CommandType = CommandType.StoredProcedure;
                 cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = departmentDD.SelectedItem.ToString();
          
                SqlDataReader read = cmd.ExecuteReader();
                while (read.Read())
                {
                    DBId = Convert.ToInt32(read.GetValue(0).ToString());
                    break;
                }
                read.Close();


                using (cmd = new SqlCommand("spInsEmployee", connection))
                {
                    //connection setup and opening
                    connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LeaveApplicationSystemConnectionString"].ConnectionString);
                    SqlDataAdapter adapter = new SqlDataAdapter();
                    //Code to send things to DB
                    
                    long telephone = Convert.ToInt64(telephonetxt.Text);
                    cmd = new SqlCommand("spInsEmployee", connection);
                    cmd.Parameters.AddWithValue("ID", SqlDbType.NChar).Value = IDtxt.Text;
                    cmd.Parameters.AddWithValue("@FName", SqlDbType.NChar).Value = firstnametxt.Text;
                    cmd.Parameters.AddWithValue("@LName", SqlDbType.NChar).Value = lastnametxt.Text;
                    cmd.Parameters.AddWithValue("@Email", SqlDbType.NChar).Value = emailtxt.Text;
                    cmd.Parameters.AddWithValue("@Telephone", SqlDbType.Int).Value = telephone;
                    cmd.Parameters.AddWithValue("@DepartmentID", SqlDbType.Int).Value = DBId;
                    connection.Open();

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
            addEmployeeDiv.Visible = true;
            Response.AddHeader("Refresh", "2");
        }

        protected void addEmployeeBtn_Click(object sender, EventArgs e)
        {
            cmd.Parameters.Clear();
            addEmployeeDiv.Visible = true;

        }
    }
 }
