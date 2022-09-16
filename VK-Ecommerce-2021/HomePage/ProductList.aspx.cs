using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;

namespace VK_Ecommerce.HomePage
{
    public partial class AddBrand : System.Web.UI.Page
    {
        string cs = @"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa";
        
        //SqlConnection con;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] == null)
                {
                    Response.Redirect("HomePage.aspx");
                }
                else
                {
                    ShowProduct();
                }
            }
        }

        public void ShowProduct()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter sda = new SqlDataAdapter("Select * from product", con);

            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProduct.aspx");
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowProduct();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            ShowProduct();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            //Label lbldeleteid = (Label)row.FindControl("LblID");
            //Label lblDeleteImageName = (Label)row.FindControl("lblImageName");
            //con = new SqlConnection(cs);
            //con.Open();
            //SqlCommand cmd = new SqlCommand("delete * FROM product where ID='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
            //cmd.ExecuteNonQuery();
            //con.Close();
            //ImageDeleteFromFolder(lblDeleteImageName.Text);
            //ImageData();
            int sID = int.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());
            string getId = sID.ToString();

            string constr = ConfigurationManager.ConnectionStrings["constrings"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM product WHERE ID = " + getId + "; ", con);
                {
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    ShowProduct();
                    con.Close();
                    Response.Write("<script>alert('Successfully Deleted!')</script>");
                }
            }
            
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
           
            ShowProduct();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            

            //find image id of edit row    
            string ID = GridView1.DataKeys[e.RowIndex].Value.ToString();
            // find values for update    
            TextBox txtPrice = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtPrice");
            TextBox txtQuantity = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtQuantity");
            FileUpload FileUpload1 = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload1");
            
            string constr = ConfigurationManager.ConnectionStrings["constrings"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                
                if (FileUpload1.HasFile)
                {

                    //path += FileUpload1.FileName;
                    ////save image in folder    
                    //FileUpload1.SaveAs(MapPath(path));
                    string filename = FileUpload1.PostedFile.FileName;
                    string filepath = FileUpload1.FileName;
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Uploads/") + filename);
                    SqlCommand cmd = new SqlCommand("update product set Price='" + txtPrice.Text + "',Quantity='" + txtQuantity.Text + "',Image='" + filepath + "'  where ID=" + ID + "", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Successfully Updated!')</script>");
                    GridView1.EditIndex = -1;
                    ShowProduct();
                }
                else
                {
                  con.Open();
                  SqlCommand cmd = new SqlCommand("update product set Price='" + txtPrice.Text + "',Quantity='" + txtQuantity.Text + "'  where ID=" + ID + "", con);
                  cmd.ExecuteNonQuery();
                  con.Close();
                  Response.Write("<script>alert('Successfully Updated!')</script>");
                  GridView1.EditIndex = -1;
                  ShowProduct();
                    
                       
                }
            }
                
            //    if (FileUpload1.HasFile)
            //{
                
            //    //path += FileUpload1.FileName;
            //    ////save image in folder    
            //    //FileUpload1.SaveAs(MapPath(path));
            //    string filename = FileUpload1.PostedFile.FileName;
            //    string filepath = FileUpload1.FileName;
            //    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Uploads/") + filename);
            //    SqlCommand cmd = new SqlCommand("update product set Price='" + txtPrice.Text + "',Quantity='" + txtQuantity.Text + "',Image='" + filepath + "'  where ID=" + ID + "", con);
                    
            //    cmd.ExecuteNonQuery();
            //    con.Close();
            //    Response.Write("<script>alert('Successfully Updated!')</script>");
            //    GridView1.EditIndex = -1;
            //    ShowProduct();
            //}
                //else
                //{
                //    Image img = (Image)GridView1.Rows[e.RowIndex].FindControl("img_user");
                //    path = img.ImageUrl;
                //}



        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Cname = DropDownList1.SelectedValue.ToString();
            if(Cname == "Select Category")
            {
                ShowProduct();
            }
            else
            {
                SqlConnection con = new SqlConnection(cs);
                SqlDataAdapter sda = new SqlDataAdapter("select * from product where Category='" + Cname + "' ", con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
}