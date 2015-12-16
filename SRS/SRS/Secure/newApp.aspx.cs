using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SRS.Secure
{
    public partial class newApp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.txtDate.Text = DateTime.Now.ToString("MMMM dd, yyyy");
            this.txtDate.Enabled = false;

        }
    }
}