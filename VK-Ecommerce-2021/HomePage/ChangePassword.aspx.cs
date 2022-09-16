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
    public partial class ChangePassword : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection();
        SqlCommand com = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();


        string strConnString = ConfigurationManager.ConnectionStrings["constrings"].ConnectionString;
        string str = null;
        string str2 = null;
        
        SqlCommand cmd;
        SqlCommand cmd2;
       
        byte up;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("ValidateEmail.aspx");

            }
            else
            {
                conn.ConnectionString = @"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa";
                conn.Open();
                showdata();
            }
        }

        public void showdata()
        {
            com.CommandText = "SELECT * FROM userdetails WHERE Email='" + Session["Email"] + "'";
            com.Connection = conn;
            sda.SelectCommand = com;
            sda.Fill(ds);
            lblUser.Text = ds.Tables[0].Rows[0]["Email"].ToString();

        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
            str = "select * from users ";
            str2 = "select * from userdetails ";
           
            cmd = new SqlCommand(str, con);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (lblUser.Text == reader["Email"].ToString())
                {
                    up = 1;
                }
            }
            reader.Close();
            con.Close();
            if (up == 1)
            {
                con.Open();
                str = "update users set Password=@Password where Email='" + Session["Email"].ToString() + "'";
                str2 = "update userdetails set Password=@Password where Email='" + Session["Email"].ToString() + "'";
               
                cmd = new SqlCommand(str, con);
                cmd2 = new SqlCommand(str2, con);
               

                cmd.Parameters.Add(new SqlParameter("@Password", SqlDbType.VarChar, 200));
                cmd.Parameters["@Password"].Value = txtPass.Text;
                cmd.ExecuteNonQuery();

                cmd2.Parameters.Add(new SqlParameter("@Password", SqlDbType.VarChar, 200));
                cmd2.Parameters["@Password"].Value = txtPass.Text;
                cmd2.ExecuteNonQuery();

                //cmd3.Parameters.Add(new MySqlParameter("@Pass", MySqlDbType.VarChar, 50));
                //cmd3.Parameters["@Pass"].Value = txtNewPass.Text;
                //cmd3.ExecuteNonQuery();

                //cmd4.Parameters.Add(new MySqlParameter("@Pass", MySqlDbType.VarChar, 50));
                //cmd4.Parameters["@Pass"].Value = txtNewPass.Text;
                //cmd4.ExecuteNonQuery();

                con.Close();
                //lbl_msg.Text = "Password changed Successfully";
                //Response.Redirect("HomePage.aspx");
               ScriptManager.RegisterStartupScript(this, this.GetType(),
               "alert",
               "alert('Password changed Successfully');window.location ='HomePage.aspx';",
               true);
                Session.RemoveAll();
                Session.Abandon();
               
            }
            else
            {
                lbl_msg.Text = "Password Mismatch!!!";
            }
            cleartxt();
        }

        public void cleartxt()
        {
            txtPass.Text = "";
            txtConfirm.Text = "";
        }

        protected void SignOut_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("HomePage.aspx");
        }
    }
}