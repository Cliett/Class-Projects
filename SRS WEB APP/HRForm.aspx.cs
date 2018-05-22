using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HRForm : System.Web.UI.Page
{
    public static Methods m = new Methods();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!m.CookieExists("userInfo")) //Fixes 'Chuck E Hacker' bug
        {
            m.SIMPLE_POPUP("Something went wrong!");
            Response.Redirect("~/Login.aspx"); //Send unauthorized user back to login page.
        }
        ClientScript.RegisterStartupScript(this.GetType(), "script", "HRFormFadeIn();", true); //fade effects script (see JS.js file)

    }

    protected void backButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/MainMenuForm.aspx");
    }

    protected void newButton_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/EditEmployeeForm.aspx");
    }

    protected void deleteButton_Click(object sender, EventArgs e) //Pop-up dialog, if sucessful confirmation, we activate Button1_Click()
    {
        if (ListBox1.SelectedItem != null)
        {
            HttpCookie bCookie = new HttpCookie("EmployeeToDelete");
            Response.Cookies.Add(bCookie);
            string UID = ListBox1.SelectedValue;
            m.HRForm_Read(bCookie, UID); //Read from database

            /*BEGIN POP-UP*/
            ClientScript.RegisterStartupScript(typeof(Page), "exampleScript",
            "if(confirm(\"Are you sure you want to delete " + bCookie["First Name"] + " " + bCookie["Middle Name"] + " " + bCookie["Last Name"] + "? \"))" +
            "{ document.getElementById('Button1').click(); }", true);
            /*END POP-UP*/

            m.DeleteCookie("EmployeeToDelete");
        }


    }

    protected void Button1_Click(object sender, EventArgs e) //Does the deleting after the pop-up dialog
    {
        if (ListBox1.SelectedItem != null)
        {
            string UID = ListBox1.SelectedValue;
            m.DeleteFromEmployeesByUID(UID);
            Response.Redirect("~/HRForm.aspx");
        }
    }

    protected void updateButton_Click(object sender, EventArgs e)
    {
        if (ListBox1.SelectedItem != null)
        {
            HttpCookie bCookie = new HttpCookie("selectedEmployee");
            Response.Cookies.Add(bCookie);
            string UID = ListBox1.SelectedValue;
            m.HRForm_Read(bCookie, UID); //Read from database
            Response.Redirect("~/EditEmployeeForm.aspx");
        }

    }


}
