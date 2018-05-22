<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditRequestForm.aspx.cs" Inherits="EditRequestForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SRS-Badge Request</title>
    <link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
    <form id="EditRequest" runat="server">

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
            <p>
                <asp:Label ID="viewSubmittedFlagLabel" runat="server" Text="viewSubmittedFlag1" Visible="False"></asp:Label>
            </p>
        </div>
        <div id="overleft">
            <p></p>
        </div>
        <div id="overmiddle">
            <p></p>
        </div>
        <div id="editRequestFormMainData">
            <p>
                &nbsp;<p>
                    &nbsp;<p>
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
                <asp:Label ID="NotesLabel" Text="Notes:(max 500 char)" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#FF9900" />
                <div>
                    <asp:TextBox ID="NotesTextBox" Columns="20" MaxLength="500" runat="server" Height="165px" TextMode="MultiLine" Width="100%" BackColor="#CCCCCC" />
                </div>
            </p>
        </div>
        <div id="editRequestFormBottomButtons">
            <p>
                <asp:Button ID="CancelButton" Text="Cancel" runat="server" OnClick="CancelButton_Click" Width="100px" Font-Bold="True" BorderColor="#FF9900" Font-Size="Large" />
                <asp:Button ID="SaveButton" Text="Save Draft" runat="server" OnClick="SaveButton_Click" Width="111px" Font-Bold="True" BorderColor="#FF9900" Font-Size="Large" />
                <asp:Button ID="SubmmitButton" Text="Submit" runat="server" OnClick="SubmmitButton_Click" Width="100px" Font-Bold="True" BorderColor="#FF9900" Font-Size="Large" />
            </p>
        </div>
        <div id="editRequestFormTopRightText">
            <p>
                <asp:Label ID="Label1" runat="server" Text="Edit Request" Font-Bold="True" Font-Size="XX-Large" ForeColor="#FF9900"></asp:Label>
        </div>


    </form>
    <script type="text/javascript" src="jquery-2.2.2.min.js"></script>
    <script type="text/javascript" src="JS.js"></script>
</body>
</html>
