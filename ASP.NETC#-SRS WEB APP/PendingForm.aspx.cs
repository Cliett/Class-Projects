using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net;

public partial class PendingForm : System.Web.UI.Page
{
    public static Methods m = new Methods();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!m.CookieExists("userInfo")) //Fixes 'Chuck E Hacker' bug
        {
            m.SIMPLE_POPUP("Something went wrong!");
            Response.Redirect("~/Login.aspx"); //Send unauthorized user back to login page.
        }
        /*So in order for the listbox to get the userName cookie, we have to request the userInfo cookie, create a new cookie that will hold ONLY username!*/
        /*So aCookie is the original cookie, usernameCookie is the new cookie that gets assigned aCookie.Values["userName"], and of course we named the new cookie USERname*/
        /*USERname is the cookie that will be looked for in the .aspx file*/
        HttpCookie aCookie = Request.Cookies["userInfo"];
        HttpCookie usernameCookie = new HttpCookie("USERname");
        usernameCookie.Value = aCookie.Values["userName"];
        Response.Cookies.Add(usernameCookie);
        /*DOUBLE CLICK EVENT FOR LISTBOX*/
        try
        {
            if (Request["__EVENTARGUMENT"] != null && Request["__EVENTARGUMENT"] == "move")
            {
                HttpCookie bCookie = new HttpCookie("submittedCookieInfo");
                Response.Cookies.Add(bCookie);

                string REQID = ListBox1.SelectedValue;
                m.Pending_Request_Read(bCookie, REQID);
                Response.Redirect("~/ViewSubmittedForm.aspx");

            }
        }
        catch
        {

        }
        ListBox1.Attributes.Add("ondblclick", ClientScript.GetPostBackEventReference(ListBox1, "move"));

        /****************/




    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ReviewRequestsForm.aspx");
    }



}