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
    public partial class UpdateUser : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection();
        SqlCommand com = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();
        //string cs = @"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBox1.Text = Request.QueryString["Fullname"];
                TextBox7.Text = Request.QueryString["Username"];
                TextBox2.Text = Request.QueryString["Password"];
                TextBox3.Text = Request.QueryString["Contact"];
                TextBox4.Text = Request.QueryString["Home"];
                TextBox5.Text = Request.QueryString["Email"];
                TextBox6.Text = Request.QueryString["Gender"];
               
            }
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {

            //find image id of edit row    
            //string ID = GridView1.DataKeys[e.RowIndex].Value.ToString();
            // find values for update    
            string Fullname = TextBox1.Text;
            string Username = TextBox7.Text;
            string Password = TextBox2.Text;
            string Contact = TextBox3.Text;
            string Home = TextBox4.Text;
            string Email = TextBox5.Text;
            string Gender = TextBox6.Text;
            string ImageUser = Image1.ImageUrl.ToString();


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
                    SqlCommand cmd = new SqlCommand("update userdetails set Fullname=@Fullname,Password=@Password,Contact=@Contact,Home=@Home,Email=@Email,Gender=@Gender,Image=@Image  where Username=@Username ", con);
                    cmd.Parameters.AddWithValue("@Fullname", Fullname);   
                    cmd.Parameters.AddWithValue("@Password", Password);
                    cmd.Parameters.AddWithValue("@Contact", Contact);
                    cmd.Parameters.AddWithValue("@Home", Home);
                    cmd.Parameters.AddWithValue("@Email", Email);
                    cmd.Parameters.AddWithValue("@Gender", Gender);
                    cmd.Parameters.AddWithValue("@Image", filepath);
                    cmd.Parameters.AddWithValue("@Username", Username);

                    SqlCommand cmd2 = new SqlCommand("update users set Fullname=@Fullname,Password=@Password,Email=@Email  where Username=@Username ", con);
                    cmd2.Parameters.AddWithValue("@Fullname", Fullname);
                    cmd2.Parameters.AddWithValue("@Password", Password);
                    cmd2.Parameters.AddWithValue("@Email", Email);
                    cmd2.Parameters.AddWithValue("@Username", Username);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    cmd2.ExecuteNonQuery();
                    con.Close();
                    //Response.Write("<script>alert('Successfully Updated!')</script>");
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                   "alert",
                   "alert('Successfully Updated!');window.location ='ViewUser.aspx';",
                   true);
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("update userdetails set Fullname=@Fullname,Password=@Password,Contact=@Contact,Home=@Home,Email=@Email,Gender=@Gender,Image=@Image  where Username=@Username ", con);
                    cmd.Parameters.AddWithValue("@Fullname", Fullname);
                    cmd.Parameters.AddWithValue("@Password", Password);
                    cmd.Parameters.AddWithValue("@Contact", Contact);
                    cmd.Parameters.AddWithValue("@Home", Home);
                    cmd.Parameters.AddWithValue("@Email", Email);
                    cmd.Parameters.AddWithValue("@Gender", Gender);
                    cmd.Parameters.AddWithValue("@Image", ImageUser);
                    cmd.Parameters.AddWithValue("@Username", Username);

                    SqlCommand cmd2 = new SqlCommand("update users set Fullname=@Fullname,Password=@Password,Email=@Email  where Username=@Username ", con);
                    cmd2.Parameters.AddWithValue("@Fullname", Fullname);
                    cmd2.Parameters.AddWithValue("@Password", Password);
                    cmd2.Parameters.AddWithValue("@Email", Email);
                    cmd2.Parameters.AddWithValue("@Username", Username);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    cmd2.ExecuteNonQuery();
                    con.Close();
                    //Response.Write("<script>alert('Successfully Updated!')</script>");

                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                   "alert",
                   "alert('Successfully Updated!');window.location ='ViewUser.aspx';",
                   true);

                }

            }
        }
        
    }
}