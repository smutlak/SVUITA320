﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SRS
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is already loged in or not
            if ((Session["Check"] != null) && (Convert.ToBoolean(Session["Check"]) == true))
            {
                // If User is Authenticated then moved to a main page
                if (User.Identity.IsAuthenticated)
                    Response.Redirect("adminWelcome.aspx");
            }
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {

            string sqlstring;
            //sqlstring = "Select sysuser_name, sysuser_password from [sys_user] where sysuser_name='" + username + "' and sysuser_password ='" + password + "'";

            sqlstring = "Select usr.sysuser_name, r.sysrole_name" +
                        " from [sys_user] usr inner join [sys_role] r on r.sysrole_id = usr.sysuser_role_id " +
                        " where usr.sysuser_name='" + username + "' and usr.sysuser_password ='" + password + "'";

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
            {
                
                String userName = reader.GetString(1);
                String roleName = reader.GetString(2);

                e.Authenticated = true;
                Session["Check"] = true;
                Session["userName"] = userName;
                Session["roleName"] = roleName;
                
            }
            else
                e.Authenticated = false;
            
        }

    }
}