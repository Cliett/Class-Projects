<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SRS-Badge Request</title>
    <link rel="stylesheet" type="text/css" href="style.css"/>
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
            <br /><br /><br />
            <img alt="Savannah River Site Logo" class="auto-style1" src="Images/SRSLogo.png" id="testPic" /><br /><br />
            <asp:Label ID="RequestLabel" runat="server" Text="Badge Request System" Font-Bold="True" Font-Size="25pt" ForeColor="#FF9900" /><br />
            <br />

        </div>

        <div id="loginpagePanel">
            <br />
            <br />
            <asp:Label ID="userLabel" runat="server" Text="Username:" Font-Bold="True" Font-Size="X-Large" ForeColor="#FF9900" />
            <br />
            <asp:TextBox ID="userBox" Columns="20" MaxLength="25" Text="" runat="server" Height="47px" Font-Size="X-Large" Width="181px" />
            <br />
            <br />
            <asp:Label ID="passLabel" runat="server" Text="Password:" Font-Bold="True" Font-Size="X-Large" ForeColor="#FF9900" />
            <br />
            <asp:TextBox ID="passBox" Columns="20" MaxLength="25" Text="" runat="server" Height="50px" TextMode="Password" Font-Size="X-Large" Width="180px" />
            <br /><br />
            <asp:Button ID="loginButton" Text="Login" OnClick="LoginBtn_Click" runat="server" Font-Bold="true" Width="109px" BackColor="#FF9900" Height="35px" />

        </div>
    </form>
        <script type="text/javascript" src="jquery-2.2.2.min.js"></script>
        <script type="text/javascript" src="JS.js"></script>
    </body>
</html>
