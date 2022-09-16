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

    public partial class Messages : System.Web.UI.Page
    {
        string cs = @"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindingdata();
            }
        }

        private void bindingdata()
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("Select * from Messages", conn);
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }

        protected void BtnReply_Click(object sender, EventArgs e)
        {
            GridViewRow row = (sender as Button).NamingContainer as GridViewRow;
            int id = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value.ToString());
            string sID = id.ToString();
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select Firstname,Lastname,Email,Phone,Username from Messages where ID=" + sID + " ", con))

                {
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {

                        sdr.Read();
                        string Firstname = sdr["Firstname"].ToString();
                        string Lastname = sdr["Lastname"].ToString();
                        string Email = sdr["Email"].ToString();
                        string Phone = sdr["Phone"].ToString();
                        string Username = sdr["Username"].ToString();
                       

                        Response.Redirect("ReplyMessage.aspx?ID=" + sID + "&Firstname=" + Firstname + "&Lastname=" + Lastname + "&Email=" + Email + "&Phone=" + Phone + "&Username=" + Username);


                    }
                    con.Close();

                }
            }
        }
    }
}