using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.OracleClient;
using System.Data;
using System.Web.UI.WebControls;

namespace Login
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Write("<script LANGUAGE='JavaScript' >alert('User has been Logged Out!!')</script>");
            Response.Redirect("LoginForm.aspx");
        }
        protected void Add_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegForm.aspx");
        }

        [Obsolete]
        protected void search_btn_Click(object sender, EventArgs e)
        {
            String mycon = "Data Source=localhost:1521/xe;User ID=system;Password=system;Unicode=True";
            OracleConnection con = new OracleConnection(mycon);
            con.Open();
            string orc = "SELECT * FROM CP_TABLE WHERE FIRST_NAME='" + search.Text + "'";
            OracleCommand cmd = new OracleCommand(orc, con);
            OracleDataReader rr = cmd.ExecuteReader();
            gridview.DataSource = rr;
            gridview.DataBind();
            con.Close();
        }

        [Obsolete]
        protected void List_Click(object sender, EventArgs e)
        {
            String mycon = "Data Source=localhost:1521/xe;User ID=system;Password=system;Unicode=True";
            OracleConnection con = new OracleConnection(mycon);
            con.Open();
            string orc = "SELECT *FROM CP_TABLE ORDER BY FIRST_NAME";
            OracleCommand cmd = new OracleCommand(orc, con);
            OracleDataReader rdr = cmd.ExecuteReader();
            gridview.DataSource = rdr;
            gridview.DataBind();
            con.Close();
        }

        [Obsolete]
        protected void gridview_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label ID = gridview.Rows[e.RowIndex].FindControl("Label6") as Label;
            String mycon = "Data Source=localhost:1521/xe;User ID=system;Password=system;Unicode=True";
            OracleConnection con = new OracleConnection(mycon);
            con.Open();
            string orc = "DELETE FROM CP_TABLE WHERE CUS_ID='" + ID.Text + "'";
            OracleCommand cmd = new OracleCommand(orc, con);
            OracleDataReader rdr = cmd.ExecuteReader();
            gridview.DataSource = rdr;
            gridview.DataBind();
            con.Close();
        }

        protected void gridview_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label ID = gridview.Rows[e.RowIndex].FindControl("Label6") as Label;
            Response.Redirect("UpdateForm.aspx?Cus_ID=" + ID.Text);
        }
    }
}