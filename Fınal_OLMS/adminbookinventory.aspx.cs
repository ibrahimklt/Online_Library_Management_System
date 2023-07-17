using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fınal_OLMS
{
    public partial class adminbookinventory : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillAuthorPublisherValues();
            }

            GridView1.DataBind();
        }

        // git button 
        protected void Button4_Click(object sender, EventArgs e)
        {
            getBookByID();
        }


        // Güncelle button
        protected void Button3_Click(object sender, EventArgs e)
        {
            updateBookByID();
        }
        // sil button 
        protected void Button2_Click(object sender, EventArgs e)
        {
            deleteBookByID();
        }
        // ekle button click
        protected void Button1_Click(object sender, EventArgs e)
        {
            {
            if (checkIfBookExists())
             {
                 //Response.Write("<script>alert('Book Already Exists, try some other Book ID');</script>");
                 ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                 "swal('Kitap Zaten var!', 'Başka Kitap Id deneyiniz' ,'warning')", true);
             }
             else
             {
                 addNewBook();
             }

            
             
            }
        }



        //Kullanıcı Tanımlama Fonksiyonları

        void deleteBookByID()
        {
            if (checkIfBookExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from book_master_tbl WHERE book_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();

                    GridView1.DataBind();
                    con.Close();
                    //Response.Write("<script>alert('Book Deleted Successfully');</script>");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Kitap Silindi', 'Devam etmek için tıkalıyınız' ,'success')", true);


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                //Response.Write("<script>alert('Invalid Member ID');</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                "swal('Girilen Bilgiler Yanlış veya Boş!', 'Tekrar deneyiniz' ,'warning')", true);
            }
        }

        void updateBookByID()
        {

            if (checkIfBookExists())
            {
                try
                {

                    int actual_stock = Convert.ToInt32(TextBox4.Text.Trim());
                    int current_stock = Convert.ToInt32(TextBox7.Text.Trim());

                    if (global_actual_stock == actual_stock)
                    {

                    }
                    else
                    {
                        if (actual_stock < global_issued_books)
                        {
                            //Response.Write("<script>alert('Actual Stock value cannot be less than the Issued books');</script>");
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                            "swal('Gerçek Stok değeri, Yayınlanan kitaplardan az olamaz', 'Tekrar deneyiniz' ,'warning')", true);
                            return;


                        }
                        else
                        {
                            current_stock = actual_stock - global_issued_books;
                            TextBox5.Text = "" + current_stock;
                        }
                    }

                    string genres = "";
                    foreach (int i in ListBox1.GetSelectedIndices())
                    {
                        genres = genres + ListBox1.Items[i] + ",";
                    }
                    genres = genres.Remove(genres.Length - 1);

                    string filepath = "~/book_inventory_img/books1";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;

                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("book_inventory_img/" + filename));
                        filepath = "~/book_inventory_img/" + filename;
                    }

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE book_master_tbl SET book_name=@book_name, genre=@genre, author_name=@author_name, publisher_name=@publisher_name, publish_date=@publish_date, language=@language, edition=@edition, book_cost=@book_cost, no_of_pages=@no_of_pages, book_description=@book_description, actual_stock=@actual_stock, current_stock=@current_stock, book_img_link=@book_img_link where book_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@book_name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@genre", genres);
                    cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publish_date", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@edition", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_cost", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@no_of_pages", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_description", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_stock", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@current_stock", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_img_link", filepath);


                    cmd.ExecuteNonQuery();
                    GridView1.DataBind();
                    con.Close();
                    //Response.Write("<script>alert('Book Updated Successfully');</script>");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Kitap Eklendi', 'Devam etmek için tıklayınız' ,'success')", true);


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                //Response.Write("<script>alert('Invalid Book ID');</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                "swal('Girilen Bilgiler Yanlış veya Boş', 'Tekrar deneyiniz' ,'warning')", true);
            }
        }


        void getBookByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl WHERE book_id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0]["book_name"].ToString();
                    TextBox3.Text = dt.Rows[0]["publish_date"].ToString();
                    TextBox5.Text = dt.Rows[0]["edition"].ToString();
                    TextBox6.Text = dt.Rows[0]["book_cost"].ToString().Trim();
                    TextBox9.Text = dt.Rows[0]["no_of_pages"].ToString().Trim();
                    TextBox4.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                    TextBox7.Text = dt.Rows[0]["current_stock"].ToString().Trim();
                    TextBox10.Text = dt.Rows[0]["book_description"].ToString();
                    TextBox4.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));

                    DropDownList1.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                    DropDownList2.SelectedValue = dt.Rows[0]["publisher_name"].ToString().Trim();
                    DropDownList3.SelectedValue = dt.Rows[0]["author_name"].ToString().Trim();

                    ListBox1.ClearSelection();
                     string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                     for (int i = 0; i < genre.Length; i++)
                     {
                         for (int j = 0; j < ListBox1.Items.Count; j++)
                         {
                             if (ListBox1.Items[j].ToString() == genre[i])
                             {
                                 ListBox1.Items[i].Selected = true;

                             }
                         }
                     }


                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                    global_issued_books = global_actual_stock - global_current_stock;
                    global_filepath = dt.Rows[0]["book_img_link"].ToString();

                }
                else
                {
                    //Response.Write("<script>alert('Invalid Book ID');</script>");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Girilen Bilgiler Yanlış veya Boş', 'Tekrar deneyiniz' ,'warning')", true);
                }

            }
            catch (Exception ex)
            {

            }
        }

        void fillAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT author_name from author_master_tbl;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList3.DataSource = dt;
                DropDownList3.DataValueField = "author_name";
                DropDownList3.DataBind();

                cmd = new SqlCommand("SELECT publisher_name from publisher_master_tbl;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                DropDownList2.DataSource = dt;
                DropDownList2.DataValueField = "publisher_name";
                DropDownList2.DataBind();

            }
            catch (Exception ex)
            {

            }
        }

        bool checkIfBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl WHERE book_id='" + TextBox1.Text.Trim() + "' OR book_name='" + TextBox2.Text.Trim() + "';", con);
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
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void addNewBook()
        {
            try
            {
                string genres = "";
                foreach (int i in ListBox1.GetSelectedIndices())
                {
                    genres = genres + ListBox1.Items[i] + ",";
                }
                // genres = Adventure,Self Help,
                genres = genres.Remove(genres.Length - 1);

                string filepath = "~/book_inventory_img/books1.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("book_inventory_img/" + filename));
                filepath = "~/book_inventory_img/" + filename;


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO book_master_tbl(book_id,book_name,genre,author_name,publisher_name,publish_date,language,edition,book_cost,no_of_pages,book_description,actual_stock,current_stock,book_img_link) values(@book_id,@book_name,@genre,@author_name,@publisher_name,@publish_date,@language,@edition,@book_cost,@no_of_pages,@book_description,@actual_stock,@current_stock,@book_img_link)", con);

                cmd.Parameters.AddWithValue("@book_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@book_img_link", filepath);

                cmd.ExecuteNonQuery();
                GridView1.DataBind();
                con.Close();

                //Response.Write("<script>alert('Book added successfully.');</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                "swal('Kitap Eklendi', 'Devam etmek için tıkalıyınız' ,'success')", true);
                

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }







    }
}
 