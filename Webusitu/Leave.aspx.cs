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
    public partial class Contact : Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LeaveApplicationSystemConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlParameter sp1 = new SqlParameter();
        SqlParameter sp2 = new SqlParameter();
        SqlParameter sp3 = new SqlParameter();
        SqlParameter sp4 = new SqlParameter();
        bool flag = false;
        //String test;


        protected void Page_Load(object sender, EventArgs e)
        {
            
            SqlDataAdapter adapter = new SqlDataAdapter();
            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LeaveApplicationSystemConnectionString"].ConnectionString);
            connection.Open();
            


        }

        protected void btnSubmit_Click(object sender, EventArgs e)
            
        {
            
            cmd.Connection = connection;
            cmd.CommandText = "select * from [dbo].[employee]";
            SqlDataReader rd = cmd.ExecuteReader();
            
            while (rd.Read())
            {
                if (rd[0].ToString() == txtID.Text)
                {
                    flag = true;
                    break;
                }
                
            }
            rd.Close();
            if (flag == true)
            {



                //errorlbl.Visible = false;
                //Code to send things to DB
                int empid = Convert.ToInt32(txtID.Text);
                int lastdays = Convert.ToInt32(txtDays.Text);

                SqlCommand com = new SqlCommand("select daysRemain from [employee] where Id =@Id", connection);
                cmd.Parameters.AddWithValue("@Id", int.Parse(txtID.Text));
                SqlDataReader read = cmd.ExecuteReader();
                int daysRemain;
                int calDRamains;
               // int daysRemain2;

                while (read.Read())
                {
                    daysRemain = Convert.ToInt32(read.GetValue(6).ToString());
                    daysRemain --;
                    calDRamains = daysRemain - lastdays;
                    testlbl.Text = daysRemain.ToString();
                    if (calDRamains >= 0)
                    {
                        cmd = new SqlCommand("spFindUserID", connection);
                        //cmd = new SqlCommand("calculateDays", connection);
                        SqlDataAdapter adapter = new SqlDataAdapter();
                        connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LeaveApplicationSystemConnectionString"].ConnectionString);



                        cmd.Parameters.AddWithValue("@empId", SqlDbType.Int).Value = empid;
                        cmd.Parameters.AddWithValue("@lastDays", SqlDbType.Int).Value = lastdays;
                        cmd.Parameters.AddWithValue("@startDay", SqlDbType.NVarChar).Value = startdate.Value;
                        cmd.Parameters.AddWithValue("@endDay", SqlDbType.NVarChar).Value = enddate.Value;
                        cmd.Parameters.AddWithValue("@daysRemain", SqlDbType.Int).Value = 20;

                        //adapter = new SqlDataAdapter("select id from [employee] id =" + empid + "", connection);


                        cmd.CommandType = CommandType.StoredProcedure;
                        //connection.Open();
                        cmd.ExecuteNonQuery();
                        //rd.Close();
                        connection.Close();

                        // command = new SqlCommand(sql, connection);
                        //adapter.InsertCommand = new SqlCommand(sql, connection);
                        //adapter.InsertCommand.ExecuteNonQuery();
                        //command.Dispose(); 
                    }
                    else if (calDRamains == 0)
                    {
                        
                        testlbl.Text = "You have no days left to use";
                    }
                    else
                    {
                        testlbl.Text = "You have went over the amount of days you have remaining. {0}" + daysRemain;
                    }

                }
                read.Close();
                
                

                   
                




            }
            else
            {
                errorlbl.Text = "The Id you have entered does not exist so please try again";
            }

            connection.Close();
        }
    }
}