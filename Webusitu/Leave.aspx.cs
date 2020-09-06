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


        public DateTime weekendCheck(DateTime sDate)
        {
            DateTime eDate = new DateTime();
                
            eDate = sDate;
            sDate = sDate.AddDays(-);
            // make sure it is not a saturday or Sunday
            // if it is add another day

            do 
            {

                
                System.Diagnostics.Debug.WriteLine("Yo");
                System.Diagnostics.Debug.WriteLine(sDate);
                sDate = sDate.AddBusinessDays(1);
                // return eDate;
            } while ((sDate.DayOfWeek == DayOfWeek.Saturday || sDate.DayOfWeek == DayOfWeek.Sunday || isHoliday(sDate) == true)) ;

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
                {
                    status = true;
                }
                else if (eDate.Month == 12 && (eDate.Day == 25 || eDate.Day == 26))
                {
                    status = true;
                }
                else if (eDate.Month == 8 && (eDate.Day == 1 || eDate.Day == 6))
                {
                    status = true;
                }
                else
                {
                    cmd.Connection = connection;
                    cmd = new SqlCommand("spSelectAllHolidays", connection);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataReader rd = cmd.ExecuteReader();
                    string compDate = "" + eDate.Month + "/" + eDate.Day + "/" + eDate.Year + " 12:00:00 AM";
                    ///System.Diagnostics.Debug.WriteLine(eDate);
                    //System.Diagnostics.Debug.WriteLine("compDate");
                    //System.Diagnostics.Debug.WriteLine(compDate);
                    while (rd.Read())
                    {
                        if (rd[1].ToString() == compDate)
                        {
                            status = true;

                            break;
                        }
                        //System.Diagnostics.Debug.WriteLine(status);
                    }
                    rd.Close();
                }
               
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
            cmd = new SqlCommand("spSelectAllemployee", connection);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader();
            string daysRemain ="";
            string Fname= "";
            
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
                    Fname = "" + rd.GetValue(1).ToString() + " " + rd.GetValue(2).ToString();
                    daysRemain = rd.GetValue(6).ToString();
                    errorlbl.Text = "Welcome " + Fname + " you have, " + daysRemain +" days remaining";
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
            
            cmd = new SqlCommand("spSelectAllemployee", connection);
            cmd.CommandType = CommandType.StoredProcedure;
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
                string Department = "";

                cmd = new SqlCommand("spDaysRemainFromEmpId", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@Id", SqlDbType.VarChar).Value = txtID.Text;
                SqlDataReader read = cmd.ExecuteReader();
                int daysRemain=0;
                int calDRamains =0;
                // int daysRemain2;

                while (read.Read())
                {
                    daysRemain = Convert.ToInt32(read.GetValue(0).ToString());
                    break;
                    //System.Diagnostics.Debug.WriteLine(daysRemain);
                    
                }
                read.Close();
                cmd.Parameters.Clear();
                //Reading the Department from employee table
                cmd = new SqlCommand("spFindDepIdfromId", connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", SqlDbType.VarChar).Value = txtID.Text;
                read = cmd.ExecuteReader();
                while (read.Read())
                {
                    Department = read.GetValue(0).ToString();
                    break;
                    //System.Diagnostics.Debug.WriteLine(daysRemain);

                }
                read.Close();

                if (calDRamains >= 0)
                    {
                    DateTime startDate = new DateTime();
                    string cStartDate = startdate.Text;
                    startDate = Convert.ToDateTime(cStartDate);
                    DateTime endDate = new DateTime();
                    string cEndDate = enddatetxt.Text;
                    endDate = Convert.ToDateTime(cEndDate);
                    if (errorlbl2.Text == "You cannot apply for leave in this time period")
                    {

                    }
                    else
                    {
                        cmd = new SqlCommand("spFindUserID", connection);
                        //cmd = new SqlCommand("calculateDays", connection);
                        SqlDataAdapter adapter = new SqlDataAdapter();
                        connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LeaveApplicationSystemConnectionString"].ConnectionString);

                        connection.Open();
                        cmd.Connection = connection;
                        cmd.Parameters.AddWithValue("@empId", SqlDbType.VarChar).Value = txtID.Text;
                        cmd.Parameters.AddWithValue("@lastDays", SqlDbType.Int).Value = lastdays;
                        cmd.Parameters.AddWithValue("@startDay", SqlDbType.Date).Value = startDate.ToString("MMM dd,yyyy");
                        cmd.Parameters.AddWithValue("@endDay", SqlDbType.Date).Value = endDate.ToString("MMM dd,yyyy");
                        cmd.Parameters.AddWithValue("@DepartmentID", SqlDbType.VarChar).Value = Department;
                        //cmd.Parameters.AddWithValue("@daysRemain", SqlDbType.Int).Value = 20;
                        //daysRemain--;
                        calDRamains = daysRemain - lastdays;
                        testlbl.Text = "You have " + calDRamains.ToString() + " days remaining";

                        //adapter = new SqlDataAdapter("select id from [employee] id =" + empid + "", connection);


                        cmd.CommandType = CommandType.StoredProcedure;


                        cmd.ExecuteNonQuery();

                        connection.Close();
                    }
                    
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
            else
            {
                errorlbl.Text = "The Id you have entered does not exist so please try again";
                leavediv.Visible = false;
                datediv.Visible = false;
                //submitdiv.Visible = false;
            }
            
            connection.Close();
            Response.AddHeader("Refresh", "3");
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
            
            //System.Diagnostics.Debug.WriteLine(newDate);
            //System.Diagnostics.Debug.WriteLine(dayamount);
            /* you orginally had
             *      weekendCheck(newDate);
             * when it was suppose to be
             *      newDate = weekendCheck(newDate);
             */
            newDate = weekendCheck(newDate);

            if (txtDays.Text==String.Empty)
                {
                    enddatetxt.Text = " ";
                }
                else
                {
                    enddatetxt.Text = newDate.ToShortDateString();
                }

                if (startdate.Text == String.Empty || txtDays.Text == String.Empty)
                {
                    enddatetxt.Text = "";
                }
            
            newDate = weekendCheck(newDate);
            string Department = "";
            cmd = new SqlCommand("spFindDepIdfromId", connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Id", SqlDbType.VarChar).Value = txtID.Text;
            SqlDataReader read = cmd.ExecuteReader();
            while (read.Read())
            {
                Department = read.GetValue(0).ToString();
                break;
                //System.Diagnostics.Debug.WriteLine(daysRemain);

            }
            read.Close();

            string beginningofall = calendar.SelectedDate.ToShortDateString();
            DateTime beginningDateTime = Convert.ToDateTime(beginningofall);
            cmd = new SqlCommand("spDateChek", connection);
            SqlDataAdapter adapter = new SqlDataAdapter();
            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LeaveApplicationSystemConnectionString"].ConnectionString);

            connection.Open();
            cmd.Connection = connection;

            cmd.Parameters.AddWithValue("@SD", SqlDbType.Date).Value = beginningDateTime.ToString("MMM dd,yyyy");
            System.Diagnostics.Debug.WriteLine(beginningDateTime);
            cmd.Parameters.AddWithValue("@DId", SqlDbType.Int).Value = Department;
            var returnParameter = cmd.Parameters.Add("@returnVal", SqlDbType.Int);
            returnParameter.Direction = ParameterDirection.ReturnValue;
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.ExecuteNonQuery();
            var result = returnParameter.Value;
            int counter = int.Parse(result.ToString());
            System.Diagnostics.Debug.WriteLine(counter);
            connection.Close();

            if(counter > 0)
            {
                errorlbl2.Text = "You cannot apply for leave in this time period";
            }
            else
            {
                errorlbl2.Text = "";
            }

            

            /*while (rd.Read())
            {
                string startDay =rd[0].ToString();
                
                DateTime beginningDateTime = Convert.ToDateTime(beginningofall);
                DateTime startDayy = Convert.ToDateTime(startDay);
                string endDay = rd[1].ToString();
                DateTime endDayy = Convert.ToDateTime(endDay);
                if (beginningDateTime >=startDayy && beginningDateTime<=startDayy)
                {
                    errorlbl.Text = "You cannot apply for leave in this time period";
                    break;
                }

            }
            rd.Close();*/



        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if(e.Day.IsOtherMonth || e.Day.IsWeekend)
            {
                e.Day.IsSelectable = false;
            }

            if (e.Day.Date.CompareTo(DateTime.Today) < 0)
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
                //newDate = Convert.ToDateTime(calendar.SelectedDate);
                newDate = Convert.ToDateTime(calendar.SelectedDate).AddBusinessDays(dayamount);
                newDate = weekendCheck(newDate); 
                //newDate = Convert.ToDateTime(calendar.SelectedDate).AddBusinessDays(dayamount);
                if (txtDays.Text==String.Empty)
                {
                    enddatetxt.Text = " ";
                }
                else
                {
                    enddatetxt.Text = newDate.ToShortDateString();
                }

                if (startdate.Text == String.Empty || txtDays.Text == String.Empty)
                {
                    enddatetxt.Text = "";
                }

            }
            catch (Exception)
            {
                txtDays.Text = "0";
            }
            


        }

        protected void startdate_TextChanged(object sender, EventArgs e)
        {
            calendar.SelectedDate = Convert.ToDateTime(startdate.Text);

            if (startdate.Text == String.Empty  ||txtDays.Text == String.Empty)
            {
                enddatetxt.Text = "";
            }
        }
    }
}