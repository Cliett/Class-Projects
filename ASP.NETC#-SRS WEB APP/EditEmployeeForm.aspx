<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditEmployeeForm.aspx.cs" Inherits="EditEmployeeForm" %>

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
            <div id="editRequestFormBottomButtons">
                <p>
                    <asp:button id="CancelButton" text="Back" runat="server" onclick="CancelButton_Click" width="102px" font-bold="True" height="28px" backcolor="#CCCCCC" bordercolor="#FF9900" font-size="Large" />
                    <asp:button id="SubmmitButton" text="Save" runat="server" onclick="SubmmitButton_Click" width="100px" font-bold="True" backcolor="#CCCCCC" bordercolor="#FF9900" font-size="Large" />
                </p>
            </div>
            <div id="editRequestFormTopRightText">
                <p>
                    <asp:label id="Label11" runat="server" font-bold="True" font-size="XX-Large" forecolor="#FF9900" text="Edit Employees"></asp:label>
                </p>
            </div>
        </p>
    </div>
    <div id="editRequestFormMainData">
        <p>
            <asp:label id="Label1" runat="server" text="First Name" font-bold="True" font-size="Large" forecolor="#FF9900"></asp:label>
            <br />
            <asp:textbox id="TextBox1" runat="server" backcolor="#CCCCCC"></asp:textbox>
        </p>
        <p>
            <br />
            <asp:label id="Label2" runat="server" text="Middle Name" font-bold="True" font-size="Large" forecolor="#FF9900"></asp:label>
            <br />
            <asp:textbox id="TextBox2" runat="server" backcolor="#CCCCCC"></asp:textbox>
        </p>
        <p>
            <br />
            <asp:label id="Label3" runat="server" text="Last Name" font-bold="True" font-size="Large" forecolor="#FF9900"></asp:label>
            <br />
            <asp:textbox id="TextBox3" runat="server" backcolor="#CCCCCC"></asp:textbox>
        </p>
        <p>
            <br />
            <asp:label id="Label4" runat="server" text="Initials" font-bold="True" font-size="Large" forecolor="#FF9900"></asp:label>
            <br />
            <asp:textbox id="TextBox4" runat="server" backcolor="#CCCCCC"></asp:textbox>
        </p>
        <p>
            <br />
            <asp:label id="Label12" runat="server" text="UserID" font-bold="True" font-size="Large" forecolor="#FF9900"></asp:label>
            <br />
            <asp:textbox id="TextBox5" runat="server" backcolor="#CCCCCC"></asp:textbox>
        </p>
        <p>
            <br />

            <asp:label id="Label7" runat="server" text="Work Location" font-bold="True" font-size="Large" forecolor="#FF9900"></asp:label>
            <br />
            <asp:textbox id="TextBox8" runat="server" backcolor="#CCCCCC" ontextchanged="TextBox8_TextChanged"></asp:textbox>
        </p>
        <p>
            <br />
            <asp:label id="Label8" runat="server" text="Work Phone" font-bold="True" font-size="Large" forecolor="#FF9900"></asp:label>
            <br />
            <asp:textbox id="TextBox9" runat="server" backcolor="#CCCCCC"></asp:textbox>
        </p>
    </div>
    <div id="editRequestFormCheckBoxData">
        <p>
            <asp:label id="Label5" runat="server" text="Employee Company" font-bold="True" font-size="Large" forecolor="#FF9900"></asp:label>
            <br />
            <asp:textbox id="TextBox6" runat="server" backcolor="#CCCCCC"></asp:textbox>
        </p>
        <p>
            <br />
            <asp:label id="Label6" runat="server" text="Department" font-bold="True" font-size="Large" forecolor="#FF9900"></asp:label>
            <br />
            <asp:textbox id="TextBox7" runat="server" backcolor="#CCCCCC"></asp:textbox>
        </p>
        <p>
            <br />
            <asp:label id="EmployeeLabel" runat="server" text="Employee Manager:" font-bold="True" font-size="Large" forecolor="#FF9900" />
            <div>
                <asp:dropdownlist id="EmployeeDDL" runat="server" width="125px" datasourceid="SqlDataSource1" datatextfield="Last_Name" datavaluefield="Last_Name" appenddatabounditems="True" onload="EmployeeDDL_Load" backcolor="#CCCCCC" />
                <asp:sqldatasource id="SqlDataSource1" runat="server" connectionstring="Data Source=badgerequest.cthyx0iu4w46.us-east-2.rds.amazonaws.com;Initial Catalog=badge_request;Persist Security Info=True;User ID=pwndatnerd;Password=AaronDavidRandall!3" selectcommand="SELECT Employees.[First Name] + ' ' + Employees.[Middle Name] + ' ' + Employees.[Last Name] AS Last_Name, Employees.[UserID] AS uid, Credentials.[isManager] FROM [Employees] INNER JOIN [Credentials] ON Employees.[UserID] = Credentials.[UserID] WHERE Credentials.[isManager] = 'True'" providername="System.Data.SqlClient"></asp:sqldatasource>
                <br />
                <br />
                <asp:label id="Label9" runat="server" text="Manager Work Location" font-bold="True" font-size="Large" forecolor="#FF9900"></asp:label>
                <br />
                <asp:textbox id="TextBox10" runat="server" backcolor="#CCCCCC"></asp:textbox>
                <br />
                <br />
                <asp:label id="Label10" runat="server" text="Manager Work Phone" font-bold="True" font-size="Large" forecolor="#FF9900"></asp:label>
                <br />
                <asp:textbox id="TextBox11" runat="server" backcolor="#CCCCCC"></asp:textbox>
        </p>
    </div>


</form>
</html>
