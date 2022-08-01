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
    public partial class UpdateForm : System.Web.UI.Page
    {
        [Obsolete]
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String mycon = "Data Source=localhost:1521/xe;User ID=system;Password=system;Unicode=True";
                OracleConnection con = new OracleConnection(mycon);
                con.Open();
                string orc = "SELECT * FROM CP_TABLE WHERE CUS_ID= " + Request.QueryString["Cus_ID"];
                OracleCommand cmd = new OracleCommand(orc, con);
                OracleDataAdapter da = new OracleDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    update_fname.Text = ds.Tables[0].Rows[0]["FIRST_NAME"].ToString();
                    update_lname.Text = ds.Tables[0].Rows[0]["LAST_NAME"].ToString();
                    Update_DropDownList.Text = ds.Tables[0].Rows[0]["GENDER"].ToString();
                    update_email.Text = ds.Tables[0].Rows[0]["EMAIL_ADDRESS"].ToString();
                }
            }
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
        protected void Update_Click(object sender, EventArgs e)
        {
            String mycon = "Data Source=localhost:1521/xe;User ID=system;Password=system;Unicode=True";
            OracleConnection con = new OracleConnection(mycon);
            con.Open();
            string orc = "UPDATE CP_TABLE SET FIRST_NAME='" + update_fname.Text + "', LAST_NAME='" + update_lname.Text + "', GENDER='" + Update_DropDownList.SelectedValue +"', EMAIL_ADDRESS = '" +  update_email.Text + "' WHERE CUS_ID='"+Request.QueryString["Cus_ID"]+"'";
            OracleCommand cmd = new OracleCommand(orc, con);

            int key = Convert.ToInt32(cmd.ExecuteNonQuery().ToString());
            if (key == 0)
            {
                Response.Write("<script LANGUAGE='JavaScript'>alert('ERROR! REGISTRATION IS NOT SUCCESSFUL')</script>");
            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript'>alert('SUBMITTED SUCCESSFULLY')</script>");
                update_fname.Text = "";
                update_lname.Text = "";
                Update_DropDownList.Text = " ";
                update_email.Text = "";
            }
        }
        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }
        protected void Clear_Click(object sender, EventArgs e)
        {
            update_fname.Text = "";
            update_lname.Text = "";
            Update_DropDownList.Text = " ";
            update_email.Text = "";
        }
    }
}