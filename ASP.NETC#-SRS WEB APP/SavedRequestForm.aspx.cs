using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net;

public partial class SavedRequestForm : System.Web.UI.Page
{
    public static Methods m = new Methods();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!m.CookieExists("userInfo")) //Fixes 'Chuck E Hacker' bug
        {
            m.SIMPLE_POPUP("Something went wrong!");
            Response.Redirect("~/Login.aspx"); //Send unauthorized user back to login page.
        }
        HttpCookie aCookie = Request.Cookies["userInfo"];
        HttpCookie usernameCookie = new HttpCookie("USERname");
        usernameCookie.Value = aCookie.Values["userName"];
        Response.Cookies.Add(usernameCookie);

        /*DOUBLE CLICK EVENT FOR LISTBOX*/
        if (Request["__EVENTARGUMENT"] != null && Request["__EVENTARGUMENT"] == "move")
        {
            HttpCookie cCookie = new HttpCookie("draftInfo"); //trying to store info that will be seen on ViewSubmittedForm.aspx into cooked 'submittedCookieInfo'
            Response.Cookies.Add(cCookie);

            using (SqlConnection Connection = new SqlConnection("Data Source=badgerequest.cthyx0iu4w46.us-east-2.rds.amazonaws.com;Initial Catalog=badge_request;User ID=pwndatnerd;Password=AaronDavidRandall!3"))
            {
                SqlCommand cmd = new SqlCommand(@"SELECT * FROM Drafts WHERE Employee=@Employee", Connection);
                cmd.Parameters.AddWithValue("@Employee", ListBox1.SelectedValue);
                Connection.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        cCookie["Employee"] = reader["Employee"].ToString();
                        cCookie["Reason"] = reader["ReasonForRequest"].ToString();
                        cCookie["GET"] = reader["GETDate"].ToString();
                        cCookie["SSN"] = reader["SSN"].ToString();
                        cCookie["DOB"] = reader["DateOfBirth"].ToString();
                        cCookie["TOB"] = reader["TypeOfBadge"].ToString();
                        cCookie["Proximity"] = reader["ProximityCard"].ToString();
                        cCookie["Emergency"] = reader["EmergencyAccess"].ToString();
                        cCookie["Accounts"] = reader["ContinueAccounts"].ToString();
                        cCookie["Notes"] = reader["Notes"].ToString();
                    }
                    Connection.Close();
                }


            }

            Response.Redirect("~/EditRequestForm.aspx");
        }
        ListBox1.Attributes.Add("ondblclick", ClientScript.GetPostBackEventReference(ListBox1, "move"));
        /****************/
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/MainMenuForm.aspx");
    }
}