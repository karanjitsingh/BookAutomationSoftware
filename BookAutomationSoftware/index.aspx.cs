using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text.RegularExpressions;
using System.Drawing;

namespace BookAutomationSoftware
{
    public partial class IndexPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString[null] == "request")
            {
                simpleSearch.Visible = false;
                requestForm.Visible = true;
                requestComeplete.Visible = false;
            }
            else
            {
                simpleSearch.Visible = true;
                requestForm.Visible = false;
                requestComeplete.Visible = false;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtSearch.Text.Trim() == "")
                return;
            bool success = false;

            try
            {
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from inventory where name like @q", con);

                if(Regex.Match(txtSearch.Text.Trim(), "[0-9]{1}-[0-9]{2}-[0-9]{5}-[0-9]{2}-[0-9]").Success || Regex.Match(txtSearch.Text.Trim(), "[0-9]{13}").Success)
                {
                    cmd.CommandText = "select * from inventory where isbn = @q";
                    cmd.Parameters.AddWithValue("@q", txtSearch.Text.Trim().Replace("-",""));
                }
                else
                {
                    cmd.Parameters.AddWithValue("@q", "%" + txtSearch.Text.Trim() + "%");
                }

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    success = true;
                    lblBookName.Text = reader["name"].ToString();
                    lblAuthor.Text = reader["author"].ToString();
                    lblPublisher.Text = reader["publisher"].ToString();
                    lblPrice.Text = reader["price"].ToString();
                    if(int.Parse(reader["stock"].ToString()) > 0)
                    {
                        lblStock.Text = "In stock";
                        lblStock.ForeColor = Color.DarkGreen;
                    }
                    else
                    {
                        lblStock.Text = "Out of stock";
                        lblStock.ForeColor = Color.DarkRed;


                        cmd.CommandText = $"update inventory set request = {reader["request"].ToString()} + 1 where id={reader["id"].ToString()}";
                        reader.Close();
                        cmd.ExecuteNonQuery();
                    }
                    imgBookImage.ImageUrl = $"http://covers.openlibrary.org/b/isbn/{reader["isbn".ToString()]}-L.jpg";
                }
                con.Close();
            }
            catch (Exception ex)
            {

            }

            if(success)
            {
                resultDiv.Visible = true;
                noResultsDiv.Visible = false;
            }
            else
            {
                noResultsDiv.Visible = true;
                resultDiv.Visible = false;
            }

            requestDiv.Visible = true;
        }

        protected void btnRequest_Click(object sender, EventArgs e)
        {
            bool success = false;
            try
            {
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);
                con.Open();

                SqlCommand cmd = new SqlCommand("insert into book_requests(id,isbn,author,publisher,user_email,book_name) " +
                    "values(COALESCE((select max(id) from book_requests), 0) + 1, @isbn, @author, @publisher, @email, @name)", con);

                cmd.Parameters.AddWithValue("@isbn", txtRequestISBN.Text.Trim().Replace("-", ""));
                cmd.Parameters.AddWithValue("@author", txtRequestAuthor.Text.Trim());
                cmd.Parameters.AddWithValue("@publisher", txtRequestPublisher.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txtRequestPublisher.Text.Trim());
                cmd.Parameters.AddWithValue("@name", txtRequestBook.Text.Trim());

                cmd.ExecuteNonQuery();

                con.Close();

                success = true;
            }
            catch (Exception ex)
            {

            }

            if(success)
            {
                requestForm.Visible = false;
                requestComeplete.Visible = true;
            }
        }
    }
}