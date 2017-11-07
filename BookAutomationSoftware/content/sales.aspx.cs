using System;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace BookAutomationSoftware
{
    public partial class SalesPage : System.Web.UI.Page
    {
        private decimal validPrice = -1;
        private string validID = "";
        private int stock;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login_session"] != null)
            {
                LoginSession ls = (LoginSession)Session["login_session"];
                if (ls.accessLevel < AccessLevel.Employee)
                    Response.Redirect("/index.aspx");
            }
            else
            {
                Response.Redirect("/index.aspx");
            }

            if (Request.QueryString["isbn"] != null)
            {
                txtISBN.Text = Request.QueryString["isbn"];
            }


        }

        private bool checkAvailability(string isbn)
        {
            try
            {
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);
                SqlCommand cmd = new SqlCommand("select id,price,stock from inventory where isbn = @isbn", con);
                cmd.Parameters.AddWithValue("@isbn", isbn);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                validID = "";
                validPrice = -1;

                if(reader.Read())
                {
                    validID = reader["id"].ToString();
                    validPrice = decimal.Parse(reader["price"].ToString());
                    stock = int.Parse(reader["stock"].ToString());
                    if (stock == 0)
                        return false;
                    return true;
                }
            }
            catch(Exception ex)
            {
            }
            return false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(checkAvailability(txtISBN.Text.Trim()))
            {

                string id = "";
                try
                {
                    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);
                    SqlCommand cmd = new SqlCommand("insert into sales(id,book_id,quantity,total_amount,date) values(coalesce((select max(id) from sales),0) + 1, @id, @quantity, @total, @date); update inventory set stock = stock -1 where id = @id;select max(id) as newid from sales;", con);


                    cmd.Parameters.AddWithValue("@id", validID);
                    cmd.Parameters.AddWithValue("@quantity", txtQuant.Text.Trim());
                    cmd.Parameters.AddWithValue("@total", validPrice * int.Parse(txtQuant.Text.Trim()));
                    cmd.Parameters.AddWithValue("@date", DateTime.Now);


                    con.Open();
                    SqlDataReader reader= cmd.ExecuteReader();
                    if (!reader.Read())
                        return;
                    else
                        id = reader["newid"].ToString();
                }
                catch (Exception ex)
                {
                    return;
                }

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "window.open('/content/receipt.aspx?salesid=" + id + "','_blank')", true);
                lblAvailable.Visible = false;
            }
            else
            {
                lblAvailable.Visible = true;
            }
        }
    }
}