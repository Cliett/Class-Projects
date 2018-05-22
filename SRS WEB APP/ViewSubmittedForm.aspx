<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewSubmittedForm.aspx.cs" Inherits="ViewSubmittedForm" %>

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

            <br />

        </p>
        <p>
            <br />
            <br />

        </p>

    </div>

    <div id="editRequestFormMainData">
        <p>
            &nbsp;</p>
        <p>
            <asp:label id="employeeLabel" runat="server" text="Employee: " font-size="22px" font-bold="True" forecolor="Black"></asp:label>
            <asp:label id="employeeLabel0" runat="server" text="Employee: " font-size="Large" font-bold="True" forecolor="Black" BackColor="#CCCCCC" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px"></asp:label>
            <br />
            <asp:label id="initialsLabel" runat="server" text="Initials: " font-size="22px" font-bold="True" forecolor="Black"></asp:label>
            <asp:label id="initialsLabel0" runat="server" text="Initials: " font-size="Large" font-bold="True" forecolor="Black" BackColor="#CCCCCC" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px"></asp:label>
            <br />
            <asp:label id="useridLabel" runat="server" text="UserID: " font-size="22px" font-bold="True" forecolor="Black"></asp:label>
            <asp:label id="useridLabel0" runat="server" text="UserID: " font-size="Large" font-bold="True" forecolor="Black" BackColor="#CCCCCC" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px"></asp:label>
        </p>
        <p>
            <br />
            <asp:label id="ecompanyLabel" runat="server" text="Employee Company: " font-size="22px" font-bold="True" forecolor="Black"></asp:label>
            <asp:label id="ecompanyLabel0" runat="server" text="Employee Company: " font-size="Large" font-bold="True" forecolor="Black" BackColor="#CCCCCC" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px"></asp:label>
            <br />
            <asp:label id="departmentLabel" runat="server" text="Department: " font-size="22px" font-bold="True" forecolor="Black"></asp:label>
            <asp:label id="departmentLabel0" runat="server" text="Department: " font-size="Large" font-bold="True" forecolor="Black" BackColor="#CCCCCC" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px"></asp:label>
            <br />
            <asp:label id="worklocationLabel" runat="server" text="Work Location: " font-size="22px" font-bold="True" forecolor="Black"></asp:label>
            <asp:label id="worklocationLabel0" runat="server" text="Work Location: " font-size="Large" font-bold="True" forecolor="Black" BackColor="#CCCCCC" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px"></asp:label>
            <br />
            <asp:label id="workphoneLabel" runat="server" text="Work Phone: " font-size="22px" font-bold="True" forecolor="Black"></asp:label>
            <asp:label id="workphoneLabel0" runat="server" text="Work Phone: " font-size="Large" font-bold="True" forecolor="Black" BackColor="#CCCCCC" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px"></asp:label>
        </p>
        <p>
            <br />
            <asp:label id="emanagerLabel" runat="server" text="Employee Manager: " font-size="22px" font-bold="True" forecolor="Black"></asp:label>
            <asp:label id="emanagerLabel0" runat="server" text="Employee Manager: " font-size="Large" font-bold="True" forecolor="Black" BackColor="#CCCCCC" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px"></asp:label>
            <br />
            <asp:label id="mworklocationLabel" runat="server" text="Manager Work Location: " font-size="22px" font-bold="True" forecolor="Black"></asp:label>
            <asp:label id="mworklocationLabel0" runat="server" text="Manager Work Location: " font-size="Large" font-bold="True" forecolor="Black" BackColor="#CCCCCC" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px"></asp:label>
            <br />
            <asp:label id="mworkphoneLabel" runat="server" text="Manager Work Phone: " font-size="22px" font-bold="True" forecolor="Black"></asp:label>
            <asp:label id="mworkphoneLabel0" runat="server" text="Manager Work Phone: " font-size="Large" font-bold="True" forecolor="Black" BackColor="#CCCCCC" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px"></asp:label>
            <br />
            <asp:label id="reasonforrequestLabel" runat="server" text="Reason for Request: " font-size="22px" font-bold="True" forecolor="Black"></asp:label>
            <asp:label id="reasonforrequestLabel0" runat="server" text="Reason for Request: " font-size="Large" font-bold="True" forecolor="Black" BackColor="#CCCCCC" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px"></asp:label>
        </p>
        <p>
            <br />
            <asp:label id="ssnLabel" runat="server" text="SSN: " font-size="22px" font-bold="True" forecolor="Black"></asp:label>
            <asp:label id="ssnLabel0" runat="server" text="SSN: " font-size="Large" font-bold="True" forecolor="Black" BackColor="#CCCCCC" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px"></asp:label>
            <br />
            <asp:label id="getdateLabel" runat="server" text="G.E.T. Date: " font-size="22px" font-bold="True" forecolor="Black"></asp:label>
            <asp:label id="getdateLabel0" runat="server" text="G.E.T. Date: " font-size="Large" font-bold="True" forecolor="Black" BackColor="#CCCCCC" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px"></asp:label>
            <br />
            <asp:label id="dateofbirthLabel" runat="server" text="Date of Birth: " font-size="22px" font-bold="True" forecolor="Black"></asp:label>
            <asp:label id="dateofbirthLabel0" runat="server" text="Date of Birth: " font-size="Large" font-bold="True" forecolor="Black" BackColor="#CCCCCC" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px"></asp:label>
        </p>
        <p>
            &nbsp;</p>
    </div>
    <div id="editRequestFormCheckBoxData">
        
        <p>
            <br />
        </p>
        <p>
            <asp:label id="typeofbadgeLabel" runat="server" text="Type of badge required: " font-size="22px" font-bold="True" forecolor="Black"></asp:label>
            <asp:label id="typeofbadgeLabel0" runat="server" text="Type of badge required: " font-size="Large" font-bold="True" forecolor="Black" BackColor="#CCCCCC" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px"></asp:label>
            <br />
            <asp:label id="proximitycardLabel" runat="server" text="Proximity Card? " font-size="22px" font-bold="True" forecolor="Black"></asp:label>
            <asp:label id="proximitycardLabel0" runat="server" text="Proximity Card? " font-size="Large" font-bold="True" forecolor="Black" BackColor="#CCCCCC" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px"></asp:label>
            <br />
            <asp:label id="emergencyaccessLabel" runat="server" text="Emergency Access? " font-size="22px" font-bold="True" forecolor="Black"></asp:label>
            <asp:label id="emergencyaccessLabel0" runat="server" text="Emergency Access? " font-size="Large" font-bold="True" forecolor="Black" BackColor="#CCCCCC" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px"></asp:label>
            <br />
            <asp:label id="continuecomputeraccountsLabel" runat="server" text="Continue Computer Accounts? " font-size="22px" font-bold="True" forecolor="Black"></asp:label>
            <asp:label id="continuecomputeraccountsLabel0" runat="server" text="Continue Computer Accounts? " font-size="Large" font-bold="True" forecolor="Black" BackColor="#CCCCCC" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px"></asp:label>
            <br />
            <br />
            <br />
            <asp:label id="notesLabel" runat="server" text="Notes: " font-size="22px" font-bold="True" forecolor="Black"></asp:label>
            <br />
            <asp:textbox id="TextBox1" runat="server" height="112px" textmode="MultiLine" width="100%" font-size="22px" backcolor="#CCCCCC"></asp:textbox>
        </p>
    </div>
    <div id="editRequestFormBottomButtons">
        <p>
            <asp:button id="backButton" runat="server" onclick="backButton_Click" text="Back" width="100%" font-bold="True" backcolor="#CCCCCC" bordercolor="#FF9900" font-size="Large" />
            <asp:button id="editButton" runat="server" text="Edit" backcolor="#CCCCCC" bordercolor="#FF9900" font-bold="True" font-size="Large" width="100%" OnClick="editButton_Click" />
        </p>
    </div>
    <div id="editRequestFormTopRightText">
        <p>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="#FF9900" Text="View Submitted Form"></asp:Label>
    </div>
</form>
</html>
