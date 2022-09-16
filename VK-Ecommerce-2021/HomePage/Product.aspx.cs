using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
namespace VK_Ecommerce.HomePage
{
    public partial class Product : System.Web.UI.Page
    {
        SqlConnection conns = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
        //"~/Uploads/" + 
        SqlConnection conn = new SqlConnection();
        SqlCommand com = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Ad to wissh list
            Session["addproductwish"] = "false";


            if (Request.QueryString["cat"] != null)
            {
                DataList1.DataSourceID = null;
                DataList1.DataSource = SqlDataSource2;
                DataList1.DataBind();

            }
            if (Request.QueryString["sub"] != null)
            {
                DataList1.DataSourceID = null;
                DataList1.DataSource = SqlDataSource3;
                DataList1.DataBind();

            }

            if (!IsPostBack)
            {
                DdlSubCategory();
            }
          
           
        }

       

        protected void search_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
            SqlDataAdapter sda = new SqlDataAdapter("select * from product where(Name like '%" + txtSearch.Text + "%') or (Brand like '%" + txtSearch.Text + "%')", conn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DataList1.DataSourceID = null;
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            
            if (e.CommandName == "ViewProductDetail")
            {

                
                Response.Redirect("ViewProduct.aspx?id=" + e.CommandArgument.ToString());
            }

            //Add to Cart
            Session["addproduct"] = "true";
            if(e.CommandName == "AddToCart")
            {
                
                DropDownList list = (DropDownList)(e.Item.FindControl("DropDownList1"));
                DropDownList size = (DropDownList)(e.Item.FindControl("DropDownList2"));
                Response.Redirect("AddToCart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + list.SelectedItem.ToString() + "&size=" + size.SelectedItem.ToString());
            }

            //Add to Wish List
            Session["addproductwish"] = "true";
            if (e.CommandName == "AddToWish")
            {

                DropDownList list = (DropDownList)(e.Item.FindControl("DropDownList1"));
                DropDownList size = (DropDownList)(e.Item.FindControl("DropDownList2"));
                Response.Redirect("AddToWishList.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + list.SelectedItem.ToString() + "&size=" + size.SelectedItem.ToString());
            }
        }

        protected void BtnMenCat_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx?cat=Men");
        }

        protected void BtnWomenCat_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx?cat=Women");
        }

        protected void BtnKidCat_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx?cat=Kids");
        }

        protected void BtnViewAll_Click(object sender, EventArgs e)
        {
            DataList1.DataSourceID = null;
            DataList1.DataSource = SqlDataSource1;
            DataList1.DataBind();
        }

        protected void DdlSubCat_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strQuery = "";
            string selectedProduct = DdlSubCat.SelectedItem.Text;
            if (selectedProduct == "Select Brand")
            {
                strQuery = "";
            }
            else
            {
                strQuery = " where Brand = '" + selectedProduct + "' ";  
            }
            SqlDataAdapter sda = new SqlDataAdapter("select * from product " + strQuery + "", conns);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            try
            {
                if (selectedProduct == dt.Rows[0][7].ToString())
                {

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('No product Found')</script>");
            }
            DataList1.DataSourceID = null;
            DataList1.DataSource = dt;
            DataList1.DataBind();
            //DataList1.DataSourceID = null;
            //DataList1.DataSource = SqlDataSource1;
            //DataList1.DataBind();
        }

        public void DdlSubCategory()
        {
            conns.Open();
            SqlCommand cmd = new SqlCommand("select * from Brand", conns);
            DdlSubCat.DataSource = cmd.ExecuteReader();
            DdlSubCat.DataTextField = "BrandName";
            DdlSubCat.DataValueField = "ID";
            DdlSubCat.DataBind();
            DdlSubCat.Items.Insert(0, "Select Brand");
            conns.Close();
        }

        protected void BtnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }

        protected void BtnRunning_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx?sub=Running");
        }

        protected void BtnBasketball_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx?sub=Basketball");
        }

        protected void BtnFormal_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx?sub=Formal");
        }

        protected void BtnCasual_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx?sub=Casual");
        }

        protected void BtnHeelsSandals_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx?sub=Heels and Sandals");
        }

        protected void BtnRunning2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx?sub=Running");
        }

        protected void BtnFormal2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx?sub=Formal");
        }

        protected void BtnCasual2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx?sub=Casual");
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            Label stock = e.Item.FindControl("Label5") as Label;
            LinkButton btn = e.Item.FindControl("BtnAdCart") as LinkButton;
            Label sID = e.Item.FindControl("Label6") as Label;

            //Wish List
            LinkButton wish = e.Item.FindControl("BtnAddWish") as LinkButton;
            DropDownList selectQuantity = (DropDownList)(e.Item.FindControl("DropDownList1"));

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
            string stockdata = "";

            if (ds.Tables[0].Rows.Count > 0)
            {
                stockdata = ds.Tables[0].Rows[0]["Quantity"].ToString();
            }
            con.Close();
            if (stockdata == "0")
            {
                stock.Text = "Sold Out";
                btn.Enabled = false;
                wish.Enabled = false;
                selectQuantity.Enabled = false; 
            }
            else
            {
                stock.Text = stockdata;
            }

            if (Session["Username"] != null)
            {
                SqlDataAdapter sda1 = new SqlDataAdapter("select ProductID from WishList where ProductID= '" + sID.Text + "' and Email= '" + Session["Username"].ToString() + "' ", con);
                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);
                if (dt1.Rows.Count == 1)
                {
                    wish.Enabled = false;
                    wish.Text = "Already in Wish List";
                }
                else
                {
                    wish.Enabled = true;


                }
            }


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

        protected void BtnHeels3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx?sub=Heels and Sandals");
        }

        protected void BtnRunning3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx?sub=Running");
        }

        protected void BtnFormal3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx?sub=Formal");
        }

        protected void BtnCasual3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx?sub=Casual");
        }

        protected void BtnBasketball3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx?sub=Basketball");
        }
    }
}