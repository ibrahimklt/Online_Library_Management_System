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
    public partial class adminmembermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //Git butonu
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            getmemberById();
        }

        //Aktif butonu
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            updateMemberStatusById("Active");
        }

        //beklemede butonu
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            updateMemberStatusById("Pending");
        }

        //deaktif butonu
        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            updateMemberStatusById("deActive");
        }

        //Kullanıcıyı sil butonu
        protected void Button2_Click(object sender, EventArgs e)
        {
            deleteMemberById();
        }


        //kullanıcı tanımlama fonksiyonları

        void getmemberById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed) { con.Open(); }

                SqlCommand cmd = new SqlCommand("select * from member_master_tbl where member_id = '" + TextBox1.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)  
                {
                    while (dr.Read())
                    {
                        TextBox2.Text= dr.GetValue(0).ToString(); //ad soyad
                        TextBox7.Text = dr.GetValue(10).ToString(); //hesap durumu

                        TextBox8.Text = dr.GetValue(1).ToString(); //doğum tarihi 
                        TextBox3.Text = dr.GetValue(2).ToString(); //iletişim numarası
                        TextBox4.Text = dr.GetValue(3).ToString(); //email

                        TextBox5.Text = dr.GetValue(4).ToString(); //il 
                        TextBox6.Text = dr.GetValue(5).ToString(); //ilçe
                        TextBox9.Text = dr.GetValue(6).ToString(); //posta kodu

                        TextBox10.Text = dr.GetValue(7).ToString(); //tam adres


                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                        "swal('Üye Başarıyla Bulundu', 'İsim " + dr.GetValue(0).ToString() + "', 'success')", true);
                    }
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Üye Bulunamadı ', 'Tekrar deneyiniz', 'warning')", true);
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        void updateMemberStatusById(String status)
        {
            if (checkIfMemberExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == System.Data.ConnectionState.Closed) { con.Open(); }

                    SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET account_status='" + status + "' WHERE member_id = '" + TextBox1.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();

                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Üye Durumu Güncellemesi Gerçekleşti', 'Devam etmek için butona tıklayınız', 'info')", true);
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                   "swal('Üye Id Geçersiz','Lütfen Tekrar Deneyiniz', 'warning')", true);
            }
        }


        void deleteMemberById()
        {
            if(checkIfMemberExists()) 
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == System.Data.ConnectionState.Closed) { con.Open(); }  //DB bağlantı açık değilse bağlantıyı açıyor

                    SqlCommand cmd = new SqlCommand("DELETE from member_master_tbl WHERE member_id='" + TextBox1.Text.Trim() + "'", con);


                    cmd.ExecuteNonQuery();  /*katalog işlemlerini gerçekleştirmek yada UPDATE, INSERT veya DELETE deyimlerini yürüterek veritabanındaki verileri kullanmadan DataSet değiştirmek için kullanılır*/
                    /*sorgusuz çalıştır*/
                    con.Close();  /*bağlantıyı kesiyoruz çünkü birden çok işlem yapar*/
                    //Response.Write("<script>alert('Yazar Kayıtı başarılı.');</script>");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                        "swal('Seçili Üye Silindi','Devam etmek için butona tıklayınız', 'warning')", true);
                    clearForm();
                    GridView1.DataBind(); //veri kaynağına tekrar bağlar ve taze veriyi almamızı sağlar bu sayede tablo hep güncellenecek
                }

                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else 
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                   "swal('Üye Id Geçersiz','Lütfen Tekrar Deneyiniz', 'warning')", true);  
            }
        }

        void clearForm()
        {
            TextBox2.Text = string.Empty; //ad soyad
            TextBox7.Text = string.Empty; //hesap durumu

            TextBox8.Text = string.Empty; //doğum tarihi 
            TextBox3.Text = string.Empty; //iletişim numarası
            TextBox4.Text = string.Empty; //email

            TextBox5.Text = string.Empty; //il 
            TextBox6.Text = string.Empty; //ilçe
            TextBox9.Text = string.Empty; //posta kodu

            TextBox10.Text = string.Empty; //tam adres
        }

        bool checkIfMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed) { con.Open(); }


                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);  //temelde tabloyu veritabınından dt nesnesine uyarlıyor, buda tablo gibidir
                DataTable dt = new DataTable();
                da.Fill(dt);  //karşılık gelen satıra dolduruyor


                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

    }
}