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
    public partial class OrderList : System.Web.UI.Page
    {
        string cs = @"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] == null)
                {
                    Response.Redirect("HomePage.aspx");
                }
                TextBox1.Visible = true;
                LblYear.Visible = false;
                LblMonth.Visible = false;
                DropDownList1.Visible = false;
                DropDownList2.Visible = false;
                Calendar1.Visible = false;
                //LinkButton3.Visible = false;

                DataSet year = new DataSet();
                year.ReadXml(Server.MapPath("~/Year.xml"));
                DropDownList1.DataTextField = "Number";
                DropDownList1.DataValueField = "Number";
                DropDownList1.DataSource = year;
                DropDownList1.DataBind();

                DataSet month = new DataSet();
                month.ReadXml(Server.MapPath("~/Month.xml"));
                DropDownList2.DataTextField = "Name";
                DropDownList2.DataValueField = "Number";
                DropDownList2.DataSource = month;
                DropDownList2.DataBind();

                //SqlConnection con = new SqlConnection(cs);
                //con.Open();
                //SqlDataAdapter sda = new SqlDataAdapter("select orderid as orderid,sno as sno,ProductID as ProductID,Name as Name,Brand as Brand,Size as Size,Price as Price,quantity as quantity,Orderdate as Orderdate,Payment as Payment, Status as Status,Email as Email from OrderDetails", con);
                //DataSet ds = new DataSet();
                //sda.Fill(ds);
                //GridView1.DataSource = ds;
                //GridView1.DataBind();
                //GridView1.Columns[0].Visible = false;
                //LinkButton3.Visible = false;
                bindingdata();
            }
        }
        private void bindingdata()
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("Select * from OrderDetails", conn);
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    GridView1.Columns[0].Visible = false;
                    //LinkButton3.Visible = false;
                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int year = int.Parse(DropDownList1.SelectedValue);
            int month = int.Parse(DropDownList2.SelectedValue);

            Calendar1.VisibleDate = new DateTime(year, month, 1);
            Calendar1.SelectedDate = new DateTime(year, month, 1);
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int year = int.Parse(DropDownList1.SelectedValue);
            int month = int.Parse(DropDownList2.SelectedValue);

            Calendar1.VisibleDate = new DateTime(year, month, 1);
            Calendar1.SelectedDate = new DateTime(year, month, 1);
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox1.Text = Calendar1.SelectedDate.ToShortDateString();

            LblYear.Visible = false;
            LblMonth.Visible = false;
            DropDownList1.Visible = false;
            DropDownList2.Visible = false;
            Calendar1.Visible = false;
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                Response.Write("<script>alert('Please Select Date')</script>");
            }
            else
            {
                SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
                SqlDataAdapter sda = new SqlDataAdapter("select * from OrderDetails where(Orderdate like '%" + TextBox1.Text + "%') ", conn);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridView1.DataSourceID = null;
                GridView1.DataSource = dt;
                GridView1.DataBind();
                //SqlConnection con = new SqlConnection(cs);
                //con.Open();
                //SqlDataAdapter sda = new SqlDataAdapter("Select * from OrderDetails  where Orderdate='" + TextBox1.Text  + "'   ", con);
                //DataSet ds = new DataSet();
                //sda.Fill(ds, "OrderDetails");
                //if (ds.Tables[0].Rows.Count == 0)
                //{
                //    Response.Write("<script>alert('No Record to Display')</script>");
                //}
                //else
                //{
                //    GridView1.DataSource = ds;
                //    bindingdata();
                //    GridView1.Columns[0].Visible = true;
                //    //LinkButton3.Visible = true;

                //    TextBox1.Text = "";
                //}
            }
        }

        //protected void LinkButton3_Click(object sender, EventArgs e)
        //{
        //    foreach (GridViewRow row in GridView1.Rows)
        //    {
        //        string orderid = row.Cells[1].Text;
               
        //        DropDownList ddl1 = (row.Cells[0].FindControl("DDLStatus") as DropDownList);
        //        string status;
               
        //        status = ddl1.SelectedValue;
              
        //        SqlConnection con = new SqlConnection(cs);
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand("Update OrderDetails set Status=@Status where orderid=@orderid ", con);
        //        cmd.Parameters.AddWithValue("@Status", status);
        //        cmd.Parameters.AddWithValue("@orderid", orderid);
        //        cmd.ExecuteNonQuery();
        //        con.Close();
        //    }
        //    Response.Write("<script>alert('Status Updated Succesfully')</script>");
        //}

        //protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Center;
        //    e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Center;
        //}

        protected void BtnOrderList_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            bindingdata();
            GridView1.Columns[0].Visible = false;
            //LinkButton3.Visible = false;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (Calendar1.Visible)
            {
                LblYear.Visible = false;
                LblMonth.Visible = false;
                DropDownList1.Visible = false;
                DropDownList2.Visible = false;
                Calendar1.Visible = false;
            }
            else
            {
                TextBox1.Visible = true;
                LblYear.Visible = true;
                LblMonth.Visible = true;
                DropDownList1.Visible = true;
                DropDownList2.Visible = true;
                Calendar1.Visible = true;
            }
            //LinkButton3.Visible = false;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            bindingdata();
            //SqlDataAdapter sda = new SqlDataAdapter("select orderid as orderid,sno as sno,ProductID as ProductID,Name as Name,Brand as Brand,Size as Size,Price as Price,quantity as quantity,Orderdate as Orderdate,Payment as Payment, Status as Status,Email as Email from OrderDetails", con);
            //DataSet ds = new DataSet();
            //sda.Fill(ds);
            //GridView1.DataSource = ds;
            //GridView1.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            GridViewRow row = (sender as Button).NamingContainer as GridViewRow;
            int id = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value.ToString());
            string sID = id.ToString();
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select orderid,sno,ProductID,Name,Brand,Size,Price,quantity,Orderdate,Payment,Email from OrderDetails where ID=" + sID + " ", con))

                {
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {

                        sdr.Read();
                        string orderid = sdr["orderid"].ToString();
                        string sno = sdr["sno"].ToString();
                        string ProductID = sdr["ProductID"].ToString();
                        string Name = sdr["Name"].ToString();
                        string Brand = sdr["Brand"].ToString();
                        string Size = sdr["Size"].ToString();
                        string Price = sdr["Price"].ToString();
                        string quantity = sdr["quantity"].ToString();
                        string Orderdate = sdr["Orderdate"].ToString();
                        string Payment = sdr["Payment"].ToString();
                       
                        string Email = sdr["Email"].ToString();

                        Response.Redirect("UpdateOrders.aspx?ID=" + sID + "&orderid=" + orderid + "&sno=" + sno + "&ProductID=" + ProductID + "&Name=" + Name + "&Brand=" + Brand + "&Size=" + Size + "&Price=" + Price + "&quantity=" + quantity + "&Orderdate=" + Orderdate + "&Payment=" + Payment + "&Email=" + Email);


                    }
                    con.Close();

                }
            }
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            LblTotalOrders.Text = "Total Orders: " + (GridView1.DataSource as DataTable).Rows.Count;
        }
    }
}



 