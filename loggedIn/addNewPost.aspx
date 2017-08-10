<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addNewPost.aspx.cs" Inherits="Web2._0Assignment.addNewPost" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <p>
        &nbsp;</p>

         <h1 style="font-family:'Times New Roman'; font-weight:bold">Create A New Recipe</h1>
    <br />
    <br />

        <div>      
        <div class="tbLeft">
            <p style="font-family:'Times New Roman'; font-size:20px"> Title</p>
        </div>
        <div class="tbRight">
            <asp:TextBox ID="tbTitle" runat="server" TextMode="MultiLine" Width="290px"></asp:TextBox>
        </div> 
        </div>


        <br />

        <div>
        <div class="tbLeft">
            <p style="font-family:'Times New Roman'; font-size:20px">Ingredient List</p>
        </div>
        <div class="tbRight">
            <asp:TextBox ID="tbIngredients" runat="server" TextMode="MultiLine" Height="150px" Width="290px"></asp:TextBox>
        </div>
        </div>

        <br />

        <div>
        <div class="tbLeft">
            <p style="font-family:'Times New Roman'; font-size:20px">Instructions</p>
        </div>
        <div class="tbRight">
            <asp:TextBox ID="tbInstructions" runat="server" TextMode="MultiLine" Height="150px" Width="290px"></asp:TextBox>
        </div>
        </div>

        <br />
        <div>
        <div class="tbLeft">
            <p style="font-family:'Times New Roman'; font-size:20px">Serves</p>
        </div>
        <div class="tbRight">
            <asp:TextBox ID="tbServings" runat="server" TextMode="Number" Width="290px"></asp:TextBox>
        </div>
        </div>

        <br />

        <div>
        <div class="tbLeft">
            <p style="font-family:'Times New Roman'; font-size:20px">Cook Time (in mins)</p>
        </div>
        <div class="tbRight">
            <asp:TextBox ID="tbCookTime" runat="server" TextMode="Number" Width="290px"></asp:TextBox>
        </div>
        </div>

        <br />

        <div>
            <div class="tbLeft">
                <p style="font-family:'Times New Roman'; font-size:20px">Choose a Food Category</p>
            </div>
            <div class="tbRight">
                <asp:DropDownList ID="DropDownList1" runat="server" Width="290px">
                    <asp:ListItem Enabled="true" Text="Select Category" Value=""></asp:ListItem>
                    <asp:ListItem Text="High Carb" Value="High Carb"></asp:ListItem>
                    <asp:ListItem Text="Low Carb" Value="Low Carb"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <br />

        <div>
        <div class="tbLeft">
            <p style="font-family:'Times New Roman'; font-size:20px">Upload a Picture</p>
        </div>
        <div class="tbRight">
            <asp:FileUpload ID="fupPicture" runat="server" Width="290px" />
        </div>
        </div>

        <br />

        <div>
        <div class="tbLeft">
        <asp:Label ID="lbl_msg" runat="server"></asp:Label>
        </div>
        <div class="tbRight">
            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" Height="42px" Width="82px" />
        </div>      
        
        </div>
                   
   
</asp:Content>
