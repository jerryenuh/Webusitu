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
    public partial class Login : System.Web.UI.Page
    {

        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LeaveApplicationSystemConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Validateuser(object sender, EventArgs e)
        {

            cmd.Connection = connection;
            cmd = new SqlCommand("spFindUserLogin", connection);

            using (connection) {

                try {
                    connection.Open();
                    cmd.Parameters.AddWithValue("@ID", SqlDbType.VarChar).Value = txtUsername.Text;
                    cmd.Parameters.AddWithValue("@Pass", SqlDbType.VarChar).Value = txtPassword.Text;

                    var returnParameter = cmd.Parameters.Add("@returnVal", SqlDbType.Int);
                    returnParameter.Direction = ParameterDirection.ReturnValue;
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.ExecuteNonQuery();
                    
                    var result = returnParameter.Value;
                    int counter = int.Parse(result.ToString());
                    

                    if (counter >= 1)
                    {
                        
                        Session["ID"] = txtUsername.Text;
                        getRoles();
                        //System.Diagnostics.Debug.WriteLine("hia");
                        Server.Transfer("Leave.aspx");
                        lblError.Text = "Successful Login";
                        
                    }
                    else
                    {
                        lblError.Text = "Failed";
                    }
                    //System.Diagnostics.Debug.WriteLine("hia");
                    connection.Close();
                    


                }
                catch(Exception)
                {

                } 


                }
                
              }


        protected void getRoles()
        {
            
            cmd = new SqlCommand("spFindRolebyID", connection);
            cmd.CommandType = CommandType.StoredProcedure;
            System.Diagnostics.Debug.WriteLine("hia");
            SqlDataReader read;
            System.Diagnostics.Debug.WriteLine("hia");
            string role= "";
            cmd.Parameters.AddWithValue("@ID", SqlDbType.VarChar).Value = txtUsername.Text;
            read = cmd.ExecuteReader();
            while (read.Read())
            {
                role = read.GetValue(0).ToString();
                System.Diagnostics.Debug.WriteLine(role);
                break;
                //System.Diagnostics.Debug.WriteLine(daysRemain);

            }
            read.Close();

            Session["Role"] = role;
            Server.Transfer("Leave.aspx");
            Server.Transfer("Site.Master");
            System.Diagnostics.Debug.WriteLine(role);
        }

        protected void chkRemember_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
    }
