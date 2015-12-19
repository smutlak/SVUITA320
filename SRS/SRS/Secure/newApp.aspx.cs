using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace SRS.Secure
{
    public partial class newApp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] == null || !User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/default.aspx");
                return;
            }

            if (!this.IsPostBack)
            {
                this.txtDate.Text = DateTime.Now.ToString("MMMM dd, yyyy");
                this.txtDate.Enabled = false;
                populateEStateType();
            }

        }

        private void populateEStateType()
        {
            string constr = WebConfigurationManager.ConnectionStrings["SRSDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Select estate_type_id ,estate_type_name from estate_type"))
                {
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    ddlStateType.DataSource = cmd.ExecuteReader();
                    ddlStateType.DataTextField = "estate_type_name";
                    ddlStateType.DataValueField = "estate_type_id";
                    ddlStateType.DataBind();
                    con.Close();
                }
            }
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //labelMessage.Text = "Your reservation has been processed.";

                String estateType = ddlStateType.SelectedValue;
                String strStateNo = txtStateNo.Text;
                String strAddress = txtAddress.Text;

                String sqlstring;
                
                sqlstring = "insert into user_application " +
                            " select isnull(max(appl_id), 0)+1, " +
                            Session["userId"] +
                            " ,GETDATE() " +
                            " ,"+estateType +
                            " ,'" + strStateNo + "' " +
                            " ,'" + strAddress + "' " +
                            " ,null " +
                            " ,null " +
                            " from user_application";

                // create a connection with sqldatabase 
                System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(
                    WebConfigurationManager.ConnectionStrings["SRSDB"].ConnectionString);
                // create a sql command which will user connection string and your select statement string 
                System.Data.SqlClient.SqlCommand comm = new System.Data.SqlClient.SqlCommand(sqlstring, con);

                // create a sqldatabase reader which will execute the above command to get the values from sqldatabase
                try
                {
                    con.Open();
                    if (comm.ExecuteNonQuery() > 0)
                    {
                        Response.Redirect("~/Secure/CitizenWelcome.aspx");
                    }
                }
                finally
                {
                    con.Close();
                }
            }
        }
    }

    

}