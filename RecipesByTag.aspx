<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecipesByTag.aspx.cs" Inherits="Web2._0Assignment.RecipesByTag" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbmt16abkConnectionString %>" SelectCommand="SELECT [Author], [Id], [IngredientList], [Instructions], [Picture], [CookTime], [Title], [PostDate], [AverageScore], [Category], [TagName], [Servings] FROM [RecipesAndTagsAndAverageScore] WHERE ([TagName] = @TagName)">
         <SelectParameters>
             <asp:QueryStringParameter Name="TagName" QueryStringField="Tag" Type="String" />
         </SelectParameters>
     </asp:SqlDataSource>
   
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 style="font-family:'Times New Roman'; font-size:45px">Recipes With Tag: <asp:Label ID="tag_lbl" runat="server" Text="Label"></asp:Label> </h1>        
            </div>
        </div>
    </div>

   
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            
                <br />
                <div class="container">
                    <div class="row" style="background-color:#ffe5c2; border-radius:35px">
                        <div class="col-md-3">
                            <asp:HyperLink ID="Hyperlink1" runat="server" NavigateUrl='<%# Eval("Id", "Detail.aspx?RecipeID={0}") %>'>
                                <img src='<%# Eval("Picture") %>' runat="server" class="gridImage img-circle" />
                            </asp:HyperLink>
                           
                        </div>
                        <div class="col-md-5">
                            <asp:HyperLink ID="Hyperlink3" runat="server" NavigateUrl='<%# Eval("Id", "Detail.aspx?RecipeID={0}") %>'>
                            <p style="font-family:'Times New Roman'; font-size:25px; font-weight:bold"><%# Eval("Title") %></p>                                                        
                            </asp:HyperLink>
                            <p style="font-family:'Times New Roman'; font-size:15px; font-weight:bold"><%# Eval("Author") %></p>
                            <p style="font-family:'Times New Roman'; font-size:15px; font-weight:bold"><%# Eval("PostDate") %></p>
                            <label class="control-label">Rating</label>
                            <input value='<%# Eval("AverageScore") %>' data-readonly="true" class="rating" data-min="0" data-max="5" data-step="0.5" data-size="xs" />
                        </div>
                        <div class="col-md-4">
                            <p style="float:right; font-family:'Times New Roman'; font-size:20px; font-weight:bold; padding-right:2em"><span class="glyphicon glyphicon-user"></span> Serves: <%# Eval("Servings") %> people</p>
                            <p style="top:40px; float:right; font-family:'Times New Roman'; font-size:20px; font-weight:bold; padding-right:2em"><span class="glyphicon glyphicon-time"></span> Cook Time: <%# Eval("CookTime") %> minutes</p>                    
                            <span style="top:80px; float:right" class="glyphicon glyphicon-ok">&nbsp;<p style="float:right; font-family:'Times New Roman'; font-weight:bold; font-size:30px; padding-right:2em"><%# Eval("Category") %></p></span>
                        </div>
                    </div>

                </div>
            <br />
<br />
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="background-color: #008A8C;color: #FFFFFF;">Id:
            <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
            <br />
            Title:
            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
            <br />
            IngredientList:
            <asp:TextBox ID="IngredientListTextBox" runat="server" Text='<%# Bind("IngredientList") %>' />
            <br />
            Instructions:
            <asp:TextBox ID="InstructionsTextBox" runat="server" Text='<%# Bind("Instructions") %>' />
            <br />
            Picture:
            <asp:TextBox ID="PictureTextBox" runat="server" Text='<%# Bind("Picture") %>' />
            <br />
            Author:
            <asp:TextBox ID="AuthorTextBox" runat="server" Text='<%# Bind("Author") %>' />
            <br />
            PostDate:
            <asp:TextBox ID="PostDateTextBox" runat="server" Text='<%# Bind("PostDate") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            <br /><br /></span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">Title:
            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
            <br />IngredientList:
            <asp:TextBox ID="IngredientListTextBox" runat="server" Text='<%# Bind("IngredientList") %>' />
            <br />Instructions:
            <asp:TextBox ID="InstructionsTextBox" runat="server" Text='<%# Bind("Instructions") %>' />
            <br />Picture:
            <asp:TextBox ID="PictureTextBox" runat="server" Text='<%# Bind("Picture") %>' />
            <br />Author:
            <asp:TextBox ID="AuthorTextBox" runat="server" Text='<%# Bind("Author") %>' />
            <br />PostDate:
            <asp:TextBox ID="PostDateTextBox" runat="server" Text='<%# Bind("PostDate") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            <br /><br /></span>
        </InsertItemTemplate>
        <ItemTemplate>
            
                <br />
                <div class="container">
                    <div class="row" style="background-color:#dbebc4; border-radius:35px">
                        <div class="col-md-3">
                            <asp:HyperLink ID="Hyperlink1" runat="server" NavigateUrl='<%# Eval("Id", "Detail.aspx?RecipeID={0}") %>'>
                                <img src='<%# Eval("Picture") %>' runat="server" class="gridImage img-circle" />
                            </asp:HyperLink>
                           
                        </div>
                        <div class="col-md-5">
                            <asp:HyperLink ID="Hyperlink3" runat="server" NavigateUrl='<%# Eval("Id", "Detail.aspx?RecipeID={0}") %>'>
                            <p style="font-family:'Times New Roman'; font-size:25px; font-weight:bold"><%# Eval("Title") %></p>                       
                            </asp:HyperLink>
                            <p style="font-family:'Times New Roman'; font-size:15px; font-weight:bold"><%# Eval("Author") %></p>
                            <p style="font-family:'Times New Roman'; font-size:15px; font-weight:bold"><%# Eval("PostDate") %></p>
                            <label class="control-label">Rating</label>
                            <input value='<%# Eval("AverageScore") %>' class="rating" data-readonly="true" data-min="0" data-max="5" data-step="0.5" data-size="xs" />                      
                        </div>
                        <div class="col-md-4">
                            <p style="float:right; font-family:'Times New Roman'; font-size:20px; font-weight:bold; padding-right:2em"><span class="glyphicon glyphicon-user"></span> Serves: <%# Eval("Servings") %> people</p>
                            <p style="top:40px; float:right; font-family:'Times New Roman'; font-size:20px; font-weight:bold; padding-right:2em"><span class="glyphicon glyphicon-time"></span> Cook Time: <%# Eval("CookTime") %> minutes</p>                    
                            <span style="top:80px; float:right" class="glyphicon glyphicon-ok">&nbsp;<p style="float:right; font-family:'Times New Roman'; font-weight:bold; font-size:30px; padding-right:2em"><%# Eval("Category") %></p></span>
                        </div>
                    </div>

                </div>
            <br />
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
            <span style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">Id:
            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
            <br />
            Title:
            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
            <br />
            IngredientList:
            <asp:Label ID="IngredientListLabel" runat="server" Text='<%# Eval("IngredientList") %>' />
            <br />
            Instructions:
            <asp:Label ID="InstructionsLabel" runat="server" Text='<%# Eval("Instructions") %>' />
            <br />
            Picture:
            <asp:Label ID="PictureLabel" runat="server" Text='<%# Eval("Picture") %>' />
            <br />
            Author:
            <asp:Label ID="AuthorLabel" runat="server" Text='<%# Eval("Author") %>' />
            <br />
            PostDate:
            <asp:Label ID="PostDateLabel" runat="server" Text='<%# Eval("PostDate") %>' />
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

</asp:Content>
