using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace VK_Ecommerce.HomePage
{
    public partial class MyMessages : System.Web.UI.Page
    {
        SqlConnection constr = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
        SqlConnection conns = new SqlConnection();
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sdas = new SqlDataAdapter();
        DataSet ds1 = new DataSet();
        string cs = @"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa";
        protected void Page_Load(object sender, EventArgs e)
        {
            
            bindingdata();
        }

        private void bindingdata()
        {
            if (Session["Username"] != null)
            {
                string UserID = Session["Username"].ToString();
                DataTable dt = new DataTable();
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    SqlDataAdapter da = new SqlDataAdapter("Select * from Messages where Username= '" + UserID + "' ", conn);
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }

       

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int sID = int.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());
            string getId = sID.ToString();


            SqlConnection constr = new SqlConnection(@"Data Source=DESKTOP-DQT5U75\SQLEXPRESS;Initial Catalog=VkEcommerce;Persist Security Info=True;User ID=virnil;Password=sa");
            constr.Open();
            SqlCommand cmd = new SqlCommand("Delete  from Messages where ID='" + getId + "' ", constr);
            cmd.ExecuteNonQuery();
            constr.Close();
            Response.Redirect("MyMessages.aspx");
        }

        public void ClearMessage()
        {
            constr.Open();
            SqlCommand cmd = new SqlCommand("Delete from Messages where Username='" + Session["Username"] + "' ", constr);
            cmd.ExecuteNonQuery();
            constr.Close();
            Response.Redirect("MyMessages.aspx");
        }

        protected void BtnDeleteMessage_Click(object sender, EventArgs e)
        {
            ClearMessage();
        }
    }
}