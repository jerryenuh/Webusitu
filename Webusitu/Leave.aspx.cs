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
using FluentDateTime;

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
            if (!IsPostBack)
            {


                leavediv.Visible = false;
                datediv.Visible = false;
                submitdiv.Visible = false;
               
            }
                //errorlbl.Text = "The Id you have entered does not exist so please try again";



            }

        protected void idsubmitbtn_Click(object sender, EventArgs e)
        {
            cmd.Connection = connection;
            cmd.CommandText = "select * from [dbo].[employee]";
            SqlDataReader rd = cmd.ExecuteReader();

            while (rd.Read())
            {
                if (rd[0].ToString() == txtID.Text)
                {
                    flag = true;
                    leavediv.Visible = true;
                    datediv.Visible = true;
                    submitdiv.Visible = true;
                    idsubmitbtn.Visible = false;
                    errorlbl.Text = "";
                    calendar.Visible = false;

                    break;
                }
                else
                {
                    errorlbl.Text = "The Id you have entered does not exist so please try again";
                    leavediv.Visible = false;
                    datediv.Visible = false;
                }

            }
            rd.Close();
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
                    leavediv.Visible = true;
                    datediv.Visible = true;
                    break;
                }
                
            }
            rd.Close();
            if (flag == true)
            {
                //Code to send things to DB
                int empid = Convert.ToInt32(txtID.Text);
                int lastdays = Convert.ToInt32(txtDays.Text);
                int dayamount= Convert.ToInt32(txtDays.Text);

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
                        //cmd.Parameters.AddWithValue("@startDay", SqlDbType.NVarChar).Value = startdate.Value;
                        cmd.Parameters.AddWithValue("@daysRemain", SqlDbType.Int).Value = 20;
                        
           

                        //adapter = new SqlDataAdapter("select id from [employee] id =" + empid + "", connection);


                        cmd.CommandType = CommandType.StoredProcedure;
                        
                        cmd.ExecuteNonQuery();
                        
                        connection.Close();
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
                leavediv.Visible = false;
                datediv.Visible = false;
                //submitdiv.Visible = false;
            }

            connection.Close();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if(calendar.Visible == true)
            {
                calendar.Visible = false;
            }
            else
            {
                calendar.Visible = true;
            }

        }



        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            startdate.Text = calendar.SelectedDate.ToShortDateString();
            calendar.Visible = false;
            int dayamount = Convert.ToInt32(txtDays.Text);
            //calendar.SelectedDate.AddDays(dayamount);
            DateTime newDate = Convert.ToDateTime(calendar.SelectedDate);
            newDate = DateTime.Now.AddBusinessDays(dayamount);

            enddatetxt.Text = newDate.ToShortDateString();

         
            
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if(e.Day.IsOtherMonth || e.Day.IsWeekend)
            {
                e.Day.IsSelectable = false;
            }
        }


        protected void txtDays_TextChanged(object sender, EventArgs e)
        {

            try
            {
                int dayamount = Convert.ToInt32(txtDays.Text);
                calendar.SelectedDate.AddDays(dayamount);
                DateTime newDate = Convert.ToDateTime(calendar.SelectedDate);
                newDate = DateTime.Now.AddBusinessDays(dayamount);

                enddatetxt.Text = newDate.ToShortDateString();
            }
            catch (Exception)
            {
                txtDays.Text = "0";
            }
            


        }

        protected void startdate_TextChanged(object sender, EventArgs e)
        {
            
        }
    }
}