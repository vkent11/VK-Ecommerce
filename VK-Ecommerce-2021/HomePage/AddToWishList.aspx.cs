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
    public partial class AddToWishList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert",
                "alert('You Must Sign In First');window.location ='HomePage.aspx';",
                true);
            }
            else
            {
                if (!IsPostBack)
                {
                    //adding wish list
                    DataTable dt = new DataTable();
                    DataRow dr;
                    dt.Columns.Add("sno");
                    dt.Columns.Add("productid");
                    dt.Columns.Add("image");
                    dt.Columns.Add("name");
                    dt.Columns.Add("brand");
                    dt.Columns.Add("price");

                    if (Request.QueryString["id"] != null)
                    {
                        if (Session["wishListItems"] == null)
                        {
                            dr = dt.NewRow();
                            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");

                            SqlDataAdapter da = new SqlDataAdapter("select * from product where Productid=" + Request.QueryString["id"], conn);
                            DataSet ds = new DataSet();
                            da.Fill(ds);

                            dr["sno"] = 1;
                            dr["productid"] = ds.Tables[0].Rows[0]["ProductID"].ToString();
                            dr["image"] = ds.Tables[0].Rows[0]["Image"].ToString();
                            dr["name"] = ds.Tables[0].Rows[0]["Name"].ToString();
                            dr["brand"] = ds.Tables[0].Rows[0]["Brand"].ToString();
                            dr["price"] = ds.Tables[0].Rows[0]["Price"].ToString();


                            dt.Rows.Add(dr);
                            conn.Open();
                            SqlCommand cmd = new SqlCommand("insert into WishList (Productid, Name, Brand, Price, Email, Image) values (@Productid, @Name, @Brand, @Price, @Email, @Image)", conn);
                            cmd.Parameters.AddWithValue("@Productid", dr["Productid"]);
                            cmd.Parameters.AddWithValue("@Name", dr["Name"]);
                            cmd.Parameters.AddWithValue("@Brand", dr["Brand"]);
                            cmd.Parameters.AddWithValue("@Price", dr["Price"]);
                            cmd.Parameters.AddWithValue("@Email", Session["Username"]);
                            cmd.Parameters.AddWithValue("@Image", dr["Image"]);

                            cmd.ExecuteNonQuery();
                            conn.Close();

                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                            Session["wishListItems"] = dt;
                            Response.Redirect("AddToWishList.aspx");
                        }
                        else
                        {
                            dt = (DataTable)Session["wishListItems"];
                            bool isTrue = false;
                            int sr;
                            sr = dt.Rows.Count;
                            dr = dt.NewRow();
                            SqlConnection scon = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
                            SqlDataAdapter da = new SqlDataAdapter("select * from product where Productid=" + Request.QueryString["id"], scon);
                            DataSet ds = new DataSet();
                            da.Fill(ds);

                            int exist = Convert.ToInt32(ds.Tables[0].Rows[0]["Productid"].ToString());
                            for (int i = 0; i <= dt.Rows.Count - 1; i++)
                            {
                                int pid = Convert.ToInt32(dt.Rows[i]["productid"].ToString());
                                if (exist == pid)
                                {
                                    isTrue = true;
                                    break;
                                }
                            }
                            if (!isTrue)
                            {

                                dr["sno"] = sr + 1;
                                dr["productid"] = ds.Tables[0].Rows[0]["ProductID"].ToString();
                                dr["image"] = ds.Tables[0].Rows[0]["Image"].ToString();
                                dr["name"] = ds.Tables[0].Rows[0]["Name"].ToString();
                                dr["brand"] = ds.Tables[0].Rows[0]["Brand"].ToString();
                                dr["price"] = ds.Tables[0].Rows[0]["Price"].ToString();
                                dt.Rows.Add(dr);
                                scon.Open();
                                SqlCommand cmd = new SqlCommand("insert into WishList (Productid, Name, Image, Brand, Price, Email) values (@Productid, @Name, @Image, @Brand, @Price, @Email)", scon);
                                cmd.Parameters.AddWithValue("@Productid", dr["Productid"]);
                                cmd.Parameters.AddWithValue("@Name", dr["Name"]);
                                cmd.Parameters.AddWithValue("@Image", dr["Image"]);
                                cmd.Parameters.AddWithValue("@Brand", dr["Brand"]);
                                cmd.Parameters.AddWithValue("@Price", dr["Price"]);
                                cmd.Parameters.AddWithValue("@Email", Session["Username"]);
                                cmd.ExecuteNonQuery();

                                scon.Close();


                                GridView1.DataSource = dt;
                                GridView1.DataBind();
                                Session["wishListItems"] = dt;
                                Response.Redirect("AddToWishList.aspx");
                            }
                            else
                            {
                                DataTable dt2 = new DataTable();
                                dt2 = (DataTable)Session["wishListItems"];
                                for (int i = 0; i <= dt2.Rows.Count - 1; i++)
                                {
                                    int id;
                                    int prID;
                                    string prData = Request.QueryString["id"].ToString();
                                    prID = Convert.ToInt32(prData);
                                    id = Convert.ToInt32(dt2.Rows[i]["productid"].ToString());
                                    if (id == prID)
                                    {
                                        dt2.Rows[i].Delete();
                                        dt2.AcceptChanges();
                                        scon.Open();
                                        SqlCommand cmd = new SqlCommand("Delete from WishList where Productid = '" + prID + "' and Email= '" + Session["Username"] + "' ", scon);
                                        cmd.ExecuteNonQuery();
                                        scon.Close();

                                        break;
                                    }
                                }
                                Session["wishListItems"] = dt2;
                                Response.Redirect("AddToWishList.aspx");
                            }
                        }
                    }
                    else
                    {
                        dt = (DataTable)Session["wishListItems"];
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
                if (GridView1.Rows.Count.ToString() == "0")
                {
                    BtnClearWish.Enabled = false;
                }
                else
                {
                    BtnClearWish.Enabled = true;
                }
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection sconn = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
            DataTable dt = new DataTable();
            dt = (DataTable)Session["wishListItems"];
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
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
                    sconn.Open();
                    SqlCommand cmd = new SqlCommand("Delete  from WishList where ProductID= '" + pID.Text + "' and Email= '" + Session["Username"] + "'  ", sconn);
                    cmd.ExecuteNonQuery();
                    sconn.Close();
                    break;
                }
            }

            for (int i = 1; i <= dt.Rows.Count; i++)
            {
                dt.Rows[i - 1]["sno"] = i;
                dt.AcceptChanges();
            }
            Session["wishListItems"] = dt;
            Response.Redirect("AddToWishList.aspx");
        }

        protected void BtnClearWish_Click(object sender, EventArgs e)
        {
            Session["wishListItems"] = null;
            ClearCart();
        }

        public void ClearCart()
        {
            SqlConnection sconn1 = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
            sconn1.Open();
            SqlCommand cmd = new SqlCommand("Delete  from WishList where Email='" + Session["Username"] + "' ", sconn1);
            cmd.ExecuteNonQuery();
            sconn1.Close();
            Response.Redirect("AddToWishList.aspx");
        }
    }
}