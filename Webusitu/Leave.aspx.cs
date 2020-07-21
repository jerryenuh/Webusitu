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
using Nager.Date;
using Nager.Date.Model;

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

        public DateTime weekendCheck(DateTime sDate)
        {
            DateTime eDate = new DateTime();

            eDate = sDate;

            // make sure it is not a saturday or Sunday
            // if it is add another day
            while (sDate.DayOfWeek == DayOfWeek.Saturday || sDate.DayOfWeek == DayOfWeek.Sunday || isHoliday(sDate) == true)
            {

                sDate = sDate.AddDays(1);
                System.Diagnostics.Debug.WriteLine(sDate);
               // return eDate;
            }
           
                // More than one day so add days day by day and check each time for
                // weekend. do recursively

                return sDate;
            
        }

        private bool isHoliday(DateTime eDate)
        {
            bool status = false;   // not holiday is default

            try
            {
                // Always holidays are Jan 1, Dec 25, 26 and Aug 1,6
                if (eDate.Month == 1 && eDate.Day == 1)
                    status = true;
                else if (eDate.Month == 12 && (eDate.Day == 25 || eDate.Day == 26))
                    status = true;
                else if (eDate.Month == 8 && (eDate.Day == 1 || eDate.Day == 6))
                    status = true;
               
            }
            catch (Exception)
            {
                System.Diagnostics.Debug.WriteLine("Failed");
            }
            return status;
        }
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
                string empid = txtID.Text;
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
                    daysRemain = Convert.ToInt32(read.GetValue(7).ToString());
                    daysRemain --;

                    calDRamains = daysRemain - lastdays;
                    testlbl.Text = daysRemain.ToString();
                    if (calDRamains >= 0)
                    {
                        cmd = new SqlCommand("spFindUserID", connection);
                        //cmd = new SqlCommand("calculateDays", connection);
                        SqlDataAdapter adapter = new SqlDataAdapter();
                        connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LeaveApplicationSystemConnectionString"].ConnectionString);

                        connection.Open();
                        cmd.Connection = connection;
                        cmd.Parameters.AddWithValue("@empId", SqlDbType.NVarChar).Value = txtID.Text;
                        cmd.Parameters.AddWithValue("@lastDays", SqlDbType.Int).Value = lastdays;
                        cmd.Parameters.AddWithValue("@startDay", SqlDbType.NVarChar).Value = startdate.Text;
                        cmd.Parameters.AddWithValue("@endDay", SqlDbType.NVarChar).Value = enddatetxt.Text;
                        //cmd.Parameters.AddWithValue("@daysRemain", SqlDbType.Int).Value = 20;


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
                        testlbl.Text = "You have went over the amount of days you have remaining. You have" + daysRemain++ + "days.";
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
            //check for weekends 
            DateTime newDate = new DateTime();

            newDate = Convert.ToDateTime(calendar.SelectedDate).AddBusinessDays(dayamount);
            System.Diagnostics.Debug.WriteLine(newDate);
            System.Diagnostics.Debug.WriteLine(dayamount);
            /* you orginally had
             *      weekendCheck(newDate);
             * when it was suppose to be
             *      newDate = weekendCheck(newDate);
             */
            newDate = weekendCheck(newDate);

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
                //calendar.SelectedDate.AddDays(dayamount);
                //check for weekends
                DateTime newDate = new DateTime();
                newDate = Convert.ToDateTime(calendar.SelectedDate);
                newDate = weekendCheck(newDate); 
                newDate = Convert.ToDateTime(calendar.SelectedDate).AddBusinessDays(dayamount);
                
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