﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration; 

namespace SRS
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            String sqlstring;
           // sqlstring = "insert into sys_user values ((select max(sysuser_id)+1 from sys_user),'" +
           //     CreateUserWizard1.UserName + "','" + CreateUserWizard1.Password + "','1', GETDATE(), 3);";

            //SQL 2005 version
            sqlstring = "insert into sys_user select max(sysuser_id)+1, '" +
                CreateUserWizard1.UserName + "','" + CreateUserWizard1.Password +
                "', GETDATE(), (Select top 1 sysrole_id from sys_role where sysrole_name='Applicant') from sys_user ";

            // create a connection with sqldatabase 
            //System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(
             //            " Data Source=SD;Initial Catalog=SRS;User ID=sa;Password=Ab123456;Connect Timeout=10;TrustServerCertificate=True ");
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
                }
            }
            finally
            {
                con.Close();
            }

        }
    }
}