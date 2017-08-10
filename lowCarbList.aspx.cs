﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web2._0Assignment
{
    public partial class lowCarbList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSort_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.Value == "newestFirst")
            {
                Response.Redirect("~/CategoryNewestFirst.aspx?Category=low%20carb");
            }
            else if (DropDownList1.SelectedItem.Value == "oldestFirst")
            {
                Response.Redirect("~/CategoryOldestFirst.aspx?Category=low%20carb");
            }
            else if (DropDownList1.SelectedItem.Value == "highRated")
            {
                Response.Redirect("~/CategoryHighestRated.aspx?Category=low%20carb");
            }
            else if (DropDownList1.SelectedItem.Value == "lowRated")
            {
                Response.Redirect("~/CategoryLowestRated.aspx?Category=low%20carb");
            }
            else if (DropDownList1.SelectedItem.Value == "alphabetically")
            {
                Response.Redirect("~/CategoryAlphabetically.aspx?Category=low%20carb");
            }
            else if (DropDownList1.SelectedItem.Value == "shortCook")
            {
                Response.Redirect("~/CategoryShortestTime.aspx?Category=low%20carb");
            }
            else if (DropDownList1.SelectedItem.Value == "longCook")
            {
                Response.Redirect("~/CategoryLongestTime.aspx?Category=low%20carb");
            }
            else if (DropDownList1.SelectedItem.Value == "servesFewest")
            {
                Response.Redirect("~/CategoryServesFewest.aspx?Category=low%20carb");
            }
            else if (DropDownList1.SelectedItem.Value == "servesMost")
            {
                Response.Redirect("~/CategoryServesMost.aspx?Category=low%20carb");
            }
            else
            {
                lbl_msg.Text = "You must select a field from the menu";
            }
        }
    }
}