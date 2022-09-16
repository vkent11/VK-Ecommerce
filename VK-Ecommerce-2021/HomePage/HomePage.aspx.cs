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
    public partial class HomePage : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["constrings"].ConnectionString;
        SqlConnection conn = new SqlConnection();
        SqlCommand com = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Username"] != null)
            //{
            //    SqlDataAdapter sda = new SqlDataAdapter("select ProductID form WishList where ProductID= '" + productid.Text + "' ", );
            //}




            //display the user details and hide the login
            if (Session["Username"] != null)
            {

                NotLoggedInPH.Visible = false;
                LoggedInPH.Visible = true;
                //conn.ConnectionString = "Data Source=localhost;Database=db_vk_ecommerce;User ID=root;Password=;sslmode=none";
                //conn.Open();
                conn.ConnectionString = @"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa";
                conn.Open();
                showdata();

            }
            Session["addproductwish"] = "false";

            Session["addproduct"] = "false";

            //Counting Number of Product present in cart
            DataTable dt = new DataTable();
            DataTable dt1 = new DataTable();
            dt = (DataTable)Session["buyitems"];
            dt1 = (DataTable)Session["wishListItems"];
            if (dt != null)
            {
                LblCart.Text = dt.Rows.Count.ToString();
            }
            else
            {
                LblCart.Text = "0";
            }

            if (dt1 != null)
            {
                LblWish.Text = dt1.Rows.Count.ToString();
            }
            else
            {
                LblWish.Text = "0";
            }



        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string user = txtUser.Text.Trim();
            int utype;
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from users where Username=@Username AND Password=@Password", con))
                {
                    DataTable dt = new DataTable();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    cmd.Parameters.AddWithValue("@Username", txtUser.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPass.Text);
                    sda.Fill(dt);
                    cleartxt();
                    if (dt.Rows.Count > 0)
                    {
                        utype = int.Parse(dt.Rows[0]["Utype"].ToString());
                        switch (utype)
                        {
                            case 1:
                                Session["Username"] = user;
                                Response.Redirect("AdminPage.aspx");

                                break;
                            case 2:
                                Session["Username"] = user;
                                Session["buyitems"] = null;
                                Session["wishListItems"] = null;
                                fillSavedCart();
                                fillWishList();
                                Response.Redirect("HomePage.aspx");

                                break;
                            default:
                                MsgBox(" Invalid Username or Password!!! ", this.Page, this);
                                //Response.Write("<script>alert('invalid Username or Password!')</script>");
                                break;
                        }
                    }
                }
                //Response.Write("<script>alert('invalid Username or Password!')</script>");
                MsgBox(" Invalid Username or Password!!! ", this.Page, this);

            }
        }

        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }
        public void cleartxt()
        {
            txtUser.Text = "";
            txtPass.Text = "";
        }

        public void showdata()
        {
            com.CommandText = "SELECT * FROM users WHERE Username='" + Session["Username"] + "'";
            com.Connection = conn;
            sda.SelectCommand = com;
            sda.Fill(ds);
            LblUser.Text = ds.Tables[0].Rows[0]["Username"].ToString();

        }



        protected void BtnUserLogOut1_Click1(object sender, EventArgs e)
        {
            NotLoggedInPH.Visible = true;
            LoggedInPH.Visible = false;
            Session.RemoveAll();
            Session.Abandon();
        }

       

        private void fillSavedCart()
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("sno");
            dt.Columns.Add("Productid");
            dt.Columns.Add("Name");
            dt.Columns.Add("Image");
            dt.Columns.Add("Brand");
            dt.Columns.Add("Size");
            dt.Columns.Add("Price");
            dt.Columns.Add("quantity");
            dt.Columns.Add("totalprice");

            string conn = @"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa";
            SqlConnection cons = new SqlConnection(conn);
            string myquery = "select * from CartDetails where Email= '" + Session["Username"].ToString() + "' ";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = cons;
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = cmd;
            DataSet ds = new DataSet();
            sda.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                int i = 0;
                int counter = ds.Tables[0].Rows.Count;
                while (i < counter)
                {
                    dr = dt.NewRow();

                    dr["sno"] = i + 1;
                    dr["Productid"] = ds.Tables[0].Rows[i]["Productid"].ToString();
                    dr["Name"] = ds.Tables[0].Rows[i]["Name"].ToString();
                    dr["Image"] = ds.Tables[0].Rows[i]["Image"].ToString();
                    dr["Brand"] = ds.Tables[0].Rows[i]["Brand"].ToString();
                    dr["Size"] = ds.Tables[0].Rows[i]["Size"].ToString();
                    dr["Price"] = ds.Tables[0].Rows[i]["Price"].ToString();
                    dr["quantity"] = ds.Tables[0].Rows[i]["Quantity"].ToString();

                    int price = Convert.ToInt32(ds.Tables[0].Rows[i]["Price"].ToString());
                    int quantity = Convert.ToInt16(ds.Tables[0].Rows[i]["Quantity"].ToString());
                    int totalPrice = price * quantity;
                    dr["totalPrice"] = totalPrice;
                    dt.Rows.Add(dr);
                    i = i + 1;
                }
            }
            else
            {
                Session["buyitems"] = null;
            }
            Session["buyitems"] = dt;

        }

        private void fillWishList()
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("sno");
            dt.Columns.Add("productid");
            dt.Columns.Add("image");
            dt.Columns.Add("name");
            dt.Columns.Add("brand");
            dt.Columns.Add("price");


            string conn = @"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa";
            SqlConnection conns = new SqlConnection(conn);
            string myquery = "select * from WishList where Email= '" + Session["Username"].ToString() + "' ";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = conns;
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = cmd;
            DataSet ds = new DataSet();
            sda.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int i = 0;
                int counter = ds.Tables[0].Rows.Count;
                while (i < counter)
                {
                    dr = dt.NewRow();

                    dr["sno"] = i + 1;
                    dr["productid"] = ds.Tables[0].Rows[i]["Productid"].ToString();
                    dr["image"] = ds.Tables[0].Rows[i]["Image"].ToString();
                    dr["name"] = ds.Tables[0].Rows[i]["Name"].ToString();
                    dr["brand"] = ds.Tables[0].Rows[i]["Brand"].ToString();
                    dr["price"] = ds.Tables[0].Rows[i]["Price"].ToString();

                    dt.Rows.Add(dr);
                    i = i + 1;

                }
            }
            else
            {
                Session["wishListItems"] = null;
            }
            Session["wishListItems"] = dt;
        }

    }
}

//UPDATE inventory
//SET qty_on_hand = qty_on_hand - NEW.qty_sold
//WHERE id = New.item_id;