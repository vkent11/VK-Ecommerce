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
    public partial class UpdateOrders : System.Web.UI.Page
    {
        string cs = @"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                txtOrderID.Text = Request.QueryString["orderid"];
                txtSno.Text = Request.QueryString["sno"];
                txtID.Text = Request.QueryString["ProductID"];
                txtName.Text = Request.QueryString["Name"];
                txtBrand.Text = Request.QueryString["Brand"];
                txtSize.Text = Request.QueryString["Size"];
                txtPrice.Text = Request.QueryString["Price"];
                txtQuantity.Text = Request.QueryString["quantity"];
                txtOrderDate.Text = Request.QueryString["Orderdate"];
                txtPayment.Text = Request.QueryString["Payment"];
                txtEmail.Text = Request.QueryString["Email"];
            }
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            int Qnty = 0;
            string orderid = txtOrderID.Text;
            string Name = txtName.Text;
            if (DDLStatus.SelectedValue == "Completed")
            {
                SqlConnection con3 = new SqlConnection(cs);
                con3.Open();
                SqlCommand cmd3 = new SqlCommand("Update OrderDetails set Status=@Status where orderid=@orderid ", con3);
                cmd3.Parameters.AddWithValue("@Status", DDLStatus.SelectedValue);
                cmd3.Parameters.AddWithValue("@orderid", orderid);
                cmd3.ExecuteNonQuery();
                con3.Close();
                Response.Write("<script>alert('Status Updated Succesfully')</script>");
            }
            else
            {
                Qnty = Convert.ToInt32(txtQuantity.Text.ToString());
                SqlConnection con = new SqlConnection(cs);
                con.Open();
                SqlCommand cmd = new SqlCommand("Update OrderDetails set Status=@Status where orderid=@orderid ", con);
                SqlCommand cmd2 = new SqlCommand("Update product set  Quantity=Quantity - " + Qnty + " where Name=@Name ", con);
                cmd.Parameters.AddWithValue("@Status", DDLStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@orderid", orderid);

                cmd2.Parameters.AddWithValue("@Name", Name);
                cmd.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Status Updated Succesfully')</script>");
            }
            
        }
    }
}