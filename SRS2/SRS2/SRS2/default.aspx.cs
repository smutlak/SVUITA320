using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SRS2
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is already loged in or not
            if ((Session["Check"] != null) && (Convert.ToBoolean(Session["Check"]) == true))
            {
                // If User is Authenticated then moved to a main page
                if (User.Identity.IsAuthenticated)
                    Response.Redirect("main_page.aspx");
            }

        }
        protected void Login1_Authenticate1(object sender, AuthenticateEventArgs e)
        {
            Boolean blnresult;
            blnresult = false;

            // Pass UserName  and Password from login1 control to an authentication function which will check will check the user name and password from sql server.
            // Then will retrun a true or false value into blnresult variable
            blnresult = Authentication(Login1.UserName, Login1.Password);

            // If blnresult has a true value then authenticate user 
            if (blnresult == true)
            {
                // This is the actual statement which will authenticate the user
                e.Authenticated = true;

                // Store your authentication mode in session variable 
                Session["Check"] = true;
            }
            else
                // If user faild to provide valid user name and password
                e.Authenticated = false;
        }

        // Function name Authentication which will get check the user_name and passwrod from sql database then return a value true or false
        protected static Boolean Authentication(string username, string password)
        {
            string sqlstring;
            sqlstring = "Select sysuser_name, sysuser_password from [sys_user] where sysuser_name='" + username + "' and sysuser_password ='" + password + "'";

            // create a connection with sqldatabase 
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(
                         " Data Source=SD;Initial Catalog=SRS;User ID=sa;Password=Ab123456;Connect Timeout=10;TrustServerCertificate=True ");

            // create a sql command which will user connection string and your select statement string 
            System.Data.SqlClient.SqlCommand comm = new System.Data.SqlClient.SqlCommand(sqlstring, con);

            // create a sqldatabase reader which will execute the above command to get the values from sqldatabase
            System.Data.SqlClient.SqlDataReader reader;

            // open a connection with sqldatabase
            con.Open();

            // execute sql command and store a return values in reade
            reader = comm.ExecuteReader();

            // check if reader hase any value then return true otherwise return false
            if (reader.Read())
                return true;
            else
                return false;
        }


    }
}