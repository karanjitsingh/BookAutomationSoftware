using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookAutomationSoftware
{
    public partial class Site : System.Web.UI.MasterPage
    {
        LoginSession loginSession;

        private void checkCurrentLink(HyperLink link)
        {
            link.CssClass = "";
            switch (link.Text)
            {
                case "Home":
                    if (masterContent.Page is IndexPage)
                        link.CssClass = "selected";
                    break;
                case "Sales":
                    if(masterContent.Page is SalesPage)
                        link.CssClass = "selected";
                    break;
                case "Inventory":
                    if (masterContent.Page is InventoryPage)
                        link.CssClass = "selected";
                    break;
                case "Stats":
                    if (masterContent.Page is StatsPage)
                        link.CssClass = "selected";
                    break;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString[null] == "logout")
            {
                Session["login_session"] = null;
            }


            if(Session["login_session"]!=null)
            {
                loginSession = (LoginSession)Session["login_session"];
            }
            else
            {
                loginSession = new LoginSession();
            }

            if(this.loginSession.loggedIn)
            {
                lblWelcomeText.Visible = true;
                hypSignin.Visible = false;
                hypSignout.Visible = true;
                lblWelcomeText.Text = "Hi, " + loginSession.user;
            }
            else
            {
                lblWelcomeText.Visible = false;
                hypSignin.Visible = true;
                hypSignout.Visible = false;
            }

            foreach(var control in navLinks.Controls)
            {
                if (control is HyperLink)
                {
                    HyperLink link = (HyperLink)control;
                    if ((AccessLevel)int.Parse(link.Attributes["AccessLevel"]) <= loginSession.accessLevel)
                    {
                        link.Visible = true;
                        checkCurrentLink(link);
                    }
                    else
                    {
                        link.Visible = false;
                    }
                }
            }
        }
    }
}