<%@ Page Language="C#" ContentType="text/xml" AutoEventWireup="true" CodeBehind="rss.aspx.cs" Inherits="Web2._0Assignment.rss" %>
                   
<asp:Repeater ID="RepeaterRSS" runat="server">
    <HeaderTemplate>
           <rss version="2.0">
                <channel>
                    <title>Pain and Grains</title>
                    <link>http://www.jose.cs.herts.ac.uk/mt16abk/final/Recipes.aspx</link>
                    <description>
                    Vegan Recipes for Bodybuilders
                    </description>
        </HeaderTemplate>
        <ItemTemplate>
            <item>
                <title><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "Title")) %></title>
                <link>http://www.jose.cs.herts.ac.uk/mt16abk/final/Detail.aspx?ID=<%# DataBinder.Eval(Container.DataItem, "Id") %></link>
                <author><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "Author"))%></author>
                <pubDate><%# String.Format("{0:R}", DataBinder.Eval(Container.DataItem, "PostDate"))%></pubDate>       
        </item>
        </ItemTemplate>
        <FooterTemplate>
                </channel>
            </rss>  
        </FooterTemplate>

</asp:Repeater>





