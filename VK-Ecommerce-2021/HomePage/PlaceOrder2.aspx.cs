using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace VK_Ecommerce.HomePage
{
    public partial class PlaceOrder2 : System.Web.UI.Page
    {
        SqlConnection conns = new SqlConnection();
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sdas = new SqlDataAdapter();
        DataSet ds1 = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    //conn.ConnectionString = "Data Source=localhost;Database=db_vk_ecommerce;User ID=root;Password=;sslmode=none";
                    //conn.Open();
                    conns.ConnectionString = @"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa";
                    conns.Open();
                    showdata();

                }
            }
        }


        public void showdata()
        {
            comm.CommandText = "SELECT * FROM userdetails WHERE Username='" + Session["Username"] + "'";
            comm.Connection = conns;
            sdas.SelectCommand = comm;
            sdas.Fill(ds1);
            LblUser.Text = ds1.Tables[0].Rows[0]["Username"].ToString();
            LblContact.Text = ds1.Tables[0].Rows[0]["Contact"].ToString();
            LblAddress.Text = ds1.Tables[0].Rows[0]["Home"].ToString();
            LblEmail.Text = ds1.Tables[0].Rows[0]["Email"].ToString();

        }

        protected void BtnPlaceOrders_Click(object sender, EventArgs e)
        {
            Session["address"] = LblAddress.Text;
            Response.Redirect("Pdf_File.aspx");
        }
    }
}