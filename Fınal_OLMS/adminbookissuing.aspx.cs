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
    public partial class adminbookissuing : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //Git butonu
        protected void Button1_Click(object sender, EventArgs e)
        {
            getNames();
        }

        //Basım butonu
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkIfMemberExist() && checkIfBookExist())
            {

                if (checkIfIssueEntryExist())
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Üye Zaten Bu Kitap'a Sahip!', 'Başka Kitap Seçiniz', 'warning')", true);
                }
                else
                {
                    issueBook();
                }
                
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                "swal('Yanlış Kitap ID veya Üye ID!', 'Tekrar Deneyiniz', 'warning')", true);
            }

        }

        //İade butonu
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkIfMemberExist() && checkIfBookExist())
            {

                if (checkIfIssueEntryExist())
                {
                    returnBook();
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('bu giriş mevcut değil!', 'Tekrar Deneyiniz', 'warning')", true);
                }

            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                "swal('Yanlış Kitap ID veya Üye ID!', 'Tekrar Deneyiniz', 'warning')", true);
            }
        }






        //Kullanıcı tanımlama fonksiyonları

        void returnBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("Delete from book_issue_tbl WHERE book_id='" + TextBox1.Text.Trim() + "' AND member_id='" + TextBox2.Text.Trim() + "'", con);
                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {

                    cmd = new SqlCommand("update book_master_tbl set current_stock = current_stock+1 WHERE book_id='" + TextBox1.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Kitap Başarıyla İade Edildi', 'Devam etmek için tıklayınız', 'success')", true);
                    GridView1.DataBind();

                    con.Close();

                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Hata - Geçersiz ayrıntılar!', 'Tekrar Deneyiniz', 'warning')", true);
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void issueBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed) { con.Open(); }  //DB bağlantı açık değilse bağlantıyı açıyor

                SqlCommand cmd = new SqlCommand("INSERT INTO book_issue_tbl (member_id,member_name,book_id,book_name,issue_date,due_date) values(@member_id,@member_name,@book_id,@book_name,@issue_date,@due_date)", con);

                cmd.Parameters.AddWithValue("@member_id", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@member_name", TextBox3.Text.Trim());  //parametreleri ayrı ayrı ekledik
                cmd.Parameters.AddWithValue("@book_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@issue_date", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@due_date", TextBox6.Text.Trim());

                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("update book_master_tbl set current_stock = current_stock-1 WHERE book_id='" + TextBox1.Text.Trim() + "'", con);
                cmd.ExecuteNonQuery();


                con.Close();  
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                "swal('Yazar Kayıtı başarılı.','Butona tıklayınız', 'success')", true);
                GridView1.DataBind(); 
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        bool checkIfBookExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("select * from book_master_table WHERE book_id='" + TextBox1.Text.Trim() + "' AND current_stock >0'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

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
                return false;
            }
        }


        bool checkIfMemberExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("select full_name from member_master_table WHERE member_id='" + TextBox2.Text.Trim() + " '", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

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
                return false;
            }
        }


        bool checkIfIssueEntryExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("select full_name from member_master_table WHERE member_id='" + TextBox2.Text.Trim() + "' AND book_id='" + TextBox1.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

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
                return false;
            }
        }



        void getNames()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed) 
                { 
                    con.Open();
                }

                
                SqlCommand cmd = new SqlCommand("select book_name from book_master_table WHERE book_id='" + TextBox1.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if(dt.Rows.Count >= 1) 
                {
                    TextBox4.Text = dt.Rows[0]["book_name"].ToString();
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Yanlış Kitap ID', 'Tekrar Deneyiniz', 'warning')", true);
                }


                cmd = new SqlCommand("select full_name from member_master_tbl WHERE member_id='" + TextBox6.Text.Trim() + "'", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count >= 1)
                {
                    TextBox3.Text = dt.Rows[0]["full_name"].ToString();
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Yanlış Üye ID', 'Tekrar Deneyiniz', 'warning')", true);
                }


            }
            catch (Exception ex)
            { 
            
            }
        
        }


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    //Check your condition here
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


    }
}