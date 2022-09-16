using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
namespace VK_Ecommerce.Registration
{
    public partial class Register : System.Web.UI.Page
    {
        //Register
        SqlConnection conn;
        //SqlCommand cmd;
        //string str;
        SqlCommand cmd2;
        string str2;
        
        //string css = ConfigurationManager.ConnectionStrings["constrings"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Register
            //conn = new MySqlConnection("Data Source=localhost;Database=db_vk_ecommerce;User ID=root;Password=;sslmode=none");
            //conn.Open();
            conn = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
            conn.Open();

        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {

            //str = "insert into userdetails(Fullname,Username,Password,Contact,Home,Email,Gender) values ('" + txtFullname.Text + "','" + txtUsername.Text + "','" + txtPassword.Text + "','" + txtContact.Text + "','" + txtAddress.Text + "','" + txtEmail.Text + "','" + gender.SelectedValue + "')";
            //cmd = new SqlCommand(str, conn);
            //cmd.ExecuteNonQuery();


            string ImageUser = Image1.ImageUrl.ToString();

            //SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
            if (FileUpload.HasFile)
            {
                string filename = FileUpload.PostedFile.FileName;
                string filepath = FileUpload.FileName;
                FileUpload.PostedFile.SaveAs(Server.MapPath("~/Uploads/") + filename);
                //conn.Open();
                SqlCommand cmd3 = new SqlCommand("insert into userdetails (Fullname,Username,Password,Contact,Home,Email,Gender,Image)  values ('" + txtFullname.Text + "','" + txtUsername.Text + "','" + txtPassword.Text + "','" + txtContact.Text + "','" + txtAddress.Text + "','" + txtEmail.Text + "','" + gender.SelectedValue + "','" + filepath + "')", conn);
                cmd3.ExecuteNonQuery();
                str2 = "insert into users(Username, Password, Utype, Fullname,Email) values ('" + txtUsername.Text + "','" + txtPassword.Text + "','" + Usertype.SelectedValue + "','" + txtFullname.Text + "','" + txtEmail.Text + "')";
                cmd2 = new SqlCommand(str2, conn);
                cmd2.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Successfully Added!')</script>");
                cleartxt();
            }
            else
            {
                SqlCommand cmd3 = new SqlCommand("insert into userdetails (Fullname,Username,Password,Contact,Home,Email,Gender,Image)  values ('" + txtFullname.Text + "','" + txtUsername.Text + "','" + txtPassword.Text + "','" + txtContact.Text + "','" + txtAddress.Text + "','" + txtEmail.Text + "','" + gender.SelectedValue + "','" + ImageUser + "')", conn);
                cmd3.ExecuteNonQuery();
                str2 = "insert into users(Username, Password, Utype, Fullname,Email) values ('" + txtUsername.Text + "','" + txtPassword.Text + "','" + Usertype.SelectedValue + "','" + txtFullname.Text + "','" + txtEmail.Text + "')";
                cmd2 = new SqlCommand(str2, conn);
                cmd2.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Successfully Added!')</script>");
                cleartxt();
            }
           
        }

        public void cleartxt()
        {
            txtFullname.Text = "";
            txtUsername.Text = "";
            txtEmail.Text = "";
            txtAddress.Text = "";
            txtPassword.Text = "";
            txtContact.Text = "";
            gender.SelectedValue = "";
            Usertype.SelectedValue = "";

        }
    }
}

//Check If Username/ Email exist
//protected void Button1_Click(object sender, EventArgs e)
//{
//    if (!string.IsNullOrEmpty(txt_username.Text))
//    {
//        if (CheckUsername(txt_username.Text.Trim()))
//            lblStatus.Text = "user name already exists please try another name";
//        else
//            lblStatus.Text = "UserName Available";
//    }
//}

//public bool CheckUsername(string user_txt)
//{
//    using (SqlConnection con = new SqlConnection())
//    {
//        con.ConnectionString = "your connection string";
//        con.Open();
//        using (SqlCommand cmd = new SqlCommand("select * from xyz where UserName = @UserID", con))
//        {
//            SqlParameter param = new SqlParameter();
//            param.ParameterName = "@UserID";
//            param.Value = user_txt;
//            cmd.Parameters.Add(param);
//            SqlDataReader reader = cmd.ExecuteReader();
//            if (reader.HasRows)
//                return true;
//            else
//                return false;
//        }
//    }
//}