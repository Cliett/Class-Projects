<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PendingActionForm.aspx.cs" Inherits="PendingActionForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SRS-Badge Request</title>
    <link rel="stylesheet" type="text/css" href="style.css">

</head>
<body bgcolor="aliceblue">

    <body>
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
                    <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="PendingDisplay" DataValueField="RequestID" Height="309px" Font-Size="Medium" BackColor="#CCCCCC" Font-Bold="True" Width="100%"></asp:ListBox>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=badgerequest.cthyx0iu4w46.us-east-2.rds.amazonaws.com;Initial Catalog=badge_request;Persist Security Info=True;User ID=pwndatnerd;Password=AaronDavidRandall!3" SelectCommand="Select CAST([RequestID] AS varchar(200)) + '   ' + [Employee] + '   ' + CAST([CurrentDate] AS varchar(15)) AS PendingDisplay, [RequestID] From Requests JOIN Employees ON [Employee] = ([First Name] + ' ' + [Middle Name] + ' ' + [Last Name]) WHERE ([RequestState] = @RequestState AND [Username] = @CookieUsername) OR ([RequestState] = @RequestState AND [Manager Name] = @CookieManager)" ProviderName="System.Data.SqlClient">

                        <SelectParameters>
                            <asp:Parameter DefaultValue="Pending" Name="RequestState" Type="String" />
                            <asp:CookieParameter CookieName="USERname" Name="CookieUsername" Type="String" />
                            <asp:CookieParameter CookieName="Manager" Name="CookieManager" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </p>
            </div>
            <div id="listboxFormPanelButtons">
                <p>
                    <asp:Button ID="Button1" runat="server" Text="Back" OnClick="Button1_Click" Width="100%" Font-Bold="True" BorderColor="#FF9900" Font-Size="Large" BackColor="#CCCCCC" />
                    
                </p>
            </div>
            <div id="listboxFormPanelText">
                <p><asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="#FF9900" Text="Pending Action"></asp:Label></p>
            </div>
        </form>
    </body>
</html>
