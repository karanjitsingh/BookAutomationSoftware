using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace BookAutomationSoftware
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["login_session"] != null)
            {
                Response.Redirect("/index.aspx");
            }
        }

        private string GetHash(string password)
        {
            var bytes = new System.Text.UTF8Encoding().GetBytes(password);
            byte[] hashBytes;
            using (var algorithm = new System.Security.Cryptography.SHA512Managed())
            {
                hashBytes = algorithm.ComputeHash(bytes);
            }
            return Convert.ToBase64String(hashBytes);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(txtUsername.Text.Trim() != "" && txtPassword.Text != "")
            {
                bool success = false;
                try
                {
                    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select id, name, access_level from users where username=@user and hash=@hash", con);
                    cmd.Parameters.AddWithValue("@user", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@hash", GetHash(txtPassword.Text));
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        success = true;
                        Session["login_session"] = new LoginSession(reader["name"].ToString(), txtUsername.Text, (AccessLevel)int.Parse(reader["access_level"].ToString()));
                    }
                    con.Close();
                }
                catch(Exception ex)
                {

                }
                if(!success)
                {
                    lblInvalidLogin.Visible = true;
                }
                else
                {
                    Response.Redirect("/index.aspx");
                }
            }
        }
    }
}