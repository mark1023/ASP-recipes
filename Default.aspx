<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web2._0Assignment._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <img src="SiteImages/Vegan-Bodybuilder-crop.jpg" style="width:100%; height:100%; position:relative" />
        <asp:PlaceHolder runat="server" ID="hide">        
        <h2 style="position:absolute; top:100px; left:0; width:100%"><span style="color:white; font-size:25px; font-family:'Times New Roman';background-color:#89be3d; padding:10px"><a style="color:white" href="~/Recipes.aspx" runat="server">View All Recipes</a></span></h2>   
        <br />
        
        <h2 style="position:absolute; top:200px; left:0; width:100%"><span style="color:white; font-size:25px; font-family:'Times New Roman';background-color:#89be3d; padding:10px"><a style="color:white" href="~/Account/Register" runat="server">Sign Up!</a></span></h2>
        <br />
         <h2 style="position:absolute; top:300px; left:0; width:100%"><span style="color:white; font-size:25px; font-family:'Times New Roman';background-color:#89be3d; padding:10px"><a style="color:white" href="~/Account/Login" runat="server">Login</a></span></></h2> 
        <br />
</asp:PlaceHolder>
          
    </div>   
    
</asp:Content>
