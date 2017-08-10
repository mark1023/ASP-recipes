<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="Web2._0Assignment.Detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbmt16abkConnectionString %>" SelectCommand="SELECT [Author], [Id], [IngredientList], [Instructions], [Picture], [Title], [CookTime], [Servings], [Category], [AverageScore] FROM [RecipesPlusRatings] WHERE ([Id] = @Id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Id" QueryStringField="RecipeID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
   
    <p> 
        
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbmt16abkConnectionString %>" SelectCommand="SELECT DISTINCT [TagName], [Id] FROM [Tags] ORDER BY [TagName]"></asp:SqlDataSource>
        
              
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="container">
                    <div class="row">
                    <div class="col-md-12">
                    <p style="font-family:'Times New Roman'; font-weight:bold; font-size:45px">
                        <%# Eval("Title") %> &nbsp <asp:HyperLink Font-Size="Small" ID="Hyperlink1" runat="server" NavigateUrl='<%# Eval("Id", "editRecipe.aspx?RecipeID={0}") %>'><span style="font-size:10px" class="glyphicon glyphicon-pencil"></span>&nbsp Edit Recipe</asp:HyperLink>
                    </p>                       
                        </div>
                            
                        </div>
                    <div class="row">
                    <div class="col-md-4">                      
                        <input value='<%# Eval("AverageScore") %>' class="rating" data-readonly="true" data-min="0" data-max="5" data-step="0.5" data-size="xs" />                                
                        </div>
                    <div class="col-md-2">
                        <span class="glyphicon glyphicon-ok"></span> <i style="font-family:'Times New Roman'; font-weight:bold; font-size:25px"><%# Eval("Category") %></i> 
                    </div>
                        </div>
                    <br />
                    <div class="row">
                    <div class="col-md-12">
                    <h5 style ="font-family:'Times New Roman'; font-weight:bold; font-size:18px">
                        By <%# Eval("Author") %> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="glyphicon glyphicon-user"></span> <i>Serves: </i> <%# Eval("Servings") %><i> people</i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class="glyphicon glyphicon-time"></span> <i>Cook Time: </i> <%# Eval("CookTime") %> <i>minutes</i> <img style="float:right; width: 400px; height: 400px; padding-left:2em" src='<%# Eval("Picture") %>' />
                    </h5> 
                    <br />
                                                                                       
                    <h3 style ="font-family:'Times New Roman'; font-weight:bold">
                        Ingredients
                    </h3>                      
                    <p>
                        <%# Eval("IngredientList") %>
                    </p> 
                    <br />
                    <br /> 
                    <br />               
                    <h3 style ="font-family:'Times New Roman'; font-weight:bold">
                        Instructions
                    </h3>
                    <p>
                        <%# Eval("Instructions") %>
                    </p>
                    </div>
                    </div>
               </div>
              
            </ItemTemplate>
        </asp:Repeater> 
        </p>
    <br />

    <div class="container">
        <div class="row">
           <div class="col-md-12">
               <h3 style="font-family:'Times New Roman'; font-weight:bold">Tags</h3>
           </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:ListView runat="server" DataSourceID="SqlDataSource4">
                <LayoutTemplate>
                    <table>
                        <tr>
                            <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>             
                        </tr>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>  
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("TagName","RecipesByTag.aspx?Tag={0}")%>'>
                            <p><%# Eval("TagName") %>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>
                        </asp:HyperLink> 
                   </td>       
                </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
     


    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dbmt16abkConnectionString %>" SelectCommand="SELECT DISTINCT [TagName] FROM [vwRecipesAndTags] WHERE ([Id] = @Id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Id" QueryStringField="RecipeID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


    
                                    
    <br />
    <br />
    <br />

    <hr style="height:2px; background-color:#89be3d">
  
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbmt16abkConnectionString %>" SelectCommand="SELECT [PostingTime], [Author], [Body], [Title] FROM [Comment] WHERE ([Recipe_FKid] = @Recipe_FKid)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Recipe_FKid" QueryStringField="RecipeID" Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>

    <p>

        &nbsp;</p>
    <asp:PlaceHolder runat="server" ID="hidden">
    <div class="container">
       <div class="row">
            <div class="col-md-12">
                <h3 style="font-family:'Times New Roman'; font-weight:bold">
                    Add a Rating
                </h3>
        <asp:PlaceHolder runat="server" id="jsRaterArea">
                        <input id="superRater" type="number" class="rating" min="0" max="5" data-step="0.5" data-size="xs" />
                    </asp:PlaceHolder> 
                </div>
            </div> 
    </div>

    <br />

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3 style="font-family:'Times New Roman'; font-weight:bold">Add Tags</h3>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
           
    <p>

        <asp:CheckBoxList ID="tagCheckboxList" runat="server" DataSourceID="SqlDataSource3" DataTextField="TagName" DataValueField="Id" RepeatDirection="Horizontal" RepeatColumns="10" TextAlign="Left">
        </asp:CheckBoxList>

    </p>
    <p>

        &nbsp;</p>

               
    
    <p style="font-family:'Times New Roman'; font-weight:bold; font-size:18px">
        Add Your Own Tags (Separated By Commas):
        <asp:TextBox ID="tbNewTags" runat="server" Width="310px"></asp:TextBox>
        <asp:Button ID="btnNewTags" runat="server" OnClick="btnNewTags_Click" Text="Add Tags" />
    </p>

                </div>
            </div>
        </div>
        </asp:PlaceHolder>
   
    <p>

        &nbsp;</p>

    <hr style="height:2px; background-color:#89be3d">
    <br />

 
        <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 style="font-family:'Times New Roman'; font-weight:bold">Comments</h2>
                    

         <asp:Label ID="commentsLabel" runat="server" style="font-family:'Times New Roman'; font-size:15px">You must be logged in to view/add comments</asp:Label>

        
         <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                    <AlternatingItemTemplate>
                       <br />
                            <div class="container" style="background-color:#ffe5c2; border-radius:35px">                                          
                    <div>
                        <div class="row">
                            <div class="col-md-12"><h4 style="font-family:'Times New Roman'; font-weight:bold"><%# Eval("Title") %></h4></div>
                        </div>
                        <div class="row">
                            <div class="col-md-2"><p><%# Eval("Author") %></p></div>
                            <div class="col-md-2"><p><%# Eval("PostingTime") %></p></div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <p><i><%# Eval("Body") %></i></p>
                            </div>
                        </div>
                    </div>
                </div>

                       <br />                       

                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <span style="background-color: #008A8C;color: #FFFFFF;">PostingTime:
                        <asp:TextBox ID="PostingTimeTextBox" runat="server" Text='<%# Bind("PostingTime") %>' />
                        <br />
                        Author:
                        <asp:TextBox ID="AuthorTextBox" runat="server" Text='<%# Bind("Author") %>' />
                        <br />
                        Body:
                        <asp:TextBox ID="BodyTextBox" runat="server" Text='<%# Bind("Body") %>' />
                        <br />
                        Title:
                        <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        <br /><br /></span>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <span>No data was returned.</span>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <span style="">PostingTime:
                        <asp:TextBox ID="PostingTimeTextBox" runat="server" Text='<%# Bind("PostingTime") %>' />
                        <br />Author:
                        <asp:TextBox ID="AuthorTextBox" runat="server" Text='<%# Bind("Author") %>' />
                        <br />Body:
                        <asp:TextBox ID="BodyTextBox" runat="server" Text='<%# Bind("Body") %>' />
                        <br />Title:
                        <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        <br /><br /></span>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <br />
    
                            <div class="container" style="background-color:#dbebc4; border-radius:35px">                                          
                        <div>
                        <div class="row">
                            <div class="col-md-12"><h4 style="font-family:'Times New Roman'; font-weight:bold"><%# Eval("Title") %></h4></div>
                        </div>
                        <div class="row">
                            <div class="col-md-2"><p><%# Eval("Author") %></p></div>
                            <div class="col-md-2"><p><%# Eval("PostingTime") %></p></div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <p><i><%# Eval("Body") %></i></p>
                            </div>
                        </div>
                    </div>
                </div>
              
                        <br />
                      
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <span runat="server" id="itemPlaceholder" />
                        </div>
                        <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                        </div>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <span style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">PostingTime:
                        <asp:Label ID="PostingTimeLabel" runat="server" Text='<%# Eval("PostingTime") %>' />
                        <br />
                        Author:
                        <asp:Label ID="AuthorLabel" runat="server" Text='<%# Eval("Author") %>' />
                        <br />
                        Body:
                        <asp:Label ID="BodyLabel" runat="server" Text='<%# Eval("Body") %>' />
                        <br />
                        Title:
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                        <br />
<br /></span>
                    </SelectedItemTemplate>
            
            </asp:ListView>

     <div style="float:right">
        <asp:DataPager ID="DataPager1" runat="server" PageSize="5" PagedControlID="ListView1">
        <Fields>
            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="True" />
            <asp:NumericPagerField />
            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="True" ShowPreviousPageButton="False" />
        </Fields>
    </asp:DataPager>
         </div>
    
    <p>

        &nbsp;</p>
    <p>

        &nbsp;</p>


    <asp:LoginView ID="LoginView1" runat="server">
        <LoggedInTemplate>

    <div class="tbRight">
        <h3 style="font-family:'Times New Roman'">Add a Comment</h3>

    </div>
    <br />
         
        <div class="tbRight">
            <p style="font-family:'Times New Roman'; font-size:15px; font-weight:bold"> Title</p>
            <asp:TextBox ID="tbCommentTitle" runat="server" TextMode="MultiLine" Width="290px"></asp:TextBox>
        </div> 
        


        <br />
        <br />
             
        <div class="tbRight">
            <p style="font-family:'Times New Roman'; font-size:15px; font-weight:bold">Body</p>
        
            <asp:TextBox ID="tbCommentBody" runat="server" TextMode="MultiLine" Width="290px" Height="66px"></asp:TextBox>
        </div> 
        


        <br />
            <br />

        
        
        <div class="tbRight">
            <asp:Button ID="btnCommentSubmit" runat="server" OnClick="btnCommentSubmit_Click1" Text="Add Comment" Height="42px" Width="113px" />       
        <asp:Label ID="lbl_msg" runat="server"></asp:Label>
            </div>
             
        
       
   
        </LoggedInTemplate>
    </asp:LoginView>
                </div>
            </div>
            </div>


    





    <script>
        jQuery(document).ready(function () {
            $('#superRater').rating();            
        });        

        $('#superRater').on('rating.change', function (event, value, caption) {
            var rId = getUrlVars()["RecipeID"];
            var rating = $('#superRater').val();
            

            $.get('saveRatings.aspx',
            {
                Thing: rId,
                Score: rating

            });

            window.location.href = window.location;
            

            
 
            var ratingValue = $('#superRater').rating('refresh', {
                disabled: true,
                showClear: false,
                showCaption: true
            }).val();
            reset
            
            
        });       
       

        function getUrlVars() {
            var vars = [], hash;
            var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
            for (var i = 0; i < hashes.length; i++) {
                hash = hashes[i].split('=');
                vars.push(hash[0]);
                vars[hash[0]] = hash[1];
            }
            return vars;
        }

    </script>

</asp:Content>


