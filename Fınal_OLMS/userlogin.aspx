<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="Fınal_OLMS.userlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">

                <div class="card">
                    <div class="card-body">

                        <!--üye girişi ve image başı-->
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" src="images/generaluser.png" />
                                </center>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3><span class="badge bg-primary ">Üye Girişi</span></h3>
                                </center>
                            </div>
                        </div>
                        <!--üye girişi ve image başı -->


                        <div class="row">
                            <div class="col">
                                <hr/>
                            </div>
                        </div>


                        <!--üye giriş bilgileri için açılan alanlar-->
                        <div class="row">
                            <div class="col">
                                
                                <div class="form-group"> <!--form oluşturma aktif ediyor-->
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Member_ID" ></asp:TextBox> <!--standart toolboxları kullandık veri tabanına bağliycaz-->
                                </div>

                                <div class="row">
                                     <div class="col">
                                         <br />
                                     </div>
                                </div>
                          
                                <div class="form-group"> <!--form oluşturma aktif ediyor-->
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>

                                 <div class="row">
                                     <div class="col">
                                         <br />
                                     </div>
                                 </div>

                                <div class="form-group"> <!--form oluşturma aktif ediyor-->
                                    <asp:Button class="btn btn-success w-100 btn-lg" ID="Button1" runat="server" Text="Giriş" OnClick="Button1_Click" />
                                </div>

                                <div class="row">
                                     <div class="col">
                                         <br />
                                     </div>
                                 </div>

                                <div class="form-group"> <!--form oluşturma aktif ediyor-->
                                   <a href="usersignup.aspx"> <input class="btn btn-info w-100 btn-lg" id="Button2" type="button" value="Kayıt Ol" /> </a>
                                </div>

                            </div>
                        </div>
                        <!--üye giriş bilgileri için açılan alanlar sonu-->

                    </div>
                </div>

                <a href="homepage.aspx"><< Ana Sayfaya Geri Dön</a>
            </div>
        </div>
                <br/><br /><br /><br /><br /><br /><br /><br /><br /><br /> 
    </div>
    



</asp:Content>
