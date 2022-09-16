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
    public partial class AdminSettings : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection();
        SqlCommand com = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();
        //Connection String
        string cs = ConfigurationManager.ConnectionStrings["constrings"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                conn.ConnectionString = @"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa";
                conn.Open();
                showdata();
            }
            else
            {
                Response.Redirect("HomePage.aspx");
            }
        }
        public void showdata()
        {
            com.CommandText = "SELECT * FROM admin WHERE Username='" + Session["Username"] + "'";
            com.Connection = conn;
            sda.SelectCommand = com;
            sda.Fill(ds);
            Label1.Text = ds.Tables[0].Rows[0]["Fullname"].ToString();
            Label2.Text = ds.Tables[0].Rows[0]["Username"].ToString();
            Label3.Text = ds.Tables[0].Rows[0]["Password"].ToString();
            
            Label5.Text = ds.Tables[0].Rows[0]["Home"].ToString();
            Label6.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            
            //Image1.ImageUrl = ds.Tables[0].Rows[0]["Image"].ToString();

            //SqlConnection con = new SqlConnection(cs);
            //SqlDataAdapter sda1 = new SqlDataAdapter("Select Image from userdetails", con);

           
            
        }

        protected void BtnUpdateAdmin_Click(object sender, EventArgs e)
        {
            string User = Session["Username"].ToString();
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select Fullname,Password,Home,Email from admin where Username=" + User + " ", con))

                {
                    cmd.Connection = con;
                    con.Open();



                    string Fullname = Label1.Text;
                    string Password = Label3.Text;
                    
                    string Home = Label5.Text;
                    string Email = Label6.Text;
                    


                    Response.Redirect("UpdateAdmin.aspx?Username=" + User + "&Fullname=" + Fullname + "&Password=" + Password + "&Home=" + Home + "&Email=" + Email);



                    con.Close();

                }
            }
        }
    }
}