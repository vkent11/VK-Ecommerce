using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;
namespace VK_Ecommerce.HomePage
{
    public partial class AddProduct : System.Web.UI.Page
    {

       SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void AddBrand_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddBrand.aspx");
        }

        
        protected void ProductList_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductList.aspx");
        }

        protected void BtnAddProduct_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
            if (FileUpload.HasFile)
            {
                string filename = FileUpload.PostedFile.FileName;
                string filepath = FileUpload.FileName;
                FileUpload.PostedFile.SaveAs(Server.MapPath("~/Uploads/") + filename);
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into product (Productid,Name,Price,Detail,Material,Quantity,Brand,Category,Sub,Image)  values ('" + txtID.Text + "','" + txtName.Text + "','" + txtPrice.Text + "','" + txtDetails.Text + "','" + txtMaterials.Text + "','" + txtQuantity.Text + "','" + DdlBrand.SelectedValue + "','" + DdlCategory.SelectedValue + "','" + DdlSub.SelectedValue + "','" + filepath + "')", con);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Successfully Added!')</script>");
                cleartxt();
                con.Close();
            }



            //string path;
            //if (FileUpload.HasFile)
            //    FileUpload.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "Uploads/" + FileUpload.FileName);
            //path = FileUpload.FileName;



            //SqlCommand cmd = new SqlCommand("insert into product (Productid,Name,Price,Size,Detail,Material,Brand,Category,Sub,Image) values ('" + txtID.Text + "','" + txtName.Text + "','" + txtPrice.Text + "','" + txtSize.Text + "','" + txtDetails.Text + "','" + txtMaterials.Text + "','" + DdlBrand.SelectedValue + "','" + DdlCategory.SelectedValue + "','" + DdlSub.SelectedValue + "','" + path + "')", con);
            //con.Open();
            //cmd.ExecuteNonQuery();
            //cleartxt();
            //con.Close();
            //Response.Write("<script>alert('Successfully Added!')</script>");

            //}



        }
        public void cleartxt()
        {
            txtID.Text = "";
            txtName.Text = "";
            txtPrice.Text = "";
            txtDetails.Text = "";
            txtMaterials.Text = "";
            

        }

       
    }
}

