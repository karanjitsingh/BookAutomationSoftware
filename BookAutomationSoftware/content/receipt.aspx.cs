using System;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace BookAutomationSoftware.content
{
    public partial class ReceiptPage : System.Web.UI.Page
    {
        public string orderId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["salesid"] != null)
            {
                orderId = Request.QueryString["salesid"];

                try
                {
                    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);
                    SqlCommand cmd = new SqlCommand("select sales.quantity as quant, sales.total_amount as total, inventory.name, inventory.isbn from sales join inventory on sales.book_id = inventory.Id where sales.id = @id", con);

                    cmd.Parameters.AddWithValue("@id", orderId);

                    con.Open();

                    SqlDataReader reader = cmd.ExecuteReader();

                    if(reader.Read())
                    {
                        receipt.Visible = true;
                        lblItem.Text += $"{reader["name"].ToString()} ({reader["isbn"].ToString()})";
                        lblQuantity.Text += reader["quant"].ToString();
                        lblTotal.Text += reader["total"].ToString();
                    }
                }
                catch(Exception ex)
                {

                }
            }
        }
    }
}