using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace BookAutomationSoftware
{
    public partial class InventoryPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsertRow_Click(object sender, EventArgs e)
        {
            try
            {

                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);
                SqlCommand cmd = new SqlCommand("insert into inventory(id,name,isbn,author,publisher,rack_id,stock,request,price) values(coalesce((select max(id) from inventory),0) + 1,@name,@isbn,@author,@publisher,@rack_id,@stock,0,@price)", con);

                con.Open();

                cmd.Parameters.AddWithValue("@name", ((TextBox)gridview.FooterRow.FindControl("txtInsertName")).Text.Trim());
                cmd.Parameters.AddWithValue("@isbn", ((TextBox)gridview.FooterRow.FindControl("txtInsertISBN")).Text.Trim());
                cmd.Parameters.AddWithValue("@author", ((TextBox)gridview.FooterRow.FindControl("txtInsertAuthor")).Text.Trim());
                cmd.Parameters.AddWithValue("@publisher", ((TextBox)gridview.FooterRow.FindControl("txtInsertPublisher")).Text.Trim());
                cmd.Parameters.AddWithValue("@stock", ((TextBox)gridview.FooterRow.FindControl("txtInsertStock")).Text.Trim());
                cmd.Parameters.AddWithValue("@rack_id", ((TextBox)gridview.FooterRow.FindControl("txtInsertRack")).Text.Trim());
                cmd.Parameters.AddWithValue("@price", ((TextBox)gridview.FooterRow.FindControl("txtInsertPrice")).Text.Trim());

                cmd.ExecuteNonQuery();
            }
            catch(Exception ex)
            {

            }

            gridview.DataBind();

        }

        protected void gridview_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int i = e.RowIndex;

            string id = ((Label)gridview.Rows[i].FindControl("lblID")).Text;
            string stock = ((TextBox)gridview.Rows[i].FindControl("txtUpdateStock")).Text;

            sqlDataSource.UpdateParameters["id"].DefaultValue = id;
            sqlDataSource.UpdateParameters["stock"].DefaultValue = stock;

            gridview.DataBind();
        }
    }
}