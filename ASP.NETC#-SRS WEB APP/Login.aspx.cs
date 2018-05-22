using System;
using System.Web;

public partial class Login : System.Web.UI.Page
{
    public static Methods m = new Methods();


    protected void Page_Load(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "script", "LoginFadeIn();", true); //fade effects script (see JS.js file)
        /*If user somehow ends up back on Login page, lets make them log back in and reset their session */
        /*REMOVE EVERY POSSIBLE COOKIE THAT MAY HAVE BEEN RECEIVED TO PREVENT ERRORS*/
        m.DeleteCookie("userInfo"); 
        m.DeleteCookie("USERname");
        m.DeleteCookie("submittedCookieInfo");
        m.DeleteCookie("Manager");
        m.DeleteCookie("draftInfo");
        m.DeleteCookie("EmployeeToDelete");
        m.DeleteCookie("selectedEmployee");
        /*****************************************************************************/
    }

    protected void LoginBtn_Click(object sender, EventArgs e)
    {
        HttpCookie aCookie = new HttpCookie("userInfo");
        Response.Cookies.Add(aCookie);
        m.checkLogin(aCookie, userBox.Text, passBox.Text); /*We will check the login info, and if the password hashes correctly, 
                                                   and the username matches; then we will fill the 'userInfo' cookie and send them to the MainMenuForm.*/
        if(aCookie.Values["isManager"] != null && aCookie.Values["isManager"] != "") //If its not null or empty, then login was succesful, so redirect to MainMenuForm
            Response.Redirect("~/MainMenuForm.aspx");
        else
        {
            
            Response.Redirect("~/Login.aspx"); //Cookie not filled, login was not succesful so reload Login page
        }
            
    }
}