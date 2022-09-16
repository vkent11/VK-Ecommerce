using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace VK_Ecommerce.HomePage
{
    public partial class ReplyMessage : System.Web.UI.Page
    {
        string cs = @"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtID.Text = Request.QueryString["ID"];
                txtFirstname.Text = Request.QueryString["Firstname"];
                txtLastname.Text = Request.QueryString["Lastname"];
                txtEmail.Text = Request.QueryString["Email"];
                txtContact.Text = Request.QueryString["Phone"];
                txtUsername.Text = Request.QueryString["Username"];
                
            }
        }

        protected void BtnSend_Click(object sender, EventArgs e)
        {
            string ID = txtID.Text;

            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("Update Messages set Reply=@Reply where ID=@ID ", con);
            cmd.Parameters.AddWithValue("@Reply", txtReply.Text.ToString());
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Message Sent Succesfully')</script>");
        }
    }
}