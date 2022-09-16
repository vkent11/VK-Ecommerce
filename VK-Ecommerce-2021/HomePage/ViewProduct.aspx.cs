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
    public partial class ViewProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Request.QueryString["id"] == null)
                {
                    Response.Redirect("Product.aspx");
                }
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (Session["Username"] == null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert",
                "alert('You Must Sign In First');window.location ='HomePage.aspx';",
                true);
            }

            //Add to Cart
            Session["addproduct"] = "true";
            if (e.CommandName == "AddToCart")
            {

                DropDownList list = (DropDownList)(e.Item.FindControl("DropDownList1"));
                DropDownList size = (DropDownList)(e.Item.FindControl("DropDownList2"));
                Response.Redirect("AddToCart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + list.SelectedItem.ToString() + "&size=" + size.SelectedItem.ToString());
            }
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            LinkButton btn = e.Item.FindControl("BtnCartAdd") as LinkButton;
            Label sID = e.Item.FindControl("Label6") as Label;

            string mycon = @"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa";
            string query = "Select * from product where ProductID=" + sID.Text;
            SqlConnection con = new SqlConnection(mycon);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = cmd;
            DataSet ds = new DataSet();
            sda.Fill(ds);
            if (Session["Username"] != null)
            {
                SqlDataAdapter sda2 = new SqlDataAdapter("select ProductID from CartDetails where ProductID= '" + sID.Text + "' and Email= '" + Session["Username"].ToString() + "' ", con);
                DataTable dt2 = new DataTable();
                sda2.Fill(dt2);
                if (dt2.Rows.Count == 1)
                {
                    btn.Enabled = false;
                    btn.Text = "Already in Cart";
                }
                else
                {
                    btn.Enabled = true;


                }
            }
        }
    }
}