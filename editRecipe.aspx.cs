using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web2._0Assignment
{
    public partial class editRecipe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            string sql = "SELECT Author, Title, IngredientList, Instructions, CookTime, Servings, Category from VeganRecipes WHERE Id=@Id";
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbmt16abkConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand sqlCmd = new SqlCommand(sql, conn);
            conn.Open();
            sqlCmd.Parameters.AddWithValue("@Id", Request.QueryString["RecipeID"]);
            SqlDataReader sqlDr = sqlCmd.ExecuteReader();
            if (sqlDr.HasRows)
            {
                sqlDr.Read();
                tbTitle.Text = sqlDr["Title"].ToString();
                tbIngredients.Text = sqlDr["IngredientList"].ToString();
                tbInstructions.Text = sqlDr["Instructions"].ToString();
                tbServings.Text = sqlDr["Servings"].ToString();
                tbCookTime.Text = sqlDr["CookTime"].ToString();
                DropDownList1.SelectedValue = sqlDr["Category"].ToString();
                Label1.Text = sqlDr["Author"].ToString();
            }
            if (!(Label1.Text == User.Identity.Name))
            {
                showInfo.Visible = false;
                Label2.Visible = true;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string existingFileName = fupPicture.FileName;
            string pictureFilesFolder = Server.MapPath("Account/PictureFiles");

            if (fupPicture.HasFile)
            {
                fupPicture.SaveAs(pictureFilesFolder + "/" + existingFileName);
            }

            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbmt16abkConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand insert;

            if (fupPicture.HasFile)
            {
                insert = new SqlCommand("UPDATE VeganRecipes SET Picture=@Picture, Title=@Title, IngredientList=@IngredientList, Instructions=@Instructions, Servings=@Servings, CookTime=@CookTime, Category=@Category WHERE Id=@Id", conn);
                insert.Parameters.AddWithValue("@Picture", "Account/PictureFiles/" + fupPicture.FileName);
            }
            else
            {
                insert = new SqlCommand("UPDATE VeganRecipes SET Title=@Title, IngredientList=@IngredientList, Instructions=@Instructions, Servings=@Servings, CookTime=@CookTime, Category=@Category WHERE Id=@Id", conn);

            }
            insert.Parameters.AddWithValue("@Title", tbTitle.Text);
            insert.Parameters.AddWithValue("@IngredientList", tbIngredients.Text);
            insert.Parameters.AddWithValue("@Instructions", tbInstructions.Text);
            insert.Parameters.AddWithValue("@Servings", tbServings.Text);
            insert.Parameters.AddWithValue("@Category", DropDownList1.SelectedValue);
            insert.Parameters.AddWithValue("@CookTime", tbCookTime.Text);
            insert.Parameters.AddWithValue("@Id", Request.QueryString["RecipeID"]);

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

            Response.Redirect("detail.aspx?RecipeID=" + Request.QueryString["RecipeID"]);
        }
    }
}