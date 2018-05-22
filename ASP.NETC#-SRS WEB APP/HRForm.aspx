<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HRForm.aspx.cs" Inherits="HRForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>SRS-Badge Request</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>




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
                &nbsp;
            </p>
            <p>
                <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="empNAME" DataValueField="uid" BackColor="#CCCCCC" Font-Bold="True" ForeColor="Black" Height="323px" Width="100%" Font-Size="Medium"></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=badgerequest.cthyx0iu4w46.us-east-2.rds.amazonaws.com;Initial Catalog=badge_request;Persist Security Info=True;User ID=pwndatnerd;Password=AaronDavidRandall!3" SelectCommand="SELECT [First Name] + ' ' + [Middle Name] + ' ' + [Last Name] AS empNAME, [UserID] AS uid FROM Employees ORDER BY [Last Name]" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
            </p>
        </div>
        <div id="listboxFormPanelButtons">
            <p>
                <asp:Button ID="backButton" runat="server" Text="Back" OnClick="backButton_Click" BorderColor="#FF9900" Font-Bold="True" Font-Size="Large" Height="47px" Width="75%" BackColor="#CCCCCC" />
            </p>
            <p>
                <asp:Button ID="newButton" runat="server" Text="New" OnClick="newButton_Click" BorderColor="#FF9900" Font-Bold="True" Font-Size="Large" Height="47px" Width="75%" BackColor="#CCCCCC" />
            </p>
            <p>
                <asp:Button ID="updateButton" runat="server" Text="Update" OnClick="updateButton_Click" BorderColor="#FF9900" Font-Bold="True" Font-Size="Large" Height="47px" Width="75%" BackColor="#CCCCCC" />
            </p>
            <p>
                <asp:Button ID="deleteButton" runat="server" Text="Delete" OnClick="deleteButton_Click" BorderColor="#FF9900" Font-Bold="True" Font-Size="Large" Height="47px" Width="75%" BackColor="#CCCCCC" />
            </p>
        </div>
        <div id="listboxFormPanelText">
            <p>
                &nbsp;
            </p>
            <p>
                <asp:Label ID="Label1" runat="server" Text="Employees" Font-Bold="True" Font-Size="XX-Large" ForeColor="#FF9900"></asp:Label>
            </p>
        </div>
        <asp:Button ID="Button1" Visible="true" SkinID="button" OnClick="Button1_Click" runat="server" Style="display: none" />
    </form>
    <script type="text/javascript" src="jquery-2.2.2.min.js"></script>
    <script type="text/javascript" src="JS.js"></script>
</body>
</html>
