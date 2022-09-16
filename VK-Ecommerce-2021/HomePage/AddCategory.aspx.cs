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
    public partial class AddCategory : System.Web.UI.Page
    {
        string cs = @"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Showgrid();
            }
        }

        protected void BtnBack2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProduct.aspx");
        }

        protected void BtnAddCategory_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("select * from Category where CategoryName= '" + TextBox1.Text.ToString() + "' ", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if(dt.Rows.Count == 1)
            {
                MsgBox(" This Category is Already Present ", this.Page, this);
                TextBox1.Text = "";
            }
            else
            {
                SqlConnection con1 = new SqlConnection(cs);
                con1.Open();
                SqlCommand cmd = new SqlCommand("insert into Category values (@Cname)",con1);
                cmd.Parameters.AddWithValue("@Cname", TextBox1.Text);
                cmd.ExecuteNonQuery();
                TextBox1.Text = "";
                MsgBox(" Category Added ", this.Page, this);
                Showgrid();

            }
        }
        public void Showgrid()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("select * from Category", con);

            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Showgrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            Showgrid();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int cID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from Category where  ID=@1", con);
            cmd.Parameters.AddWithValue("@1", cID);
            cmd.ExecuteNonQuery();
            MsgBox(" Category Deleted ", this.Page, this);
            con.Close();
            Showgrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int cID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string categoryname = (row.FindControl("TextBox2") as TextBox).Text;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("update Category set CategoryName=@1 where ID=@2", con);
            cmd.Parameters.AddWithValue("@1", categoryname);
            cmd.Parameters.AddWithValue("@2", cID);
            cmd.ExecuteNonQuery();
            con.Close();
            MsgBox(" Category Updated ", this.Page, this);
            GridView1.EditIndex = -1;
            Showgrid();

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            Showgrid();
        }
    }
}