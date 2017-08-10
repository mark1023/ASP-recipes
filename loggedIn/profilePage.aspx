<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="profilePage.aspx.cs" Inherits="Web2._0Assignment.Account.profilePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <img class="img-circle" style="height:300Px; width:300px" src='<%# Eval("ProfilePic") %>' />
                     </div>
                    <div class="col-md-6">
                        <h1 style="font-family:'Times New Roman'"><%# Eval("FirstName") %> <%# Eval("LastName") %></h1>
                        <p style="font-family:'Times New Roman'; font-size:15px"><%# Eval("IntroduceYourself") %></p>
                    </div>
                </div>              
            </div>
        </ItemTemplate>
    </asp:ListView>


<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbmt16abkConnectionString %>" SelectCommand="SELECT [Id], [ProfilePic], [FirstName], [LastName], [fkUserName], [IntroduceYourself] FROM [UserProfile] WHERE ([fkUserName] = @fkUserName)">
    <SelectParameters>
        <asp:QueryStringParameter Name="fkUserName" QueryStringField="UserName" Type="String" />
    </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
 
