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
    public partial class AdminPage : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["constrings"].ConnectionString;
        SqlConnection conn = new SqlConnection();
        SqlCommand com = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                conn.ConnectionString = @"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa";
                conn.Open();
                showdata();
            }
        }
        public void showdata()
        {
            com.CommandText = "SELECT * FROM users WHERE Username='" + Session["Username"] + "'";
            com.Connection = conn;
            sda.SelectCommand = com;
            sda.Fill(ds);
            LblAdmin.Text = ds.Tables[0].Rows[0]["Username"].ToString();

        }

        protected void BtnAdminSignOut_Click(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                Session.RemoveAll();
                Session.Abandon();
                Response.Redirect("HomePage.aspx");
            }   
            
        }
    }
}