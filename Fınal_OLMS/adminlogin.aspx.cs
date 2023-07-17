using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fınal_OLMS
{
    public partial class adminlogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed) { con.Open(); }

                SqlCommand cmd = new SqlCommand("select* from admin_login_tbl where username = '" + TextBox1.Text.Trim() + "' AND password = '" + TextBox2.Text.Trim() + "' ;", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)  //sadece 2 textbox içi doğru olduğunda çalışır
                {
                    while (dr.Read())
                    {
                        //Response.Write("<script>alert('" + "Hoşgeldin " + dr.GetValue(2).ToString() + "');</script>");

                        Session["username"] = dr.GetValue(0).ToString();
                        Session["fullname"] = dr.GetValue(2).ToString();
                        Session["role"] = "admin";
                        //Session["status"] = dr.GetValue(10).ToString();

                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                        "swal('Giriş Başarılı.', 'Hoşgeldin Admin "+ dr.GetValue(2).ToString()+"', 'success')", true);
                    }
                    Response.Redirect("homepage.aspx");
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Giriş Bilgileri Hatalı', 'Şifreniz veya Kullanıcı adınız yanlış olabilir', 'warning')", true);
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}