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
    public partial class ViewUser : System.Web.UI.Page
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
            com.CommandText = "SELECT * FROM userdetails WHERE Username='" + Session["Username"] + "'";
            com.Connection = conn;
            sda.SelectCommand = com;
            sda.Fill(ds);
            Label1.Text = ds.Tables[0].Rows[0]["Fullname"].ToString();
            Label2.Text = ds.Tables[0].Rows[0]["Username"].ToString();
            Label3.Text = ds.Tables[0].Rows[0]["Password"].ToString();
            Label4.Text = ds.Tables[0].Rows[0]["Contact"].ToString();
            Label5.Text = ds.Tables[0].Rows[0]["Home"].ToString();
            Label6.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            Label7.Text = ds.Tables[0].Rows[0]["Gender"].ToString();
            //Image1.ImageUrl = ds.Tables[0].Rows[0]["Image"].ToString();

            //SqlConnection con = new SqlConnection(cs);
            //SqlDataAdapter sda1 = new SqlDataAdapter("Select Image from userdetails", con);

            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void BtnUpdateUser_Click(object sender, EventArgs e)
        {
            string User = Session["Username"].ToString();
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select Fullname,Password,Contact,Home,Email,Gender from userdetails where Username=" + User + " ", con))

                {
                    cmd.Connection = con;
                    con.Open();
                    

                       
                        string Fullname = Label1.Text;
                        string Password = Label3.Text;
                        string Contact = Label4.Text;
                        string Home = Label5.Text;
                        string Email = Label6.Text;
                        string Gender = Label7.Text;


                        Response.Redirect("UpdateUser.aspx?Username=" + User + "&Fullname=" + Fullname + "&Password=" + Password + "&Contact=" + Contact + "&Home=" + Home + "&Email=" + Email + "&Gender=" + Gender);


                   
                    con.Close();

                }
            }
        }
    }
}