<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReviewRequestsForm.aspx.cs" Inherits="ReviewRequestsForm" %>

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
        <div id="reviewRequestsCustom">
            <p>
                &nbsp;
            </p>
            <p>
                <asp:button id="pendingButton" runat="server" text="Pending" onclick="pendingButton_Click" height="64px" width="159px" font-size="Large" backcolor="#CCCCCC" bordercolor="#FF9900" font-bold="True" />

            </p>
            <p>
                &nbsp;</p>
            <p>
                <asp:button id="approvedButton" runat="server" text="Approved" onclick="approvedButton_Click" height="64px" width="159px" font-size="Large" backcolor="#CCCCCC" bordercolor="#FF9900" font-bold="True" />

            </p>
            <p>
                &nbsp;</p>
            <p>
                <asp:button id="deniedButton" runat="server" text="Denied" onclick="deniedButton_Click" height="64px" width="159px" font-size="Large" backcolor="#CCCCCC" bordercolor="#FF9900" font-bold="True" />

            </p>
        </div>
        <div id="listboxFormPanelText">
            <p>
                <asp:label id="Label1" runat="server" font-bold="True" font-size="XX-Large" forecolor="#FF9900" text="Review Requests"></asp:label>
            </p>
        </div>
        <div id="reviewRequestsBackButton">
            <p>
                &nbsp;</p>
            <p>
                <asp:button id="backButton" runat="server" onclick="backButton_Click" text="Back" width="100px" font-bold="True" backcolor="#CCCCCC" bordercolor="#FF9900" font-size="Large" />
            </p>
        </div>
    </p>
</div>



</form>

</html>
