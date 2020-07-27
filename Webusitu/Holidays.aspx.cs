using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;

namespace Webusitu
{

    public partial class Holidays : System.Web.UI.Page
    {
        StringBuilder table = new StringBuilder();
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LeaveApplicationSystemConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridView();
            }
        }

        void PopulateGridView()
        {
            DataTable dtbl = new DataTable();
            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LeaveApplicationSystemConnectionString"].ConnectionString);
            using (connection)
            {
                connection.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Holidays", connection);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvHoliday.DataSource = dtbl;
                gvHoliday.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvHoliday.DataSource = dtbl;
                gvHoliday.DataBind();
                gvHoliday.Rows[0].Cells.Clear();
                gvHoliday.Rows[0].Cells.Add(new TableCell());
                gvHoliday.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvHoliday.Rows[0].Cells[0].Text = "No Data Found ..!";
                gvHoliday.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            
        }

        protected void gvHoliday_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("Add New"))
                {

                    using (connection)
                    {
                        //string date = holidaytxt2.Text;
                        cmd.Connection = connection;
                        connection.Open();
                        cmd.CommandText = "insert into holidays(days) VALUES (@date)";
                        cmd.Parameters.AddWithValue("@date", (gvHoliday.FooterRow.FindControl("txtDaysFooter") as TextBox).Text.Trim());
                        cmd.ExecuteNonQuery();
                        PopulateGridView();
                        lblSuccessMessage.Text = "New Record Added";
                        lblErrorMessage.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }
        protected void gvHoliday_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvHoliday.EditIndex = e.NewEditIndex;
            PopulateGridView();
        }

        protected void gvHoliday_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvHoliday.EditIndex = -1;
            PopulateGridView();
        }

        protected void gvHoliday_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (connection)
                {
                    
                    cmd.Connection = connection;
                    connection.Open();
                    cmd.CommandText = "UPDATE holidays SET days = @date WHERE Id = @Id";
                    cmd.Parameters.AddWithValue("@date", (gvHoliday.Rows[e.RowIndex].FindControl("txtDays") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(gvHoliday.DataKeys[e.RowIndex].Value.ToString()));

                    cmd.ExecuteNonQuery();
                    gvHoliday.EditIndex = -1;
                    PopulateGridView();
                    lblSuccessMessage.Text = "Selected Record Updated";
                    lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void gvHoliday_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //try
            //{
                using (connection)
                {
                    string id = gvHoliday.DataKeys[e.RowIndex].Value.ToString();
                    System.Diagnostics.Debug.WriteLine(id);
                    cmd.Connection = connection;
                    connection.Open();
                    cmd.CommandText = "DELETE FROM holidays WHERE Id = @Id";
                    cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(gvHoliday.DataKeys[e.RowIndex].Value.ToString()));

                    cmd.ExecuteNonQuery();
                    PopulateGridView();
                    lblSuccessMessage.Text = "Selected Record Deleted";
                    lblErrorMessage.Text = "";
                }
            }
            /*catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }*/
        }

    }
