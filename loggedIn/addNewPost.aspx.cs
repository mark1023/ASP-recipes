using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Web2._0Assignment
{
    public partial class addNewPost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                                               
        }

        int newRecipeId;

        protected void btnSubmit_Click(object sender, EventArgs e)
        {                        
            string existingFileName = fupPicture.FileName;
            string pictureFilesFolder = Server.MapPath("PictureFiles");

            if (fupPicture.HasFile)
            {
                fupPicture.SaveAs(pictureFilesFolder + "/" + existingFileName);
            }


            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbmt16abkConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand insert = new SqlCommand("insert into VeganRecipes(Title, IngredientList, Instructions, Author, Servings, CookTime, Category, PostDate, Picture) values(@Title, @IngredientList, @Instructions, @Author, @Servings, @CookTime, @Category, @PostDate, @Picture);" + "SELECT CAST(scope_identity() AS int)", conn);
            insert.Parameters.AddWithValue("@Title", tbTitle.Text);
            insert.Parameters.AddWithValue("@IngredientList", tbIngredients.Text);
            insert.Parameters.AddWithValue("@Instructions", tbInstructions.Text);
            insert.Parameters.AddWithValue("@Author", User.Identity.Name);
            insert.Parameters.AddWithValue("@Servings", tbServings.Text);
            insert.Parameters.AddWithValue("@CookTime", tbCookTime.Text);
            insert.Parameters.AddWithValue("@Category", DropDownList1.SelectedValue);
            insert.Parameters.AddWithValue("@PostDate", DateTime.Now);
            insert.Parameters.AddWithValue("@Picture", "loggedIn/PictureFiles/" + fupPicture.FileName);
    
            try
            {
                conn.Open();
                newRecipeId = Convert.ToInt16(insert.ExecuteScalar());
            }
            catch (Exception ex)
            {
                lbl_msg.Text = "Error: " + ex.Message;
                conn.Close();
               
            }
            
         
            conn.Close();

            Response.Redirect("~/newestFirst.aspx");

        }

      


    }
}