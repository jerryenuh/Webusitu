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
    public partial class UpdateEmp : System.Web.UI.Page
    {

        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LeaveApplicationSystemConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            connection.Close();
            updateDiv.Visible = true;
            updateDiv1.Visible = false;
            searchButton.Visible = true;

        }

  


        protected void updateBtn_Click(object sender, EventArgs e)
        {
            
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
                    searchButton.Visible = false;
                    updateDiv.Visible = true;
                    updateDiv1.Visible = true;
                    errorlbl.Visible = true;
                    errorlbl.Text = "";

                    firstnametxt0.Text = "" + rd.GetValue(1).ToString();
                    lastnametxt0.Text = "" + rd.GetValue(2).ToString();
                    emailtxt0.Text = "" + rd.GetValue(3).ToString();
                    telephonetxt0.Text = "" + rd.GetValue(4).ToString();
                    leaveAmttxt.Text = "" + rd.GetValue(6).ToString();
                    string id = rd.GetValue(5).ToString();
                    updateDropDown.ClearSelection();
                    updateDropDown.SelectedValue = id;

                    //Fname = "" + rd.GetValue(1).ToString() + " " + rd.GetValue(2).ToString();
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

        protected void updateEmpbtn_Click(object sender, EventArgs e)
        {
            using (cmd = new SqlCommand("spUpEmployee", connection))
            {
                //connection setup and opening
                connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LeaveApplicationSystemConnectionString"].ConnectionString);
                SqlDataAdapter adapter = new SqlDataAdapter();
                //Code to send things to DB
                //long empid = Convert.ToInt32(IDtxt.Text);
                long telephone = Convert.ToInt64(telephonetxt0.Text);
                cmd = new SqlCommand("spUpEmployee", connection);
                cmd.Parameters.AddWithValue("@Id", SqlDbType.VarChar).Value = updateIDtxt.Text;
                cmd.Parameters.AddWithValue("@FName", SqlDbType.NChar).Value = firstnametxt0.Text;
                cmd.Parameters.AddWithValue("@LName", SqlDbType.NChar).Value = lastnametxt0.Text;
                cmd.Parameters.AddWithValue("@Email", SqlDbType.NChar).Value = emailtxt0.Text;
                cmd.Parameters.AddWithValue("@Telephone", SqlDbType.Int).Value = telephone;
                cmd.Parameters.AddWithValue("@DepartmentID", SqlDbType.Int).Value = updateDropDown.SelectedItem.Text;
                cmd.Parameters.AddWithValue("@daysRemain", SqlDbType.Int).Value = leaveAmttxt.Text;
                connection.Open();

                cmd.CommandType = CommandType.StoredProcedure;
                //connection.Open();
                cmd.ExecuteNonQuery();
                //rd.Close();
                connection.Close();

                errorlbl.Text = "Successfully Updated";
                //next version will have prompt for reload 
                Response.AddHeader("Refresh", "2");
            }
        }
       
    }
}
