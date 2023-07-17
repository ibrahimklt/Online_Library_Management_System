using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fınal_OLMS
{
    public partial class userlogin : System.Web.UI.Page
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
                if(con.State == System.Data.ConnectionState.Closed) {con.Open();}

                SqlCommand cmd = new SqlCommand("select* from member_master_tbl where member_id = '" +TextBox1.Text.Trim() +"' AND password = '"+ TextBox2.Text.Trim() +"' ;", con); 
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)  //sadece 2 textbox içi doğru olduğunda çalışır
                {
                    while (dr.Read()) 
                    {
                        Response.Write("<script>alert('" + "Hoşgeldin " + dr.GetValue(0).ToString() +"');</script>");

                        Session["username"] = dr.GetValue(8).ToString();
                        Session["fullname"] = dr.GetValue(0).ToString();
                        Session["role"] = "user";
                        Session["status"] = dr.GetValue(10).ToString();

                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                        "swal('Giriş Başarılı.', 'Sayfaya Yönlendiriliyorsunuz' ,'success')", true);
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
                
            }


            
        }
    }
}