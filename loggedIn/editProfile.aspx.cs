using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web2._0Assignment.Account
{
    public partial class editProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            
            string sql = "SELECT ProfilePic, FirstName, LastName, IntroduceYourself from UserProfile WHERE fkUserName=@fkUserName";
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbmt16abkConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand sqlCmd = new SqlCommand(sql, conn);
            conn.Open();
            sqlCmd.Parameters.AddWithValue("@fkUserName", User.Identity.Name);
            SqlDataReader sqlDr = sqlCmd.ExecuteReader();
            if (sqlDr.HasRows)
            {
                sqlDr.Read();
                tbFirstName.Text = sqlDr["FirstName"].ToString();
                tbLastName.Text = sqlDr["LastName"].ToString();
                tbIntroduceYourself.Text = sqlDr["IntroduceYourself"].ToString();
            }
            
            
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string existingFileName = fuProfilePic.FileName;
            string pictureFilesFolder = Server.MapPath("PictureFiles");

            if (fuProfilePic.HasFile)
            {
                fuProfilePic.SaveAs(pictureFilesFolder + "/" + existingFileName);
            }


            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbmt16abkConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand insert;

            if (fuProfilePic.HasFile)
            {
                insert = new SqlCommand("UPDATE UserProfile SET ProfilePic=@ProfilePic, FirstName=@FirstName, LastName=@LastName, IntroduceYourself=@IntroduceYourself WHERE fkUserName=@fkUserName", conn);
                insert.Parameters.AddWithValue("@ProfilePic", "PictureFiles/" + fuProfilePic.FileName);              
            }
            else
            {           
                insert = new SqlCommand("UPDATE UserProfile SET FirstName=@FirstName, LastName=@LastName, IntroduceYourself=@IntroduceYourself WHERE fkUserName=@fkUserName", conn);
                
            }
            insert.Parameters.AddWithValue("@FirstName", tbFirstName.Text);
            insert.Parameters.AddWithValue("@LastName", tbLastName.Text);
            insert.Parameters.AddWithValue("@IntroduceYourself", tbIntroduceYourself.Text);
            insert.Parameters.AddWithValue("@fkUserName", User.Identity.Name);

            try
            {
                conn.Open();
                insert.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ex)
            {
                lbl_msg.Text = "Error: " + ex.Message;

            }

            Response.Redirect("profilePage.aspx?UserName=" + Context.User.Identity.Name);
               
            
        }
    }
}