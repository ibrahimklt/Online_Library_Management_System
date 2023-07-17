using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fınal_OLMS
{
    public partial class adminauthormanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind(); //veri kaynağına tekrar bağlar ve taze veriyi almamızı sağlar bu sayede tablo hep güncellenecek
        }

        //ekle butonu click
        
        protected void Button2_Click(object sender, EventArgs e)
        {
            
            if (checkIfAuthorExists())
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Bu admin kimliğine sahip admin Zaten Var!', 'başka bir kimlik eklemeyi deneyin' ,'warning')", true);
            }
            else
            {
                addNewAuthor();
            }
        }

        //güncelle butonu click
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                updateAuthor();
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Yazar Kimliği Bulunamadı', 'başka bir kimlik deneyin' ,'warning')", true);
            }
        }

        //sil butonu click
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                deleteAuthor();
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Yazar Kimliği Bulunamadı', 'başka bir kimlik deneyin' ,'warning')", true);
            }
        }

        //git butonu click
        protected void Button1_Click(object sender, EventArgs e)
        {
            getAuthorByID();
        }
        


        //kullanıcı tanımlama fonksiyonları

        void getAuthorByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from author_master_tbl where author_id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    //Response.Write("<script>alert('Invalid Author ID');</script>");

                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                     "swal('Geçersiz Yazar Kimliği', 'başka bir kimlik deneyin' ,'warning')", true);
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        void deleteAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed) { con.Open(); }  //DB bağlantı açık değilse bağlantıyı açıyor

                SqlCommand cmd = new SqlCommand("DELETE from author_master_tbl WHERE author_id='" + TextBox1.Text.Trim() + "'", con);


                cmd.ExecuteNonQuery();  /*katalog işlemlerini gerçekleştirmek yada UPDATE, INSERT veya DELETE deyimlerini yürüterek veritabanındaki verileri kullanmadan DataSet değiştirmek için kullanılır*/
                /*sorgusuz çalıştır*/
                con.Close();  /*bağlantıyı kesiyoruz çünkü birden çok işlem yapar*/
                //Response.Write("<script>alert('Yazar Kayıtı başarılı.');</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Yazar Başarıyla Silindi','Devam etmek için butona tıklayınız', 'success')", true);
                clearForm();
                GridView1.DataBind(); //veri kaynağına tekrar bağlar ve taze veriyi almamızı sağlar bu sayede tablo hep güncellenecek
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed) { con.Open(); }  //DB bağlantı açık değilse bağlantıyı açıyor

                SqlCommand cmd = new SqlCommand("UPDATE author_master_tbl SET author_name=@author_name WHERE author_id='" + TextBox1.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@author_name", TextBox2.Text.Trim());  //parametreleri ayrı ayrı ekledik


                cmd.ExecuteNonQuery();  /*katalog işlemlerini gerçekleştirmek yada UPDATE, INSERT veya DELETE deyimlerini yürüterek veritabanındaki verileri kullanmadan DataSet değiştirmek için kullanılır*/
                /*sorgusuz çalıştır*/
                con.Close();  /*bağlantıyı kesiyoruz çünkü birden çok işlem yapar*/
                //Response.Write("<script>alert('Yazar Kayıtı başarılı.');</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Yazar Güncellemesi başarılı.','Devam etmek için butona tıklayınız', 'success')", true);
                clearForm();
                GridView1.DataBind(); //veri kaynağına tekrar bağlar ve taze veriyi almamızı sağlar bu sayede tablo hep güncellenecek
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void addNewAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed) { con.Open(); }  //DB bağlantı açık değilse bağlantıyı açıyor

                SqlCommand cmd = new SqlCommand("INSERT INTO author_master_tbl (author_id,author_name) values(@author_id,@author_name)", con);

                cmd.Parameters.AddWithValue("@author_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@author_name", TextBox2.Text.Trim());  //parametreleri ayrı ayrı ekledik


                cmd.ExecuteNonQuery();  /*katalog işlemlerini gerçekleştirmek yada UPDATE, INSERT veya DELETE deyimlerini yürüterek veritabanındaki verileri kullanmadan DataSet değiştirmek için kullanılır*/
                                        /*sorgusuz çalıştır*/
                con.Close();  /*bağlantıyı kesiyoruz çünkü birden çok işlem yapar*/
                //Response.Write("<script>alert('Yazar Kayıtı başarılı.');</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Yazar Kayıtı başarılı.','Butona tıklayınız', 'success')", true);
                clearForm();
                GridView1.DataBind(); //veri kaynağına tekrar bağlar ve taze veriyi almamızı sağlar bu sayede tablo hep güncellenecek
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkIfAuthorExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed) { con.Open(); }


                SqlCommand cmd = new SqlCommand("SELECT * from author_master_tbl where author_id='" + TextBox1.Text.Trim() + "';", con);
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

        void clearForm()
        {
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
        }
    }
}