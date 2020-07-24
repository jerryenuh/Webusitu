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
            addEmployeeDiv.Visible = false;
            updateDiv.Visible = false;
            updateDiv1.Visible = false;
            searchButton.Visible = false;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {   
            connection.Open();
            cmd.Connection = connection;

                 int DBId=0;
                cmd.Parameters.Clear();
                cmd.CommandText = "select Id from[Department] where Name = @Name";
                cmd.Parameters.AddWithValue("@Name", departmentDD.SelectedItem.Text);
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
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter();
                    //Code to send things to DB
                    long empid = Convert.ToInt32(IDtxt.Text);
                    long telephone = Convert.ToInt64(telephonetxt.Text);
                    cmd = new SqlCommand("spInsEmployee", connection);
                    cmd.Parameters.AddWithValue("ID", SqlDbType.Int).Value = empid;
                    cmd.Parameters.AddWithValue("@FName", SqlDbType.NChar).Value = firstnametxt.Text;
                    cmd.Parameters.AddWithValue("@LName", SqlDbType.NChar).Value = lastnametxt.Text;
                    cmd.Parameters.AddWithValue("@Email", SqlDbType.NChar).Value = emailtxt.Text;
                    cmd.Parameters.AddWithValue("@Telephone", SqlDbType.Int).Value = telephone;
                    cmd.Parameters.AddWithValue("@DepartmentID", SqlDbType.Int).Value = DBId;
                    
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

        protected void addEmployeeBtn_Click(object sender, EventArgs e)
        {
            addEmployeeDiv.Visible = true;
        }

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            addEmployeeDiv.Visible = false;
            updateDiv.Visible = true;
            searchButton.Visible = true;
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            connection.Open();
            cmd.Connection = connection;
            cmd.CommandText = "select * from [dbo].[employee]";
            SqlDataReader rd = cmd.ExecuteReader();
            
            string Fname = "";

            while (rd.Read())
            {
                if (rd[0].ToString() == updateIDtxt.Text)
                {
                    updateDiv.Visible = true;
                    updateDiv1.Visible = true;
                    errorlbl.Visible = true;
 
                    Fname = "" + rd.GetValue(1).ToString() + " " + rd.GetValue(2).ToString();
                    
                    errorlbl.Text = "You Selected " + Fname;
                    break;
                }
                else
                {
                    errorlbl.Text = "The Id you have entered does not exist so please try again";
                    
                }

            }
            rd.Close();
            connection.Close();
        }
    }
    }
