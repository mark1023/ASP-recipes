using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web2._0Assignment
{
    public partial class longestTime : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSort_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.Value == "newestFirst")
            {
                Response.Redirect("~/newestFirst.aspx");
            }
            else if (DropDownList1.SelectedItem.Value == "oldestFirst")
            {
                Response.Redirect("~/oldestFirst.aspx");
            }
            else if (DropDownList1.SelectedItem.Value == "highRated")
            {
                Response.Redirect("~/highestRated.aspx");
            }
            else if (DropDownList1.SelectedItem.Value == "lowRated")
            {
                Response.Redirect("~/lowestRated.aspx");
            }
            else if (DropDownList1.SelectedItem.Value == "alphabetically")
            {
                Response.Redirect("~/Recipes.aspx");
            }
            else if (DropDownList1.SelectedItem.Value == "shortCook")
            {
                Response.Redirect("~/shortestTime");
            }
            else if (DropDownList1.SelectedItem.Value == "servesFewest")
            {
                Response.Redirect("~/servesFewest");
            }
            else if (DropDownList1.SelectedItem.Value == "servesMost")
            {
                Response.Redirect("~/servesMost");
            }
            else
            {
                lbl_msg.Text = "You must select a field from the menu";
            }
        }
    }
}