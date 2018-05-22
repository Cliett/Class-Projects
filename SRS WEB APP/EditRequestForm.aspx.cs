using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net;
using System.Text.RegularExpressions;
using System.Net.Mail;

public partial class EditRequestForm : System.Web.UI.Page
{
    public static Methods m = new Methods();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!m.CookieExists("userInfo")) //Fixes 'Chuck E Hacker' bug
        {
            m.SIMPLE_POPUP("Something went wrong!");
            Response.Redirect("~/Login.aspx"); //Send unauthorized user back to login page.
        }
        ClientScript.RegisterStartupScript(this.GetType(), "script", "EditRequestFadeIn();", true); //fade effects script (see JS.js file)
        HttpCookie aCookie = Request.Cookies["userInfo"];
        if (Request.Cookies["draftInfo"] != null) //checking if we are loading a draft
        {
            /*Populate fields based on cookie information*/
            HttpCookie cCookie = Request.Cookies["draftInfo"];
            EmployeeDDL.Text = cCookie["Employee"]; ReasonDDL.Text = cCookie["Reason"]; GetTextBox.Text = cCookie["GET"].Replace(" 12:00:00 AM", ""); SSNTextBox.Text = cCookie["SSN"]; DOBTextBox.Text = cCookie["DOB"].Replace(" 12:00:00 AM", ""); BadgeTypeDDL.Text = cCookie["TOB"]; NotesTextBox.Text = cCookie["Notes"];
            if (cCookie["Proximity"] == "True")
                ProximityCheckBox.Checked = true;
            if (cCookie["Emergency"] == "True")
                EmergencyCheckBox.Checked = true;
            if (cCookie["Accounts"] == "True")
                AccountsCheckBox.Checked = true;
            /*******************************************/

            m.DeleteCookie("draftInfo");



        }
        else if (Request.Cookies["submittedCookieInfo"] != null && viewSubmittedFlagLabel.Text.Contains("1")) //checking to see if we are loading a pending request (someone editing an existing request)
        {
            viewSubmittedFlagLabel.Text = viewSubmittedFlagLabel.Text.Replace("1", ""); //So this solves the problem of the undeleted cookie putting back the original values. When user hits submit, it will skip over this 'if statement' because there wont be a '1' in the viewSubmittedFlagLabel text. Hey it works right lol
            SaveButton.Visible = false; //Disabled 'Save Draft' if we are loading in from a pending request

            /*Populate fields based on cookie information*/
            HttpCookie fCookie = Request.Cookies["submittedCookieInfo"];
            EmployeeDDL.Text = fCookie["Employee"]; ReasonDDL.Text = fCookie["Reason"]; GetTextBox.Text = fCookie["GET"].Replace(" 12:00:00 AM", ""); SSNTextBox.Text = fCookie["SSN"]; DOBTextBox.Text = fCookie["DOB"].Replace(" 12:00:00 AM", ""); BadgeTypeDDL.Text = fCookie["TOB"]; NotesTextBox.Text = fCookie["Notes"];
            if (fCookie["Proximity"] == "True")
                ProximityCheckBox.Checked = true;
            if (fCookie["Emergency"] == "True")
                EmergencyCheckBox.Checked = true;
            if (fCookie["Accounts"] == "True")
                AccountsCheckBox.Checked = true;
            /*******************************************/

            //we dont want to remove the submittedCookieInfo cookie yet. (we will remove it on 'Cancel' and on 'Submit') this is so that we can know if we are updating an existing request or not :)
        }

        if (aCookie["isManager"] != "True")
        {
            SqlDataSource1.SelectCommand = "SELECT [First Name] + ' ' + [Middle Name] + ' ' + [Last Name] AS Last_Name FROM [Employees] WHERE [UserID]=@UserID";
            SqlDataSource1.SelectParameters.Add("UserID", aCookie["UserID"]);
        }
        else
        {
            string temp;
            using (SqlConnection Connection = new SqlConnection(m.SQL_STRING))
            {
                Connection.Open();
                SqlCommand cmdGetDepartment = new SqlCommand(@"SELECT Department FROM Employees 
                                                    WHERE UserID=@UserID", Connection);
                cmdGetDepartment.Parameters.AddWithValue("@UserID", aCookie["UserID"]);
                temp = (string)cmdGetDepartment.ExecuteScalar();
                Connection.Close();
            }
            SqlDataSource1.SelectCommand = "SELECT [First Name] + ' ' + [Middle Name] + ' ' + [Last Name] AS Last_Name FROM [Employees] WHERE [Department]=@department";
            SqlDataSource1.SelectParameters.Add("department", temp);
        }
    }

    protected void SubmmitButton_Click(object sender, EventArgs e)
    {
        if (Request.Cookies["submittedCookieInfo"] != null) //existing pending request update
        {
            try
            {
                HttpCookie aCookie = Request.Cookies["userInfo"];
                HttpCookie vCookie = Request.Cookies["submittedCookieInfo"]; //so we can grab the request ID
                m.SubmitRequest(EmployeeDDL.Text, ReasonDDL.Text, GetTextBox.Text, m.stripSSN(SSNTextBox.Text), DOBTextBox.Text, BadgeTypeDDL.Text, ProximityCheckBox.Checked, EmergencyCheckBox.Checked, AccountsCheckBox.Checked, NotesTextBox.Text, aCookie["userName"], "Pending", false, vCookie["RequestID"]);
                m.sendNotification(EmployeeDDL.Text, aCookie["Manager"]); //Should we use a different email response if a user is updating his pending request?
                m.DeleteCookie("submittedCookieInfo");//we finally remove the cookie
                Response.Redirect("~/MainMenuForm.aspx", false);
            }
            catch (Exception ex)
            {
                m.SIMPLE_POPUP("There was an error submitting the request form. Please make sure all fields are filled out correctly and try again.");
            }
        }

        else //normal request creation
        {
            try
            {
                HttpCookie aCookie = Request.Cookies["userInfo"];
                m.SubmitRequest(EmployeeDDL.Text, ReasonDDL.Text, GetTextBox.Text, m.stripSSN(SSNTextBox.Text), DOBTextBox.Text, BadgeTypeDDL.Text, ProximityCheckBox.Checked, EmergencyCheckBox.Checked, AccountsCheckBox.Checked, NotesTextBox.Text, aCookie["userName"], "Pending", false, "");
                m.sendNotification(EmployeeDDL.Text, aCookie["Manager"]);
                Response.Redirect("~/MainMenuForm.aspx");
            }
            catch (Exception ex)
            {
                m.SIMPLE_POPUP("There was an error submitting the request form. Please make sure all fields are filled out correctly and try again.");
            }
        }
    }

    protected void CancelButton_Click(object sender, EventArgs e)
    {
        m.DeleteCookie("submittedCookieInfo"); //Removes the cookie that stored the loaded in pending request (from ViewSubmittedForm edit button)
        Response.Redirect("~/MainMenuForm.aspx");
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        try
        {
            HttpCookie aCookie = Request.Cookies["userInfo"];
            m.SaveRequest(EmployeeDDL.Text, ReasonDDL.Text, GetTextBox.Text, m.stripSSN(SSNTextBox.Text), DOBTextBox.Text, BadgeTypeDDL.Text, ProximityCheckBox.Checked, EmergencyCheckBox.Checked, AccountsCheckBox.Checked, NotesTextBox.Text, aCookie["userName"]);
            Response.Redirect("~/MainMenuForm.aspx");
        }
        catch (Exception ex)
        {
            m.SIMPLE_POPUP("Something went wrong saving your draft. Our bad. Probably had something to do with the SSN field, too many numbers or something.");
        }
    }



}