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
    public partial class AddToCart : System.Web.UI.Page
    {
        SqlConnection constr = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
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



               

                if (Session["Username"] == null)
                {
                   ScriptManager.RegisterStartupScript(this, this.GetType(),
                   "alert",
                   "alert('You Must Sign In First');window.location ='HomePage.aspx';",
                   true);
                }
                else
                {
                    
                    Session["addproduct"] = "false";
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

                    if (Request.QueryString["id"] != null)
                    {
                        if (Session["buyitems"] == null)
                        {
                            dr = dt.NewRow();
                            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");

                            SqlDataAdapter da = new SqlDataAdapter("select * from product where Productid=" + Request.QueryString["id"], conn);
                            DataSet ds = new DataSet();
                            da.Fill(ds);

                            dr["sno"] = 1;
                            dr["Productid"] = ds.Tables[0].Rows[0]["Productid"].ToString();
                            dr["Name"] = ds.Tables[0].Rows[0]["Name"].ToString();
                            dr["Image"] = ds.Tables[0].Rows[0]["Image"].ToString();
                            dr["Brand"] = ds.Tables[0].Rows[0]["Brand"].ToString();
                            dr["Size"] = Request.QueryString["size"].ToString();
                            dr["Price"] = ds.Tables[0].Rows[0]["Price"].ToString();
                            dr["quantity"] = Request.QueryString["quantity"].ToString();

                            int price = Convert.ToInt32(ds.Tables[0].Rows[0]["Price"].ToString());
                            int quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                            int totalPrice = price * quantity;
                            dr["totalPrice"] = totalPrice;

                            dt.Rows.Add(dr);

                            conn.Open();
                            //SqlCommand cmd = new SqlCommand("insert into  CartDetails (Productid, Name, Price, Quantity, Brand, Size, totalprice, Email, Image) values ('" + dr["Productid"] + "','" + dr["Name"] + "','" + dr["Price"] + "','" + dr["quantity"] + "','" + dr["Brand"] + "''" + dr["Size"] + "','" + dr["totalPrice"] + "','" + Session["Username"] + "','" + dr["Image"] + "' ) ", conn);
                            //cmd.ExecuteNonQuery();
                            //conn.Close();
                            SqlCommand cmd = new SqlCommand("insert into  CartDetails (Productid, Name, Price, Quantity, Brand, Size, totalprice, Email, Image) values (@Productid, @Name, @Price, @Quantity, @Brand, @Size, @totalprice, @Email, @Image ) ", conn);
                            cmd.Parameters.AddWithValue("@Productid", dr["Productid"]);
                            cmd.Parameters.AddWithValue("@Name", dr["Name"]);
                            cmd.Parameters.AddWithValue("@Price", dr["Price"]);
                            cmd.Parameters.AddWithValue("@Quantity", dr["quantity"]);
                            cmd.Parameters.AddWithValue("@Brand", dr["Brand"]);
                            cmd.Parameters.AddWithValue("@Size", dr["Size"]);
                            cmd.Parameters.AddWithValue("@totalprice", dr["totalPrice"]);
                            cmd.Parameters.AddWithValue("@Email", Session["Username"]);
                            cmd.Parameters.AddWithValue("@Image", dr["Image"]);
                            cmd.ExecuteNonQuery();
                            conn.Close();


                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                            Session["buyitems"] = dt;
                            BtnPlaceOrder.Enabled = true;

                            GridView1.FooterRow.Cells[8].Text = "Total Amount";
                            GridView1.FooterRow.Cells[9].Text = grandTotal().ToString();
                            Response.Redirect("AddToCart.aspx");
                        }
                        else
                        {
                            dt = (DataTable)Session["buyitems"];
                            int sr;
                            sr = dt.Rows.Count;

                            dr = dt.NewRow();
                            SqlConnection scon = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");

                            SqlDataAdapter da = new SqlDataAdapter("select * from product where Productid=" + Request.QueryString["id"], scon);
                            DataSet ds = new DataSet();
                            da.Fill(ds);

                            dr["sno"] = sr + 1;
                            dr["Productid"] = ds.Tables[0].Rows[0]["Productid"].ToString();
                            dr["Name"] = ds.Tables[0].Rows[0]["Name"].ToString();
                            dr["Image"] = ds.Tables[0].Rows[0]["Image"].ToString();
                            dr["Brand"] = ds.Tables[0].Rows[0]["Brand"].ToString();
                            dr["Size"] = Request.QueryString["size"].ToString();
                            dr["Price"] = ds.Tables[0].Rows[0]["Price"].ToString();
                            dr["quantity"] = Request.QueryString["quantity"].ToString();

                            int price = Convert.ToInt32(ds.Tables[0].Rows[0]["Price"].ToString());
                            int quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                            int totalPrice = price * quantity;
                            dr["totalPrice"] = totalPrice;

                            dt.Rows.Add(dr);

                            scon.Open();
                            SqlCommand cmd = new SqlCommand("insert into  CartDetails (Productid, Name, Price, Quantity, Brand, Size, totalprice, Email, Image) values (@Productid, @Name, @Price, @Quantity, @Brand, @Size, @totalprice, @Email, @Image ) ", scon);
                            cmd.Parameters.AddWithValue("@Productid", dr["Productid"]);
                            cmd.Parameters.AddWithValue("@Name", dr["Name"]);
                            cmd.Parameters.AddWithValue("@Price", dr["Price"]);
                            cmd.Parameters.AddWithValue("@Quantity", dr["quantity"]);
                            cmd.Parameters.AddWithValue("@Brand", dr["Brand"]);
                            cmd.Parameters.AddWithValue("@Size", dr["Size"]);
                            cmd.Parameters.AddWithValue("@totalprice", dr["totalPrice"]);
                            cmd.Parameters.AddWithValue("@Email", Session["Username"]);
                            cmd.Parameters.AddWithValue("@Image", dr["Image"]);
                            cmd.ExecuteNonQuery();
                            scon.Close();


                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                            Session["buyitems"] = dt;
                            BtnPlaceOrder.Enabled = true;

                            GridView1.FooterRow.Cells[8].Text = "Total Amount";
                            GridView1.FooterRow.Cells[9].Text = grandTotal().ToString();
                            Response.Redirect("AddToCart.aspx");
                        }
                    }
                    else
                    {
                        dt = (DataTable)Session["buyitems"];
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        if (GridView1.Rows.Count > 0)
                        {

                            GridView1.FooterRow.Cells[8].Text = "Total Amount: ₱";
                            GridView1.FooterRow.Cells[9].Text = grandTotal().ToString();
                        }
                    }
                }
                
            }

            string OrderDate = DateTime.Now.ToShortDateString();
            Session["OrderDate"] = OrderDate;
            orderid();
        }
        
        public int grandTotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            int nrow = dt.Rows.Count;
            int i = 0;
            int totalprice = 0;
            while (i < nrow)
            {
                totalprice = totalprice  + Convert.ToInt32(dt.Rows[i]["totalPrice"].ToString());

                i = i + 1;
            }
            return totalprice;
        }
        public void orderid()
        {
            string alpha = "abcdefghijklmnopqrstuvwxyz123456789";
            Random r = new Random();
            char[] myArray = new char[5];
            for (int i = 0; i < 5; i++)
            {
                myArray[i] = alpha[(int)(35 * r.NextDouble())];
            }
            string orderid;
            orderid = "Order_id: " + DateTime.Now.Hour.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString()
                + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(myArray) + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString();
            Session["Orderid"] = orderid;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];

            for(int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int sr;
                int sr1;
                string qdata;
                string dtdata;
                sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
                TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
                qdata = cell.Text;
                dtdata = sr.ToString();
                sr1 = Convert.ToInt32(qdata);
                TableCell pID = GridView1.Rows[e.RowIndex].Cells[1];

                if (sr == sr1)
                {
                    dt.Rows[i].Delete();
                    dt.AcceptChanges();
                    constr.Open();
                    SqlCommand cmd = new SqlCommand("Delete from CartDetails where ProductID= '" + pID.Text + "' and Email= '" + Session["Username"] + "'  ", constr);
                    cmd.ExecuteNonQuery();
                    constr.Close();
                    break;
                }
            }

            for (int i = 1; i <= dt.Rows.Count; i++)
            {
                dt.Rows[i - 1]["sno"] = i;
                dt.AcceptChanges();
            }
            Session["buyitems"] = dt;
            Response.Redirect("AddToCart.aspx");
        }

        protected void BtnPlaceOrder_Click(object sender, EventArgs e)
        {
            if (Session["buyitems"] == null)
            {
                BtnPlaceOrder.Visible = false;
            }
            else
            {
                BtnPlaceOrder.Visible = true;
                DataTable dt;
                dt = (DataTable)Session["buyitems"];
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                    
                {
                    if (RadioButton1.Checked)
                    {
                       
                       
                            SqlConnection scon = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
                            scon.Open();
                            SqlCommand cmd1 = new SqlCommand("insert into OrderDetails(orderid,sno,ProductID,Name,Brand,Size,Price,quantity,Orderdate,Payment,Status,Email) values (@orderid,@sno,@ProductID,@Name,@Brand,@Size,@Price,@quantity,@Orderdate,@Payment,@Status,@Email )", scon);
                            cmd1.Parameters.AddWithValue("@orderid", Session["Orderid"]);
                            cmd1.Parameters.AddWithValue("@sno", dt.Rows[i]["sno"]);
                            cmd1.Parameters.AddWithValue("@ProductID", dt.Rows[i]["ProductID"]);
                            cmd1.Parameters.AddWithValue("@Name", dt.Rows[i]["Name"]);
                            cmd1.Parameters.AddWithValue("@Brand", dt.Rows[i]["Brand"]);
                            cmd1.Parameters.AddWithValue("@Size", dt.Rows[i]["Size"]);
                            cmd1.Parameters.AddWithValue("@Price", dt.Rows[i]["Price"]);
                            cmd1.Parameters.AddWithValue("@quantity", dt.Rows[i]["quantity"]);
                            cmd1.Parameters.AddWithValue("@Orderdate", Session["Orderdate"]);
                            cmd1.Parameters.AddWithValue("@Payment", "Debit or Credit Card");
                            cmd1.Parameters.AddWithValue("@Status", "Pending");
                            cmd1.Parameters.AddWithValue("@Email", Session["Username"]);
                            cmd1.ExecuteNonQuery();
                            //Response.Write("<script>alert('Place Order Successfull');</script>");
                            //scon.Close();
                            //Response.Redirect("PlaceOrder.aspx");
                            Session["address"] = LblAddress.Text;
                            Session["payment"] = "Debit or Credit Card";
                            //Response.Redirect("Pdf_File.aspx");




                            ScriptManager.RegisterStartupScript(this, this.GetType(),
                            "alert",
                            "alert('Prossesing to Debit or Credit Card Payment');window.location ='PlaceOrder.aspx';",
                            true);


                            //Response.Redirect("PlaceOrder.aspx");
                        
                    }
                    else
                    {
                        SqlConnection scon = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
                        scon.Open();
                        SqlCommand cmd = new SqlCommand("insert into OrderDetails(orderid,sno,ProductID,Name,Brand,Size,Price,quantity,Orderdate,Payment,Status,Email) values (@orderid,@sno,@ProductID,@Name,@Brand,@Size,@Price,@quantity,@Orderdate,@Payment,@Status,@Email )", scon);
                        cmd.Parameters.AddWithValue("@orderid", Session["Orderid"]);
                        cmd.Parameters.AddWithValue("@sno", dt.Rows[i]["sno"]);
                        cmd.Parameters.AddWithValue("@ProductID", dt.Rows[i]["ProductID"]);
                        cmd.Parameters.AddWithValue("@Name", dt.Rows[i]["Name"]);
                        cmd.Parameters.AddWithValue("@Brand", dt.Rows[i]["Brand"]);
                        cmd.Parameters.AddWithValue("@Size", dt.Rows[i]["Size"]);
                        cmd.Parameters.AddWithValue("@Price", dt.Rows[i]["Price"]);
                        cmd.Parameters.AddWithValue("@quantity", dt.Rows[i]["quantity"]);
                        cmd.Parameters.AddWithValue("@Orderdate", Session["Orderdate"]);
                        cmd.Parameters.AddWithValue("@Payment", DropDownList1.SelectedValue);
                        cmd.Parameters.AddWithValue("@Status", "Pending");
                        cmd.Parameters.AddWithValue("@Email", Session["Username"]);
                        cmd.ExecuteNonQuery();
                        //Response.Write("<script>alert('Place Order Successfull');</script>");
                        //scon.Close();
                        //Response.Redirect("PlaceOrder.aspx");
                        Session["address"] = LblAddress.Text;
                        Session["payment"] = DropDownList1.SelectedValue;
                        //Response.Redirect("Pdf_File.aspx");




                        ScriptManager.RegisterStartupScript(this, this.GetType(),
                        "alert",
                        "alert('Place Order Successfull, View your Order');window.location ='Pdf_File.aspx';",
                        true);
                    }
                   
                    
                   
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

        protected void BtnClearCart_Click(object sender, EventArgs e)
        {
            Session["buyitems"] = null;
            ClearCart();
        }
        public void ClearCart()
        {
            constr.Open();
            SqlCommand cmd = new SqlCommand("Delete from CartDetails where Email='" + Session["Username"] + "' ", constr);
            cmd.ExecuteNonQuery();
            constr.Close();
            Response.Redirect("AddToCart.aspx");
        }
    }
}