using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace SRS
{
    public partial class CitizenWelcome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                Label1.Text = "Welcome [" + Session["userName"].ToString() + "] as CITIZEN";
                appDataSource.SelectCommand = "SELECT [appl_id], [appl_sysuser_id], [appl_date], " +
                    "[appl_estate_type_id], [appl_estate_no], [appl_estate_address], [appl_assign_sysuser_id], " +
                    "[appl_assign_date] FROM [user_application] " +
                    " WHERE appl_sysuser_id=" + Session["userId"];
                //populateApplications();
            }
        }

        /*private void populateApplications()
        {
            string constr = WebConfigurationManager.ConnectionStrings["SRSDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
         * 
                using (SqlCommand cmd = new SqlCommand("SELECT [appl_id] " +
                                                      ",[appl_sysuser_id] " +
                                                      ",[appl_date] " +
                                                      ",[appl_estate_type_id] " +
                                                      ",[appl_estate_no] " +
                                                      ",[appl_estate_address] " +
                                                      ",[appl_assign_sysuser_id] " +
                                                      ",[appl_assign_date] " +
                                                  "FROM [user_application]"))
                {
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    GridView1.DataSource = cmd.ExecuteReader();
                    ddlStateType.DataTextField = "estate_type_name";
                    ddlStateType.DataValueField = "estate_type_id";
                    ddlStateType.DataBind();
                    con.Close();
                }
            }
        }*/
    }
}