using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace VK_Ecommerce.HomePage
{
    public partial class ValidateEmail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnContinue_Click(object sender, EventArgs e)
        {
            string Cs = ConfigurationManager.ConnectionStrings["constrings"].ConnectionString;

            using (SqlConnection con = new SqlConnection(Cs))
            {
                string user = txtEmail.Text.Trim();
                SqlCommand com = new SqlCommand("Select * from userdetails where Email=@Email ", con);
                com.Parameters.AddWithValue("@Email", txtEmail.Text);

                con.Open();
                cleartxt();
                SqlDataAdapter sda = new SqlDataAdapter(com);

                DataTable dt = new DataTable();

                sda.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    Session["Email"] = user;
                    Response.Redirect("ChangePassword.aspx");
                }
                else
                {
                    LblMessage.Text = "Invalid Email Address!!!";
                    MsgBox(" Invalid Email Address!!! ", this.Page, this);
                }
            }
        }
        public void cleartxt()
        {
            txtEmail.Text = "";

        }

        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }
    }
}