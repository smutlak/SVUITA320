using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SRS
{
    public partial class signout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] != null)
            {
                
                Session["Check"] = false;
                Session["roleName"] = null;
                Label1.Text = "Good bye [" + Session["userName"].ToString() + "]. You can ";
                Session["userName"] = null;
                System.Web.Security.FormsAuthentication.SignOut();
                Session.Abandon();
            }
            else
            {
                Label1.Text = "Good bye. You can ";
            }
        }
    }
}