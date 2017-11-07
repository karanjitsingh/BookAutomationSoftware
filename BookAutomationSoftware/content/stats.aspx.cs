using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookAutomationSoftware
{
    public partial class StatsPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login_session"] != null)
            {
                LoginSession ls = (LoginSession)Session["login_session"];
                if (ls.accessLevel != AccessLevel.Manager)
                    Response.Redirect("/index.aspx");
            }
            else
            {
                Response.Redirect("/index.aspx");
            }

            revenueStats.DataBind();
            sqlInventoryLevel.DataBind();
        }

        protected void calFrom_SelectionChanged(object sender, EventArgs e)
        {
            revenueStats.DataBind();
            sqlInventoryLevel.DataBind();
        }

        protected void txtThreshold_TextChanged(object sender, EventArgs e)
        {
            revenueStats.DataBind();
            sqlInventoryLevel.DataBind();
        }
    }
}