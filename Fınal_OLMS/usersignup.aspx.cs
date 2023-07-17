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
    public partial class usersignup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //kayıt ol butonu
        protected void Button1_Click(object sender, EventArgs e)
        {

            //Control[] controls = { Name_Surname, DateOfBirth, PhoneNumber, Email, Province, District, Post_Code, Full_Address, Member_ID, Password };

            if (CheckingFieldsAreFilled(new Control[] { Name_Surname, DateOfBirth, PhoneNumber, Email, Province, District, Post_Code, Full_Address, Member_ID, Password }))
            { 
                try
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                       "swal('Boş Alan Bırakılamaz', 'Lütfen Alanları Doldurduktan Sonra Tekrar Deneyin', 'warning')", true);
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else { 

            if (checkMemberExists())
            {
                //Response.Write("<script>alert('Bu üye kimliğine sahip Üye Zaten Var, başka bir kimlik deneyin');</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Bu üye kimliğine sahip Üye Zaten Var!', 'başka bir kimlik deneyin' ,'warning')", true);
            }
            else
            {
                signUpNewMember();
            }
                 }
    }



        //user defined method

        bool checkMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed) { con.Open(); }


                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id='"+Member_ID.Text.Trim()+"';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);


                if(dt.Rows.Count >= 1) 
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


        void signUpNewMember()
        {
            //Response.Write("<script>alert('Testing');</script>");

           

            try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == System.Data.ConnectionState.Closed) { con.Open(); }

                    SqlCommand cmd = new SqlCommand("INSERT INTO member_master_tbl (full_name,dateofbirth,contact_no,email,province,district,postcode,full_address,member_id,password,account_status) values(@full_name,@dateofbirth,@contact_no,@email,@province,@district,@postcode,@full_address,@member_id,@password,@account_status)", con);

                    cmd.Parameters.AddWithValue("@full_name", Name_Surname.Text.Trim());
                    cmd.Parameters.AddWithValue("@dateofbirth", DateOfBirth.Text.Trim());
                    cmd.Parameters.AddWithValue("@contact_no", PhoneNumber.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", Email.Text.Trim());
                    cmd.Parameters.AddWithValue("@province", Province.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@district", District.Text.Trim());
                    cmd.Parameters.AddWithValue("@postcode", Post_Code.Text.Trim());
                    cmd.Parameters.AddWithValue("@full_address", Full_Address.Text.Trim());
                    cmd.Parameters.AddWithValue("@member_id", Member_ID.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", Password.Text.Trim());
                    cmd.Parameters.AddWithValue("@account_status", "pending");

                    cmd.ExecuteNonQuery();  /*katalog işlemlerini gerçekleştirmek yada UPDATE, INSERT veya DELETE deyimlerini yürüterek veritabanındaki verileri kullanmadan DataSet değiştirmek için kullanılır*/
                    con.Close();
                    //Response.Write("<script>alert('Kayıt başarılı. Giriş yapmak için Kullanıcı Girişine gidin');</script>");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                        "swal('Kayıt başarılı.', 'Giriş yapmak için Kullanıcı Girişine gidin', 'success')", true);

                }

                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            

        }

        bool CheckingFieldsAreFilled(Control[] controls)
        {
            bool anyFieldEmpty = false;
            foreach (Control control in new Control[] { Name_Surname, DateOfBirth, PhoneNumber, Email, Province, District, Post_Code, Full_Address, Member_ID, Password })
            {
                if (control is TextBox)
                {
                    TextBox textBox = (TextBox)control;
                    if (string.IsNullOrWhiteSpace(textBox.Text))
                    {
                        textBox.BorderColor = System.Drawing.Color.Red;
                        anyFieldEmpty = true;
                    }
                    else
                    {
                        textBox.BorderColor = System.Drawing.Color.Green;
                    }
                }
                else if (control is DropDownList)
                {
                    DropDownList dropDownList = (DropDownList)control;
                    if (dropDownList.SelectedIndex == 0)
                    {
                        dropDownList.BorderColor = System.Drawing.Color.Red;
                        anyFieldEmpty = true;
                    }
                    else
                    {
                        dropDownList.BorderColor = System.Drawing.Color.Green;
                    }
                }
            }
            return anyFieldEmpty;
        }


    }
}