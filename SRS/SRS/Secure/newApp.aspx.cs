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
            this.txtDate.Text = DateTime.Now.ToString("MMMM dd, yyyy");
            this.txtDate.Enabled = false;

            if (!this.IsPostBack)
            {
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
            }
        }
    }

    

}