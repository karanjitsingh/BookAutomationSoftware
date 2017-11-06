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
            revenueStats.DataBind();
        }

        protected void calFrom_SelectionChanged(object sender, EventArgs e)
        {
            revenueStats.DataBind();
        }
    }
}