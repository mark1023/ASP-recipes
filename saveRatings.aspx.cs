using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using System.Data.SqlClient;

namespace Web2._0Assignment
{
    public partial class saveRatings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Single score = Convert.ToSingle(Request.Params["Score"]);
            int thing = Convert.ToInt16(Request.Params["Thing"]);
            string id = User.Identity.GetUserId();

            if (score == 0 || thing == 0 || id == "") return;

            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbmt16abkConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand deleteCmd = new SqlCommand("DELETE FROM Ratings WHERE fk_User=@fk_User AND fk_Recipe=@thing", conn);
            deleteCmd.Parameters.AddWithValue("@fk_User", id);
            deleteCmd.Parameters.AddWithValue("@thing", thing);
            deleteCmd.ExecuteNonQuery();

            SqlCommand insertCmd = new SqlCommand("INSERT INTO Ratings(fk_User, Score, fk_Recipe) VALUES(@fk_user, @Score, @fk_Recipe)", conn);
            insertCmd.Parameters.AddWithValue("@fk_User", id);
            insertCmd.Parameters.AddWithValue("@Score", score);
            insertCmd.Parameters.AddWithValue("@fk_Recipe", thing);
            insertCmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}