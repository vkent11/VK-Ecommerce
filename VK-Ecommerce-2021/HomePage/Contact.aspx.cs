using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace VK_Ecommerce.HomePage
{
    public partial class Contact : System.Web.UI.Page
    {
        SqlConnection constr = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

       
        public void cleartxt()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
        }

        protected void BtnSaveMessage_Click1(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert",
                "alert('You Must Sign In First');window.location ='HomePage.aspx';",
                true);
            }
            else
            {
                constr.Open();
                SqlCommand cmd = new SqlCommand("insert into  Messages (Firstname, Lastname, Email, Phone, Message, Username) values (@Firstname, @Lastname, @Email, @Phone, @Message, @Username) ", constr);
                cmd.Parameters.AddWithValue("@Firstname", TextBox1.Text);
                cmd.Parameters.AddWithValue("@Lastname", TextBox2.Text);
                cmd.Parameters.AddWithValue("@Email", TextBox3.Text);
                cmd.Parameters.AddWithValue("@Phone", TextBox4.Text);
                cmd.Parameters.AddWithValue("@Message", TextBox5.Text);
                cmd.Parameters.AddWithValue("@Username", Session["Username"]);
                cmd.ExecuteNonQuery();
                cleartxt();
                constr.Close();
                Response.Write("<script>alert('Your Message Sent Successfully');</script>");
            }
        }
    }
}