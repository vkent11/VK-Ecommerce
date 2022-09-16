using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace VK_Ecommerce
{
    public partial class PlaceOrder : System.Web.UI.Page
    {
        SqlConnection constr = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
        protected void Page_Load(object sender, EventArgs e)
        {
            string orderid = Session["Orderid"].ToString();
            Label1.Text = orderid;
        }

        protected void BtnSubmitOrder_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into CardDetails"+ "(Fname,Lname,Cardno,ExpiryDate,CCV,BillAddress) values (@Fname,@Lname,@Cardno,@ExpiryDate,@CCV,@BillAddress) ",con);
            cmd.Parameters.AddWithValue("@Fname", TextBox1.Text);
            cmd.Parameters.AddWithValue("@Lname", TextBox2.Text);
            cmd.Parameters.AddWithValue("@Cardno", TextBox3.Text);
            cmd.Parameters.AddWithValue("@ExpiryDate", TextBox4.Text);
            cmd.Parameters.AddWithValue("@CCV", TextBox5.Text);
            cmd.Parameters.AddWithValue("@BillAddress", TextBox6.Text);

            cmd.ExecuteNonQuery();
            
           
            Response.Write("<script>alert('Payment Successfull');</script>");
            Session["address"] = TextBox6.Text;
            Response.Redirect("Pdf_File.aspx");
            con.Close();

            
            }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            //Session["buyitems"] = null;
            ClearCart();
        }
        public void ClearCart()
        {
            constr.Open();
            SqlCommand cmd = new SqlCommand("Delete from OrderDetails where orderid='" + Label1.Text + "' ", constr);
            cmd.ExecuteNonQuery();
            constr.Close();
            Response.Redirect("AddToCart.aspx");
        }
    }
 }
