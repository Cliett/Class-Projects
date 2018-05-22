<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SavedRequestForm.aspx.cs" Inherits="SavedRequestForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SRS-Badge Request</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body bgcolor="aliceblue">


    <form id="form1" runat="server">
        <div id="overtop">
            <p></p>
        </div>
        <div id="overbottom">
            <p>
                <br></br>
               SRS - Badge Request System: Augusta University Senior Capstone Project
            
                <p></p>
            </p>
        </div>
        <div id="overright">
            <p></p>
        </div>
        <div id="overleft">
            <p></p>
        </div>
        <div id="overmiddle">
            <p></p>
        </div>
        <div id="listboxFormPanel">
            <p>
                <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Employee" DataValueField="Employee" Height="218px" Font-Size="X-Large" BackColor="#CCCCCC" Font-Bold="True" Width="100%"></asp:ListBox>
                <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:badge_requestConnectionString %>" SelectCommand="Select [Employee] + '   ' + CAST([CurrentDate] AS varchar(15)) AS PendingDisplay From Drafts WHERE (([RequestState] = @RequestState) AND ([Username] = @Username))">--%>
                
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=badgerequest.cthyx0iu4w46.us-east-2.rds.amazonaws.com;Initial Catalog=badge_request;Persist Security Info=True;User ID=pwndatnerd;Password=AaronDavidRandall!3" SelectCommand="Select [Employee], [CurrentDate] From Drafts WHERE (([RequestState] = @RequestState) AND ([Username] = @Username))" ProviderName="System.Data.SqlClient">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Draft" Name="RequestState" Type="String" />
                        <asp:CookieParameter CookieName="USERname" Name="Username" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </p>
        </div>
        <div id="listboxFormPanelButtons">
            <p>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Back" Width="100%" Font-Bold="True" BorderColor="#FF9900" Font-Size="Large" BackColor="#CCCCCC" /></p>
        </div>
        <div id="listboxFormPanelText">
            <p><asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="#FF9900" Text="Saved Drafts"></asp:Label></p>
        </div>
    </form>

</body>
</html>
