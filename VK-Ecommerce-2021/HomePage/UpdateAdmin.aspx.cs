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
    public partial class UpdateAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBox1.Text = Request.QueryString["Fullname"];
                TextBox7.Text = Request.QueryString["Username"];
                TextBox2.Text = Request.QueryString["Password"];
                TextBox3.Text = Request.QueryString["Phone"];
                TextBox4.Text = Request.QueryString["Home"];
                TextBox5.Text = Request.QueryString["Email"];
                

            }
        }

        protected void BtnAdminUpdate_Click(object sender, EventArgs e)
        {
            string Fullname = TextBox1.Text;
            string Username = TextBox7.Text;
            string Password = TextBox2.Text;
            string Contact = TextBox3.Text;
            string Home = TextBox4.Text;
            string Email = TextBox5.Text;
            
            string constr = ConfigurationManager.ConnectionStrings["constrings"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand("update admin set Fullname=@Fullname,Password=@Password,Phone=@Phone,Home=@Home,Email=@Email  where Username=@Username ", con);
                cmd.Parameters.AddWithValue("@Fullname", Fullname);
                cmd.Parameters.AddWithValue("@Password", Password);
                cmd.Parameters.AddWithValue("@Phone", Contact);
                cmd.Parameters.AddWithValue("@Home", Home);
                cmd.Parameters.AddWithValue("@Email", Email);
                
                
                cmd.Parameters.AddWithValue("@Username", Username);

                SqlCommand cmd2 = new SqlCommand("update users set Fullname=@Fullname,Password=@Password,Email=@Email  where Username=@Username ", con);
                cmd2.Parameters.AddWithValue("@Fullname", Fullname);
                cmd2.Parameters.AddWithValue("@Password", Password);
                cmd2.Parameters.AddWithValue("@Email", Email);
                cmd2.Parameters.AddWithValue("@Username", Username);

                con.Open();
                cmd.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();
                con.Close();
                //Response.Write("<script>alert('Successfully Updated!')</script>");

                ScriptManager.RegisterStartupScript(this, this.GetType(),
               "alert",
               "alert('Successfully Updated!');window.location ='AdminSettings.aspx';",
               true);
            }
        }
    }
}