<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="searchByTag.aspx.cs" Inherits="Web2._0Assignment.searchByTag" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <p style="font-family:'Times New Roman'; font-weight:bold; font-size:45px">
                    Search Recipes By Tag
                </p>
            </div>
        </div>
    </div>

    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbmt16abkConnectionString %>" SelectCommand="SELECT DISTINCT [TagName] FROM [Tags] ORDER BY [TagName]"></asp:SqlDataSource>
   
  
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <asp:HyperLink ID="HyperLink1"  runat="server" NavigateUrl='<%# Eval("TagName","RecipesByTag.aspx?Tag={0}")%>'>
                            <p><%# Eval("TagName") %>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>
                        </asp:HyperLink> 
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:ListView>

    <div class="container">
    <div style="float:left">
        <asp:DataPager ID="DataPager1" runat="server" PageSize="15" PagedControlID="ListView1">
        <Fields>
            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="True" />
            <asp:NumericPagerField />
            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="True" ShowPreviousPageButton="False" />
        </Fields>
    </asp:DataPager>
         </div>
        </div>

</asp:Content>

