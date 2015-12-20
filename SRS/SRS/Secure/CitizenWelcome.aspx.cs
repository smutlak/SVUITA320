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
            if (Session["userId"] == null || !User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/default.aspx");
                return;
            }
            if (!this.IsPostBack)
            {
                //Label1.Text = "Welcome [" + Session["userName"].ToString() + "] as CITIZEN";
                appDataSource.SelectCommand = "SELECT [appl_id], [appl_sysuser_id], " +
                    "convert(nvarchar(256), [appl_date], 106 ) as [appl_date], " +
                    "(Select estate_type_name from estate_type where estate_type_id = [appl_estate_type_id]) as estate_type_name, " +
                    " [appl_estate_no], [appl_estate_address], (Select sysuser_name from sys_user where  sysuser_id = [appl_assign_sysuser_id]) as assignee_user_name, " +
                    "convert(nvarchar(256), [appl_assign_date], 106 ) as [assign_date] FROM [user_application] " +
                    " WHERE appl_sysuser_id=" + Session["userId"];
            }
        }

    }
}