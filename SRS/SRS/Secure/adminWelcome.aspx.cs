using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
                Label1.Text = "Welcome [" + Session["userName"].ToString() + "] as ADMIN";
                appDataSource.SelectCommand = "SELECT [appl_id], [appl_sysuser_id], [appl_date], " +
                    "[appl_estate_type_id], [appl_estate_no], [appl_estate_address], [appl_assign_sysuser_id], " +
                    "[appl_assign_date] FROM [user_application] ";
                    //" WHERE appl_sysuser_id=" + Session["userId"];

            }
        }
    }
}