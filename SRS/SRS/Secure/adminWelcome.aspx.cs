using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SRS
{
    public partial class adminWelcome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!this.IsPostBack)
            {
               // Label1.Text = "Welcome [" + Session["userName"].ToString() + "] as ADMIN";
                appDataSource.SelectCommand = "SELECT [appl_id], (Select sysuser_name from sys_user where  sysuser_id = [appl_sysuser_id]) as sysuser_name, " +
                    "convert(nvarchar(256), [appl_date], 106 ) as [appl_date], " +
                    "(Select estate_type_name from estate_type where estate_type_id = [appl_estate_type_id]) as estate_type_name, " +
                    " [appl_estate_no], [appl_estate_address], [appl_assign_sysuser_id], " +
                    "[appl_assign_date] FROM [user_application] ";
                   // " WHERE appl_sysuser_id=" + Session["userId"];
                populateVolunteers();

            }
        }

        private void populateVolunteers()
        {
            string constr = WebConfigurationManager.ConnectionStrings["SRSDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT [sysuser_id], [sysuser_name] "+
                                            " FROM [sys_user] inner join sys_role on sys_role.sysrole_id = sys_user.sysuser_role_id "+
                                            " WHERE sysrole_name='volunteers'"))
                {
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    ddlvolunteer.DataSource = cmd.ExecuteReader();
                    ddlvolunteer.DataTextField = "sysuser_name";
                    ddlvolunteer.DataValueField = "sysuser_id";
                    ddlvolunteer.DataBind();
                    con.Close();
                }
            }
        }
        

        protected void appGridView_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            // If multiple ButtonField column fields are used, use the
            // CommandName property to determine which button was clicked.
            if (e.CommandName == "doAssign")
            {

                // Convert the row index stored in the CommandArgument
                // property to an Integer.
                int index = Convert.ToInt32(e.CommandArgument);

                // Get the last name of the selected author from the appropriate
                // cell in the GridView control.
                GridViewRow selectedRow = appGridView.Rows[index];
                TableCell contactName = selectedRow.Cells[1];
                string contact = contactName.Text;

                // Display the selected author.
                // Message.Text = "You selected " + contact + ".";

            }
        }
    }
}