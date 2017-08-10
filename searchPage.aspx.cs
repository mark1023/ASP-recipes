using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web2._0Assignment
{
    public partial class searchPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_searchResult.Text = "'" + Request.QueryString["query"] + "'";
        }
    }
}