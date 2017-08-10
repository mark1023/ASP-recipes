<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="editProfile.aspx.cs" Inherits="Web2._0Assignment.Account.editProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <p>
        &nbsp;</p>

        <h1 style="font-family:'Times New Roman'; font-weight:bold">Update Your User Profile</h1>

        <br />
        <br />
        
        <div>
        <div class="tbLeft">
            <p style="font-family:'Times New Roman'; font-size:20px">Your First Name</p>
        </div>
        <div class="tbRight">
            <asp:TextBox ID="tbFirstName" runat="server" Width="300px"></asp:TextBox>
        </div>
        </div>

        <br />

        <div>
        <div class="tbLeft">
            <p style="font-family:'Times New Roman'; font-size:20px">Your Last Name</p>
        </div>
        <div class="tbRight">
            <asp:TextBox ID="tbLastName" runat="server" Width="300px"></asp:TextBox>
        </div>
        </div>

        <br />

        <div>
            <div class="tbLeft">
                <p style="font-family:'Times New Roman'; font-size:20px">Introduce Yourself (Favourite Ingredients? Fitness Goals?)</p>
            </div>
            <div class="tbRight">
                <asp:TextBox ID="tbIntroduceYourself" runat="server" TextMode="MultiLine" Width="300px" Height="132px"></asp:TextBox>                
            </div>
        </div>

        <br />

        <div>      
        <div class="tbLeft">
            <p style="font-family:'Times New Roman'; font-size:20px">Add a Profile Pic</p>
        </div>
        <div class="tbRight">
            <asp:FileUpload ID="fuProfilePic" runat="server" Width="300px" />
        </div> 
        </div>

        <br />

        <div>
        <div class="tbLeft">
        <asp:Label ID="lbl_msg" runat="server"></asp:Label>
        </div>       
        <div class="tbRight">
            <asp:Button ID="Button1" runat="server" Text="Update Profile" OnClick="Button1_Click" />
        </div>             
        </div>
            
</asp:Content>
