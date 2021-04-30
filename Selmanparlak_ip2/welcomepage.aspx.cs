using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Selmanparlak_ip2
{
    public partial class welcomepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["username"]==null)
            {
              
                Response.Redirect("home.aspx");
            }
            else
            {
                users.Text = Session["username"].ToString();
            }
        }
    }
}