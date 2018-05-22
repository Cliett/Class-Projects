using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MainMenuForm : System.Web.UI.Page
{
    public static Methods m = new Methods();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!m.CookieExists("userInfo")) //Fixes 'Chuck E Hacker' bug
        {
            m.SIMPLE_POPUP("Something went wrong!");
            Response.Redirect("~/Login.aspx"); //Send unauthorized user back to login page.
        }

        ClientScript.RegisterStartupScript(this.GetType(), "script", "MainMenuFadeIn();", true); //fade effects script (see JS.js file)

        if (Request.Browser.IsMobileDevice == true)
            Image1.Visible = false; //SRS logo on main page bugs out on mobile, lets remove it for mobile only.
        HttpCookie aCookie = Request.Cookies["userInfo"];
        if (!Label2.Text.Contains(aCookie["userName"]))
            Label2.Text = "Welcome, " + aCookie["userName"];
        if (aCookie["isManager"] == "True")
            ButtonReviewRequests.Visible = true;
        if (aCookie["isHR"] == "True")
            ButtonUpdateEmployees.Visible = true;


    }


    protected void ButtonLogout_Click1(object sender, EventArgs e)
    {
        m.DeleteCookie("userInfo");
        m.DeleteCookie("USERname");
        Response.Redirect("~/Login.aspx");
    }

    protected void ButtonNewRequest_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/EditRequestForm.aspx");
    }

    protected void ButtonViewSavedRequests_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/SavedRequestForm.aspx");
    }

    protected void ButtonViewSubmittedRequests_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ReviewRequestsForm.aspx");
    }

    protected void ButtonReviewRequests_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/PendingActionForm.aspx");
    }

    protected void ButtonUpdateEmployees_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/HRForm.aspx");
    }
}