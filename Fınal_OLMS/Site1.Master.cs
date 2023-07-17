using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fınal_OLMS
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null)
                {
                    LinkButton1.Visible = true; //kullanıcı girişi 
                    LinkButton2.Visible = true; //üye ol linkbuttonları

                    LinkButton4.Visible = true; //Kitapları Görüntüle 
                    LinkButton3.Visible = false; //Çıkış yap 
                    LinkButton7.Visible = false; //Merhaba Kullanıcı linkbuttonları   

                    LinkButton6.Visible = true; //yönetici girişi
                    LinkButton11.Visible = false; //yazar yönetimi
                    LinkButton12.Visible = false; //yayıncı yönetimi
                    LinkButton8.Visible = false; //kitap envanteri 
                    LinkButton9.Visible = false; //kitap basımı
                    LinkButton10.Visible = false; //üye yönetimi linkbuttonları

                }

                else if (Session["role"].Equals("user"))
                {
                    LinkButton1.Visible = false; //kullanıcı girişi 
                    LinkButton2.Visible = false; //üye ol linkbuttonları

                    LinkButton4.Visible = true; //Kitapları Görüntüle 
                    LinkButton3.Visible = true; //Çıkış yap 
                    LinkButton7.Visible = true; //Merhaba Kullanıcı linkbuttonları  
                    LinkButton7.Text ="Merhaba "+ Session["username"].ToString();

                    LinkButton6.Visible = true; //yönetici girişi
                    LinkButton11.Visible = false; //yazar yönetimi
                    LinkButton12.Visible = false; //yayıncı yönetimi
                    LinkButton8.Visible = false; //kitap envanteri 
                    LinkButton9.Visible = false; //kitap basımı
                    LinkButton10.Visible = false; //üye yönetimi linkbuttonları
                    
                }

                else if (Session["role"].Equals("admin"))
                {
                    LinkButton1.Visible = false; //kullanıcı girişi 
                    LinkButton2.Visible = false; //üye ol linkbuttonları

                    LinkButton4.Visible = true; //Kitapları Görüntüle 
                    LinkButton3.Visible = true; //Çıkış yap 
                    LinkButton7.Visible = true; //Merhaba Kullanıcı linkbuttonları  
                    LinkButton7.Text = "Merhaba Admin";

                    LinkButton6.Visible = false; //yönetici girişi
                    LinkButton11.Visible = true; //yazar yönetimi
                    LinkButton12.Visible = true; //yayıncı yönetimi
                    LinkButton8.Visible = true; //kitap envanteri 
                    LinkButton9.Visible = true; //kitap basımı
                    LinkButton10.Visible = true; //üye yönetimi linkbuttonları
                    
                }
            }
            catch (Exception ex) 
            { 
            
            }

        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminauthormanagement.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminpublishermanagement.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookinventory.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookissuing.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminmembermanagement.aspx");
        }

        //çıkış yap butonu
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            LinkButton1.Visible = true; //kullanıcı girişi 
            LinkButton2.Visible = true; //üye ol linkbuttonları

            LinkButton3.Visible = false; //Çıkış yap 
            LinkButton7.Visible = false; //Merhaba Kullanıcı linkbuttonları   

            LinkButton6.Visible = true; //yönetici girişi
            LinkButton11.Visible = false; //yazar yönetimi
            LinkButton12.Visible = false; //yayıncı yönetimi
            LinkButton8.Visible = false; //kitap envanteri 
            LinkButton9.Visible = false; //kitap basımı
            LinkButton10.Visible = false; //üye yönetimi linkbuttonları

            Response.Redirect("homepage.aspx");
        }

        //üye ol butonu
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewbooks.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("userprofile.aspx");
        }
    }
}