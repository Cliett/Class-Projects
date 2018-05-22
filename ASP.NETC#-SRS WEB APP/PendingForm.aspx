<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PendingForm.aspx.cs" Inherits="PendingForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SRS-Badge Request</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>


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
        <p>
            <div id="listboxFormPanel">
                <p>
                    <asp:listbox id="ListBox1" runat="server" datasourceid="SqlDataSource1" datatextfield="PendingDisplay" datavaluefield="RequestID" height="323px" font-size="Medium" BackColor="#CCCCCC" Font-Bold="True" ForeColor="Black" Width="100%"></asp:listbox>

                    <asp:sqldatasource id="SqlDataSource1" runat="server" connectionstring="Data Source=badgerequest.cthyx0iu4w46.us-east-2.rds.amazonaws.com;Initial Catalog=badge_request;Persist Security Info=True;User ID=pwndatnerd;Password=AaronDavidRandall!3" selectcommand="Select CAST([RequestID] AS varchar(200)) + '   ' + [Employee] + '   ' + CAST([CurrentDate] AS varchar(15)) AS PendingDisplay, [RequestID] From Requests WHERE (([RequestState] = @RequestState) AND ([Username] = @Username))" providername="System.Data.SqlClient">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Pending" Name="RequestState" Type="String" />
                    <asp:CookieParameter CookieName="USERname" Name="Username" Type="String" />
                </SelectParameters>
            </asp:sqldatasource>
                </p>
            </div>
            <div id="listboxFormPanelText">
                <p>
                    <asp:label id="Label1" runat="server" font-bold="True" font-size="XX-Large" forecolor="#FF9900" text="Pending"></asp:label>
                </p>
            </div>
            <div id="listboxFormPanelButtons">
                <p>
                    <asp:button id="Button1" runat="server" text="Back" onclick="Button1_Click" width="100%" font-bold="True" BackColor="#CCCCCC" BorderColor="#FF9900" Font-Size="Large" />
                </p>
            </div>
        </p>
    </div>










</form>
</html>
