using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.OracleClient;
using System.Web.UI.WebControls;

namespace Login
{
    public partial class RegForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User Authenication"] == null)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Session has been Expired!!')</script>");
                Response.Redirect("LoginForm.aspx");
            }
            else
            {
                Response.Write("\nUser Authenication: " + Session["User Authenication"]);
                Session.Timeout = 1;
            }
        }

        [Obsolete]
        protected void Submit_Click(object sender, EventArgs e)
        {
            String mycon = "Data Source=localhost:1521/xe;User ID=system;Password=system;Unicode=True";
            OracleConnection con = new OracleConnection(mycon);
            con.Open();
            string orc = "INSERT INTO CP_TABLE VALUES (cp_id.NEXTVAL,'" + fname.Text + "','" + lname.Text + "','" + DropDownList.SelectedValue + "',CURRENT_TIMESTAMP,'" + email.Text + "')";
            OracleCommand cmd = new OracleCommand(orc, con);
            int key = Convert.ToInt32(cmd.ExecuteNonQuery().ToString());
            if (key == 0)
            {
                Response.Write("<script LANGUAGE='JavaScript'>alert('ERROR! REGISTRATION IS NOT SUCCESSFUL')</script>");
            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript'>alert('SUBMITTED SUCCESSFULLY')</script>");
                fname.Text = "";
                lname.Text = "";
                DropDownList.Text = " ";
                email.Text = "";
            }
            con.Close();
        }
        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }
        protected void Clear_Click(object sender, EventArgs e)
        {
            fname.Text = "";
            lname.Text = "";
            DropDownList.Text = " ";
            email.Text = "";
        }
    }
}