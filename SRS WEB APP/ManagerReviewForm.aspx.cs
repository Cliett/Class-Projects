using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net;
using System.Text.RegularExpressions;
using System.Net.Mail;

public partial class ManagerReviewForm : System.Web.UI.Page
{
    public static Methods m = new Methods();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!m.CookieExists("userInfo")) //Fixes 'Chuck E Hacker' bug
        {
            m.SIMPLE_POPUP("Something went wrong!");
            Response.Redirect("~/Login.aspx"); //Send unauthorized user back to login page.
        }
        SSNTextBox.ReadOnly = true; SSNTextBox.BackColor = System.Drawing.Color.LightGray;
        GetTextBox.ReadOnly = true; GetTextBox.BackColor = System.Drawing.Color.LightGray;
        DOBTextBox.ReadOnly = true; DOBTextBox.BackColor = System.Drawing.Color.LightGray;
        NotesTextBox.ReadOnly = true; NotesTextBox.BackColor = System.Drawing.Color.LightGray;
        ProximityCheckBox.Enabled = false; EmergencyCheckBox.Enabled = false; AccountsCheckBox.Enabled = false;
        EmployeeDDL.Enabled = false; ReasonDDL.Enabled = false; BadgeTypeDDL.Enabled = false;
        GetTextBox.Enabled = false; SSNTextBox.Enabled = false; NotesTextBox.Enabled = false; DOBTextBox.Enabled = false;

        HttpCookie aCookie = Request.Cookies["userInfo"];

        if (Request.Cookies["submittedCookieInfo"] != null)
        {
            /*Populate fields based on cookie information*/
            HttpCookie cCookie = Request.Cookies["submittedCookieInfo"];
            EmployeeDDL.Text = cCookie["Employee"]; ReasonDDL.Text = cCookie["Reason"]; GetTextBox.Text = cCookie["GET"].Replace(" 12:00:00 AM", ""); SSNTextBox.Text = m.lastFourOnly(cCookie["SSN"]); DOBTextBox.Text = cCookie["DOB"].Replace(" 12:00:00 AM", ""); BadgeTypeDDL.Text = cCookie["TOB"]; NotesTextBox.Text = cCookie["Notes"]; requestIDTxtBx.Text = cCookie["RequestID"];
            if (cCookie["Proximity"] == "True")
                ProximityCheckBox.Checked = true;
            if (cCookie["Emergency"] == "True")
                EmergencyCheckBox.Checked = true;
            if (cCookie["Accounts"] == "True")
                AccountsCheckBox.Checked = true;
            /*******************************************/

            m.DeleteCookie("submittedCookieInfo");

        }

    }

    protected void InfoButton_Click(object sender, EventArgs e)
    {
        m.ReviewForm(requestIDTxtBx.Text, "Info");
        m.Review_sendNotifcation(EmployeeDDL.Text, "Need");
        Response.Redirect("~/PendingActionForm.aspx");


    }

    protected void ApproveButton_Click(object sender, EventArgs e)
    {
        m.ReviewForm(requestIDTxtBx.Text, "Approve");
        m.Review_sendNotifcation(EmployeeDDL.Text, "Approved");
        Response.Redirect("~/PendingActionForm.aspx");
    }

    protected void DenyButton_Click(object sender, EventArgs e)
    {
        m.ReviewForm(requestIDTxtBx.Text, "Deny");
        m.Review_sendNotifcation(EmployeeDDL.Text, "Denied");
        Response.Redirect("~/PendingActionForm.aspx");
    }

}