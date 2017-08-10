using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Microsoft.AspNet.Identity;

namespace Web2._0Assignment
{
    public partial class Detail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
            {
                hidden.Visible = false;
                jsRaterArea.Visible = false;
                tbNewTags.Visible = false;
                btnNewTags.Visible = false;
                commentsLabel.Visible = true;
                ListView1.Visible = false;                               
            }

            if (User.Identity.IsAuthenticated) commentsLabel.Visible = false;

            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbmt16abkConnectionString"].ConnectionString;
        }

        protected void btnCommentSubmit_Click1(object sender, EventArgs e)
        {
            TextBox tbCommentTitle = (TextBox)LoginView1.FindControl("tbCommentTitle");
            TextBox tbCommentBody = (TextBox)LoginView1.FindControl("tbCommentBody");
            Label lbl_msg = (Label)LoginView1.FindControl("lbl_msg");

            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbmt16abkConnectionString"].ConnectionString;

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand insert = new SqlCommand("insert into Comment(Title, Body, Author, PostingTime, Recipe_FKid) values(@Title, @Body, @Author, @PostingTime, @Recipe_FKid)", conn);
            insert.Parameters.AddWithValue("@Title", tbCommentTitle.Text);
            insert.Parameters.AddWithValue("@Body", tbCommentBody.Text);
            insert.Parameters.AddWithValue("@Author", User.Identity.Name);
            insert.Parameters.AddWithValue("@PostingTime", DateTime.Now);
            insert.Parameters.AddWithValue("@Recipe_FKid", Request.QueryString["RecipeID"]);          

            try
            {
                conn.Open();
                insert.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                lbl_msg.Text = "Error: " + ex.Message;
                conn.Close();
            }

            

            Response.Redirect("Detail.aspx?RecipeID=" + Request.QueryString["RecipeID"]);
        }


        protected void btnNewTags_Click(object sender, EventArgs e)
        {

            string[] newTags = tbNewTags.Text.Split(',');

            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbmt16abkConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            for (int ct = 0; ct < tagCheckboxList.Items.Count; ct++)
            {
                if (tagCheckboxList.Items[ct].Selected)
                {
                    connectTagAndRecipe(Convert.ToInt16(tagCheckboxList.Items[ct].Value), Convert.ToInt16(Request.QueryString["RecipeID"]), conn);
                }            
                
            }

            if (tbNewTags.Text == "") return;

            foreach (string tag in newTags)
            {
                int id = getIdForTag(tag, conn);
                int recipeId = Convert.ToInt16(Request.QueryString["RecipeID"]);


                if (id > 0)
                {
                    connectTagAndRecipe(id, recipeId, conn);
                    
                }
                else
                {
                    int newTagId = addTagToDb(tag, conn);
                    connectTagAndRecipe(newTagId, recipeId, conn);
                }
            }

            Response.Redirect("Detail.aspx?RecipeID=" + Request.QueryString["RecipeID"]);


        }

        protected int addTagToDb(string tag, SqlConnection conn)
        {
            string addTagSql = "INSERT INTO Tags (TagName) VALUES (@TagName)";
            SqlCommand sqlCmd = new SqlCommand(addTagSql, conn);
            sqlCmd.Parameters.AddWithValue("@TagName", tag);
            sqlCmd.ExecuteNonQuery();
            string lastRecordAddedSql = "SELECT TOP 1 Id FROM Tags ORDER BY Id DESC";
            SqlCommand sqlCmd2 = new SqlCommand(lastRecordAddedSql, conn);
            SqlDataReader sqldr = sqlCmd2.ExecuteReader();
            sqldr.Read();
            int retval = Convert.ToInt16(sqldr["Id"]);
            sqldr.Close();
            return retval;

        }

        protected void connectTagAndRecipe(int tagId, int recipeId, SqlConnection conn)
        {
            int checker = checkTagRecipeDuplicate(tagId, recipeId, conn);
            if(checker < 0)
            {
                string addTagRecipeConnectionSql = "INSERT INTO TagRecipeJunction (Tag_FKid, Recipe_FKid) VALUES (@Tag_FKid, @Recipe_FKid)";
                SqlCommand sqlCmd = new SqlCommand(addTagRecipeConnectionSql, conn);
                sqlCmd.Parameters.AddWithValue("@Tag_FKid", tagId);
                sqlCmd.Parameters.AddWithValue("@Recipe_FKid", recipeId);
                sqlCmd.ExecuteNonQuery();
            }
            else
            {
                return;
            }
        }

        protected int getIdForTag(string tagName, SqlConnection conn)
        {
            int retval = -1;
            string findTagSql = "SELECT Id from Tags WHERE TagName = @TagName";
            SqlCommand sqlCmd = new SqlCommand(findTagSql, conn);
            sqlCmd.Parameters.AddWithValue("@TagName", tagName);
            SqlDataReader sqldr = sqlCmd.ExecuteReader();

            if (sqldr.HasRows)
            {
                sqldr.Read();
                retval = Convert.ToInt16(sqldr["Id"]);
            }
            sqldr.Close();
            return retval;
        }

        protected int checkTagRecipeDuplicate(int tag_fkid, int recipe_fkid, SqlConnection conn)
        {
            int retval = -1;
            string junctionId = "SELECT Id from TagRecipeJunction WHERE Tag_FKid=@Tag_FKid AND Recipe_FKid=@Recipe_FKid";
            SqlCommand sqlCmd = new SqlCommand(junctionId, conn);
            sqlCmd.Parameters.AddWithValue("@Tag_FKid", tag_fkid);
            sqlCmd.Parameters.AddWithValue("@Recipe_FKid", recipe_fkid);
            SqlDataReader sqldr = sqlCmd.ExecuteReader();

            if(sqldr.HasRows)
            {
                retval = 1;
            }
            sqldr.Close();
            return retval;
        }

        
    }
} 
