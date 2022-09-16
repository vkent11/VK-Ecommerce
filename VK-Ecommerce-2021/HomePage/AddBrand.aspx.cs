using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace VK_Ecommerce.HomePage
{
    public partial class AddBrand1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProduct.aspx");
        }

        protected void BtnAddBrand_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Brand (BrandName)  values ('" + txtBrand.Text + "')", con);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Successfully Added!')</script>");
            cleartxt();
            con.Close();
        }

        public void cleartxt()
        {
            txtBrand.Text = "";
        }
    }
}