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
    public partial class OrderStatus : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
       
        
        SqlConnection conns = new SqlConnection();
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sdas = new SqlDataAdapter();
        DataSet ds1 = new DataSet();
        //string EmailID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Status();
                DataBind();
            }
            if (Session["Username"] != null)
            {
                //conn.ConnectionString = "Data Source=localhost;Database=db_vk_ecommerce;User ID=root;Password=;sslmode=none";
                //conn.Open();
                conns.ConnectionString = @"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa";
                conns.Open();
                showdata();
                //bindingdata();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert",
                "alert('You Must Sign In First to View your Orders');window.location ='HomePage.aspx';",
                true);
            }
        }

        public void showdata()
        {
            comm.CommandText = "SELECT * FROM userdetails WHERE Username='" + Session["Username"] + "'";
            comm.Connection = conns;
            sdas.SelectCommand = comm;
            sdas.Fill(ds1);
            LblUser.Text = ds1.Tables[0].Rows[0]["Username"].ToString();
            LblAddress.Text = ds1.Tables[0].Rows[0]["Home"].ToString();
            LblContact.Text = ds1.Tables[0].Rows[0]["Contact"].ToString();
            
        }

        //private void bindingdata()
        //{
        //    DataTable dt = new DataTable();
        //    using (SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa"))
        //    {
        //        SqlDataAdapter da = new SqlDataAdapter("Select * from OrderDetails", con);
        //        da.Fill(dt);
        //        if (dt.Rows.Count > 0)
        //        {
        //            GridView1.DataSource = dt;
        //            GridView1.DataBind();
        //        }
        //    }
        //}

        public void Status()
        {
            if (Session["Username"] != null)
            {
                
                string EmailID = Session["Username"].ToString();
                SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
                SqlDataAdapter sda = new SqlDataAdapter("select * from  OrderDetails  where Email = '" + EmailID + "' ", con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string status = dt.Rows[i][11].ToString();
                    if (status == "Pending")
                    {
                        dt.Rows[i][11] = "Preparing";
                    }
                    else if (status == "Delivering")
                    {
                        dt.Rows[i][11] = "Delivering";
                    }
                    else
                    {
                        dt.Rows[i][11] = "Delivered";
                       
                        
                    }
                    status = "";
                }

                GridView1.DataSource = dt;
                GridView1.DataBind();

            }

           
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells[12].Text == "Preparing")
                {
                    e.Row.Cells[12].ForeColor = System.Drawing.Color.White;
                    e.Row.Cells[12].BackColor = System.Drawing.Color.Gray;
                }
                else if (e.Row.Cells[12].Text == "Delivering")
                {
                    e.Row.Cells[12].ForeColor = System.Drawing.Color.White;
                    e.Row.Cells[12].BackColor = System.Drawing.Color.Crimson;
                    e.Row.Cells[0].Enabled = false;
                    e.Row.Cells[0].Text = "Out for Delivery";
                }
                else 
                {
                    e.Row.Cells[12].ForeColor = System.Drawing.Color.White;
                    e.Row.Cells[12].BackColor = System.Drawing.Color.Green;
                    e.Row.Cells[0].Enabled = false;
                    e.Row.Cells[0].Text = "Completed";
                }
            }
            e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Center;
            e.Row.Cells[3].Visible = false;
        }


        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int sID = int.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());
            string getId = sID.ToString();
            



            SqlConnection constr = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
            constr.Open();
            SqlCommand cmd = new SqlCommand("Delete  from OrderDetails where ID='" + getId + "' ", constr);
            cmd.ExecuteNonQuery();
            constr.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert",
                    "alert('Order Successfully Cancel');window.location ='OrderStatus.aspx';",
                    true);
        }
    }
}