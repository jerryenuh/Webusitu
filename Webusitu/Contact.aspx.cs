﻿using System;
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


        protected void Page_Load(object sender, EventArgs e)
        {
            
            SqlDataAdapter adapter = new SqlDataAdapter();
            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LeaveApplicationSystemConnectionString"].ConnectionString);
            connection.Open();
            


        }

        protected void btnSubmit_Click(object sender, EventArgs e)
            
        {
            
            cmd.Connection = connection;
            cmd.CommandText = "select * from [leaves]";
            SqlDataReader rd = cmd.ExecuteReader();
            
            while (rd.Read())
            {
                if (rd[1].ToString() == txtID.Text)
                {
                    flag = true;
                    break;
                }
            }
            if (flag == false)
            {
                //Message that ID doesnt exist
                errorlbl.Text = "Your ID Does Not Exist";
                
            }
            else
            {
                //Code to send things to DB
                int empid = Convert.ToInt32(txtID.Text);
                int lastdays = Convert.ToInt32(txtDays.Text);
                //string sql = "";
                // SqlCommand command;
                cmd = new SqlCommand("spFindUserID", connection);
                //cmd = new SqlCommand("calculateDays", connection);
                SqlDataAdapter adapter = new SqlDataAdapter();
                connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LeaveApplicationSystemConnectionString"].ConnectionString);

                cmd.Parameters.AddWithValue("@empId", SqlDbType.Int).Value = empid;
                cmd.Parameters.AddWithValue("@lastDays", SqlDbType.Int).Value = lastdays;
                cmd.Parameters.AddWithValue("@startDay", SqlDbType.NVarChar).Value = startdate.Value;
                cmd.Parameters.AddWithValue("@endDay", SqlDbType.NVarChar).Value = enddate.Value;
                cmd.Parameters.AddWithValue("@daysRemain", SqlDbType.Int).Value = 20;
                cmd.CommandType = CommandType.StoredProcedure;
                //connection.Open();
                cmd.ExecuteNonQuery();
                rd.Close();
                connection.Close();

                // command = new SqlCommand(sql, connection);
                //adapter.InsertCommand = new SqlCommand(sql, connection);
                //adapter.InsertCommand.ExecuteNonQuery();
                //command.Dispose(); 
            }

            connection.Close();
        }
    }
}