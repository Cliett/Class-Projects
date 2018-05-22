using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditEmployeeForm : System.Web.UI.Page
{
    public static Methods m = new Methods();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!m.CookieExists("userInfo")) //Fixes 'Chuck E Hacker' bug
        {
            m.SIMPLE_POPUP("Something went wrong!");
            Response.Redirect("~/Login.aspx"); //Send unauthorized user back to login page.
        }
        EmployeeDDL.Items.Add("No Manager"); //Manually adding the 'No Manager' option to the drop down list.
        if (Request.Cookies["selectedEmployee"] != null)
        {
            /*Populate the fields with the cookie information*/
            HttpCookie cCookie = Request.Cookies["selectedEmployee"];
            TextBox1.Text = cCookie["First Name"]; TextBox2.Text = cCookie["Middle Name"]; TextBox3.Text = cCookie["Last Name"]; TextBox4.Text = cCookie["Initials"]; TextBox5.Text = cCookie["UserID"]; TextBox5.ReadOnly = true; TextBox6.Text = cCookie["Employee Company"]; TextBox7.Text = cCookie["Department"]; TextBox8.Text = cCookie["Work Location"]; TextBox9.Text = cCookie["Work Phone Number"]; TextBox10.Text = cCookie["Manager Work Location"]; TextBox11.Text = cCookie["Manager Work Phone Number"];
            /************************************************/

            if (cCookie["Manager Name"] == "")
                EmployeeDDL.Text = "No Manager";
            else
                EmployeeDDL.Text = cCookie["Manager Name"];

            m.DeleteCookie("selectedEmployee");
        }

    }

    protected void CancelButton_Click(object sender, EventArgs e) //back button
    {
        Response.Redirect("~/HRForm.aspx");

    }



    protected void SubmmitButton_Click(object sender, EventArgs e) //save button
    {
        if (TextBox1.Text != "" && TextBox2.Text != "" && TextBox3.Text != "" && TextBox4.Text != "" && TextBox5.Text != "" && TextBox6.Text != "" && TextBox7.Text != "" && TextBox8.Text != "" && TextBox9.Text != "" && EmployeeDDL.SelectedItem != null && TextBox5.ReadOnly == false)
        {/*New Employee Case*/
            m.EditEmployee("NEW", TextBox3.Text, TextBox1.Text, TextBox2.Text, TextBox4.Text, TextBox5.Text, TextBox6.Text, TextBox7.Text, TextBox8.Text, TextBox9.Text, TextBox10.Text, TextBox11.Text, EmployeeDDL.SelectedItem.Text);
            Response.Redirect("~/HRForm.aspx");
        }
        if (TextBox1.Text != "" && TextBox2.Text != "" && TextBox3.Text != "" && TextBox4.Text != "" && TextBox6.Text != "" && TextBox7.Text != "" && TextBox8.Text != "" && TextBox9.Text != "" && EmployeeDDL.SelectedItem != null && TextBox5.ReadOnly == true)
        {/*Update Employee Case*/
            m.EditEmployee("UPDATE", TextBox3.Text, TextBox1.Text, TextBox2.Text, TextBox4.Text, TextBox5.Text, TextBox6.Text, TextBox7.Text, TextBox8.Text, TextBox9.Text, TextBox10.Text, TextBox11.Text, EmployeeDDL.SelectedItem.Text);
            Response.Redirect("~/HRForm.aspx");
        }
    }





















    /************************************UNUSED STUFF BELOW************************************/
    /******************************************************************************************/
    /******************************************************************************************/
    /******************************************************************************************/
    protected void EmployeeDDL_Load(object sender, EventArgs e)
    {
    }

    protected void TextBox8_TextChanged(object sender, EventArgs e)
    {

    }
    protected void SaveButton_Click(object sender, EventArgs e) //dont use
    {
        //dont use me plz
    }
}