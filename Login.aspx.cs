using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace schedule
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Visible = false; // Hide error message on page load

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Check static credentials
            if (username == "admin" && password == "1234")
            {
                // Redirect to AdminPage.aspx
                Response.Redirect("AdminPage.aspx");
            }
            else
            {
                // Display error message
                lblError.Text = "Invalid username or password!";
                lblError.Visible = true;
            }
        }
        }
}