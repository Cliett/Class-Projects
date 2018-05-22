<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManagerReviewForm.aspx.cs" Inherits="ManagerReviewForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SRS-Badge Request</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
    <form id="ManagerReview" runat="server">


        <asp:CheckBox ID="isEditableCheckBox" runat="server" Visible="False" />


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
    <div id="editRequestFormMainData">
        <p>
            <asp:Label ID="EmployeeLabel" runat="server" Text="Employee:" Font-Bold="True" Font-Size="Large" ForeColor="#FF9900" />
            <div>
                <asp:DropDownList ID="EmployeeDDL" runat="server" Width="125px" DataSourceID="SqlDataSource1" DataTextField="Last_Name" DataValueField="Last_Name" BackColor="#CCCCCC" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=badgerequest.cthyx0iu4w46.us-east-2.rds.amazonaws.com;Initial Catalog=badge_request;Persist Security Info=True;User ID=pwndatnerd;Password=AaronDavidRandall!3" SelectCommand="SELECT [First Name] + ' ' + [Middle Name] + ' ' + [Last Name] AS Last_Name FROM [Employees]" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
            </div>
            <asp:Label ID="ReasonLabel" runat="server" Text="Reason For Request:" Font-Bold="True" Font-Size="Large" ForeColor="#FF9900" />
            <div>
                <asp:DropDownList ID="ReasonDDL" runat="server" Width="125px" BackColor="#CCCCCC">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Area Access Change</asp:ListItem>
                    <asp:ListItem>Appearance Change</asp:ListItem>
                    <asp:ListItem>Damaged Badge</asp:ListItem>
                    <asp:ListItem>Job Change</asp:ListItem>
                    <asp:ListItem>Lost Badge</asp:ListItem>
                    <asp:ListItem>Name Change</asp:ListItem>
                    <asp:ListItem>New/Changed Clearance</asp:ListItem>
                    <asp:ListItem>New Employee</asp:ListItem>
                    <asp:ListItem>Rebadging Cycle</asp:ListItem>
                    <asp:ListItem>Downgrade</asp:ListItem>
                    <asp:ListItem>HRP</asp:ListItem>
                    <asp:ListItem>LSE/Intern</asp:ListItem>
                </asp:DropDownList>
                <br />
            </div>
            <div>
                <br />
            </div>
            <asp:Label ID="getDateLabel" Text="G.E.T. Date:" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#FF9900" />
            <div>
                <asp:TextBox ID="GetTextBox" Columns="20" MaxLength="25" Placeholder="mm/dd/yyyy" runat="server" BackColor="#CCCCCC" />
            </div>
            <br />
            <asp:Label ID="SSNLabel" Text="SSN:" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#FF9900" />
            <div>
                <asp:TextBox ID="SSNTextBox" Columns="20" MaxLength="25" placeholder="XXX-XX-XXXX" runat="server" BackColor="#CCCCCC" />

            </div>
            <br />
            <asp:Label ID="DOBLabel" Text="Date of Birth:" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#FF9900" />
            <div>
                <asp:TextBox ID="DOBTextBox" Columns="20" MaxLength="25" placeholder="mm/dd/yyyy" runat="server" BackColor="#CCCCCC" />
            </div>
            <br />
            <asp:Label ID="BadgeTypeLabel" Text="Type of Badge:" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#FF9900" />
            <div>
                <asp:DropDownList ID="BadgeTypeDDL" runat="server" Width="125px" BackColor="#CCCCCC">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>L</asp:ListItem>
                    <asp:ListItem>Q</asp:ListItem>
                    <asp:ListItem>Uncleared</asp:ListItem>
                </asp:DropDownList>
            </div>
        </p>
    </div>
    <div id="editRequestFormCheckBoxData">
        <p>
            <asp:Label ID="ProximityCardLabel" Text="Proximity Card?" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#FF9900" />
            <div>
                <asp:CheckBox ID="ProximityCheckBox" runat="server" />
            </div>
            <br />
            <asp:Label ID="EmergencyLabel" Text="Emergency Access?" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#FF9900" />
            <div>
                <asp:CheckBox ID="EmergencyCheckBox" runat="server" />
            </div>
            <br />
            <asp:Label ID="ComputerAccountsLabel" Text="Contunue Previous Computer Accounts?" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#FF9900" />
            <div>
                <asp:CheckBox ID="AccountsCheckBox" runat="server" />
            </div>
            <br />
            <asp:Label ID="NotesLabel" Text="Additional Info:(max 500 char)" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#FF9900" />
            <div>
                <asp:TextBox ID="NotesTextBox" Columns="20" MaxLength="500" runat="server" Height="200px" TextMode="MultiLine" Width="100%" BackColor="#CCCCCC" />
            </div>
        </p>
    </div>
    <div id="editRequestFormBottomButtons">
        <p>
            <asp:Button ID="ApproveButton" Text="Approve" runat="server" OnClick="ApproveButton_Click" Width="125px" Font-Bold="True" BackColor="#CCCCCC" BorderColor="#FF9900" Font-Size="Large" />
            <asp:Button ID="DenyButton" Text="Deny" runat="server" OnClick="DenyButton_Click" Width="125px" Font-Bold="True" BackColor="#CCCCCC" BorderColor="#FF9900" Font-Size="Large" />
            <asp:Button ID="InfoButton" Text="Needs More Info" runat="server" OnClick="InfoButton_Click" Width="170px" Font-Bold="True" BackColor="#CCCCCC" BorderColor="#FF9900" Font-Size="Large" />
        </p>
    </div>
    <div id="editRequestFormTopRightText">
        <p>
            <asp:label id="Label1" runat="server" font-bold="True" font-size="XX-Large" forecolor="#FF9900" text="Manager Review Form"></asp:label></p>
    </div>


    <asp:TextBox ID="requestIDTxtBx" runat="server" ReadOnly="True" Visible="False"></asp:TextBox>
</form>
</html>
