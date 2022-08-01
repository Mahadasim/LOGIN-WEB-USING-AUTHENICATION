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
    public partial class LoginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        [Obsolete]
        protected void Submit_Click(object sender, EventArgs e)
        {
            String mycon = "Data Source=localhost:1521/xe;User ID=system;Password=system;Unicode=True";
            OracleConnection con = new OracleConnection(mycon);
            con.Open();
            string orc = "SELECT COUNT(*) from LOGIN_DB WHERE USERNAME='" + username.Text + "'";
            OracleCommand cmd = new OracleCommand(orc, con);
            int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            con.Close();
            if(temp==1)
            {
                con.Open();
                string orcd = "SELECT PASSWORD from LOGIN_DB WHERE USERNAME='" + username.Text + "'";
                OracleCommand com = new OracleCommand(orcd, con);
                string pswd = com.ExecuteScalar().ToString().Replace(" ","");
                if(pswd == password.Text)
                {
                    Session["User Authenication"] = username.Text;
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('PASSWORD IS INCORRECT')</script>");
                }
            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('USERNAME DOES NOT EXIST')</script>");
            }
        }
    }
}