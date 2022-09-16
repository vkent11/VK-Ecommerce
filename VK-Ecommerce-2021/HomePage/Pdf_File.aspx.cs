using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;


namespace VK_Ecommerce.HomePage
{
    public partial class Pdf_File : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string orderid = Session["Orderid"].ToString();
            Label1.Text = orderid;
            findorderdate(Label2.Text);
            string address = Session["address"].ToString();
            Label3.Text = address;
            string User = Session["Username"].ToString();
            Label5.Text = User;
            showgrid(Label1.Text);
        }

        private void findorderdate(string orderid)
        {
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
            SqlCommand cmd = new SqlCommand("select * from OrderDetails where orderid='" + Label1.Text + "' ",con);
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = cmd;
            DataSet ds = new DataSet();
            sda.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Label2.Text = ds.Tables[0].Rows[0]["OrderDate"].ToString();
            }
            con.Close();
        }

        private void showgrid(string orderid)
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("sno");
            dt.Columns.Add("productid");
            dt.Columns.Add("productname");
            dt.Columns.Add("brand");
            dt.Columns.Add("size");
            dt.Columns.Add("quantity");
            dt.Columns.Add("price");
            dt.Columns.Add("totalprice");
           
            SqlConnection scon = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
            SqlCommand cmd = new SqlCommand("select * from OrderDetails where orderid='" + Label1.Text + "' ", scon);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            int totalrows = ds.Tables[0].Rows.Count;
            int i = 0;
            int grandtotal = 0;
            while (i < totalrows)
            {
                dr = dt.NewRow();
                dr["sno"] = ds.Tables[0].Rows[i]["sno"].ToString();
                dr["productid"] = ds.Tables[0].Rows[i]["ProductID"].ToString();
                dr["productname"] = ds.Tables[0].Rows[i]["Name"].ToString();
                dr["brand"] = ds.Tables[0].Rows[i]["Brand"].ToString();
                dr["size"] = ds.Tables[0].Rows[i]["Size"].ToString();
                dr["quantity"] = ds.Tables[0].Rows[i]["quantity"].ToString();
                dr["price"] = ds.Tables[0].Rows[i]["Price"].ToString();
                int price = Convert.ToInt32(ds.Tables[0].Rows[i]["Price"].ToString());
                int quantity = Convert.ToInt16(ds.Tables[0].Rows[i]["quantity"].ToString());
                int totalprice = price * quantity;
                dr["totalprice"] = totalprice;
                grandtotal = grandtotal + totalprice;
                dt.Rows.Add(dr);
                i++;
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
            Label4.Text = grandtotal.ToString();
            Label6.Text = Session["payment"].ToString();
        }









        protected void BtnDL_Click(object sender, EventArgs e)
        {
            Session["buyitems"] = null;
            ClearCart();

            Response.Redirect("Product.aspx");
        }
        public void ClearCart()
        {
            SqlConnection constr = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
            constr.Open();
            SqlCommand cmd = new SqlCommand("Delete from CartDetails where Email='" + Session["Username"] + "' ", constr);
            cmd.ExecuteNonQuery();
            constr.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert",
                    "alert('Ordered Successfull');window.location ='Product.aspx';",
                    true);
        }
    }
}