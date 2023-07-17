<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="Fınal_OLMS.usersignup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container ">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <!--Kutu içi başı -->
                <div class="card">
                    <div class="card-body">
                        <!--kutu içi resim ve badge'li üye kayıtı yazısı -->
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="images/generaluser.png" />
                                </center>
                            </div>
                        </div>
                      
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3><span class="badge bg-primary ">Üye Kaydı</span></h3>
                                </center>
                            </div>
                        </div>
                        <!--kutu içi resim ve üye kayıtı yazısı sonu-->


                        <div class="row">
                            <div class="col">
                                <hr/>
                            </div>
                        </div>

                        <!--kutu içi AdSoyad ve doğum tarihi alanı başı-->
                        <div class="row">
                            <div class="col-md-6">
                                <label>Ad Soyad</label>
                                <div class="form-group"> 
                                    <asp:TextBox CssClass="form-control" ID="Name_Surname" runat="server" placeholder="Name Surname" ></asp:TextBox> <!--standart toolboxları kullandık veri tabanına bağliycaz-->
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Doğum Tarihi</label>
                                <div class="form-group"> 
                                    <asp:TextBox CssClass="form-control" ID="DateOfBirth" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!--kutu içi AdSoyad ve doğum tarihi alanı sonu-->


                        <div class="row">
                             <div class="col">
                                                    <br />
                             </div>
                         </div>


                        <!--kutu içi telefon ve email alanı başı-->
                         <div class="row">
                            <div class="col-md-6">
                                <label>Telefon Numarası</label>
                                <div class="form-group"> 
                                    <asp:TextBox CssClass="form-control" ID="PhoneNumber" runat="server" placeholder="PhoneNumber" TextMode="Phone"></asp:TextBox> <!--standart toolboxları kullandık veri tabanına bağliycaz-->
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Email</label>
                                <div class="form-group"> 
                                    <asp:TextBox CssClass="form-control" ID="Email" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!--kutu içi telefon ve email alanı sonu-->


                        <div class="row">
                             <div class="col">
                                                    <br />
                             </div>
                         </div>


                        <!--İl İlçe posta kodu alanı başı-->
                         <div class="row">
                            <div class="col-md-4">
                                <label>İl</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="Province" runat="server" >
                                        <asp:listitem Text="Select" Value="Select"></asp:listitem>
                                        <asp:ListItem Value="01">Adana</asp:ListItem>
            <asp:ListItem Value="02">Adıyaman</asp:ListItem>
            <asp:ListItem Value="03">Afyonkarahisar</asp:ListItem>
            <asp:ListItem Value="04">Ağrı</asp:ListItem>
            <asp:ListItem Value="05">Amasya</asp:ListItem>
            <asp:ListItem Value="06">Ankara</asp:ListItem>
            <asp:ListItem Value="07">Antalya</asp:ListItem>
            <asp:ListItem Value="08">Artvin</asp:ListItem>
            <asp:ListItem Value="09">Aydın</asp:ListItem>
            <asp:ListItem Value="10">Balıkesir</asp:ListItem>
            <asp:ListItem Value="11">Bilecik</asp:ListItem>
            <asp:ListItem Value="12">Bingöl</asp:ListItem>
            <asp:ListItem Value="13">Bitlis</asp:ListItem>
            <asp:ListItem Value="14">Bolu</asp:ListItem>
            <asp:ListItem Value="15">Burdur</asp:ListItem>
            <asp:ListItem Value="16">Bursa</asp:ListItem>
            <asp:ListItem Value="17">Çanakkale</asp:ListItem>
            <asp:ListItem Value="18">Çankırı</asp:ListItem>
            <asp:ListItem Value="19">Çorum</asp:ListItem>
            <asp:ListItem Value="20">Denizli</asp:ListItem>
            <asp:ListItem Value="21">Diyarbakır</asp:ListItem>
            <asp:ListItem Value="22">Edirne</asp:ListItem>
            <asp:ListItem Value="23">Elazığ</asp:ListItem>
            <asp:ListItem Value="24">Erzincan</asp:ListItem>
            <asp:ListItem Value="25">Erzurum</asp:ListItem>
            <asp:ListItem Value="26">Eskişehir</asp:ListItem>
            <asp:ListItem Value="27">Gaziantep</asp:ListItem>
            <asp:ListItem Value="28">Giresun</asp:ListItem>
            <asp:ListItem Value="29">Gümüşhane</asp:ListItem>
            <asp:ListItem Value="30">Hakkari</asp:ListItem>
            <asp:ListItem Value="31">Hatay</asp:ListItem>
            <asp:ListItem Value="32">Isparta</asp:ListItem>
            <asp:ListItem Value="33">Mersin</asp:ListItem>
            <asp:ListItem Value="34">İstanbul</asp:ListItem>
            <asp:ListItem Value="35">İzmir</asp:ListItem>
            <asp:ListItem Value="36">Kars</asp:ListItem>
            <asp:ListItem Value="37">Kastamonu</asp:ListItem>
            <asp:ListItem Value="38">Kayseri</asp:ListItem>
            <asp:ListItem Value="39">Kırklareli</asp:ListItem>
            <asp:ListItem Value="40">Kırşehir</asp:ListItem>
            <asp:ListItem Value="41">Kocaeli</asp:ListItem>
            <asp:ListItem Value="42">Konya</asp:ListItem>
            <asp:ListItem Value="43">Kütahya</asp:ListItem>
            <asp:ListItem Value="44">Malatya</asp:ListItem>
            <asp:ListItem Value="45">Manisa</asp:ListItem>
            <asp:ListItem Value="46">Kahramanmaraş</asp:ListItem>
            <asp:ListItem Value="47">Mardin</asp:ListItem>
            <asp:ListItem Value="48">Muğla</asp:ListItem>
            <asp:ListItem Value="49">Muş</asp:ListItem>
            <asp:ListItem Value="50">Nevşehir</asp:ListItem>
            <asp:ListItem Value="51">Niğde</asp:ListItem>
            <asp:ListItem Value="52">Ordu</asp:ListItem>
            <asp:ListItem Value="53">Rize</asp:ListItem>
            <asp:ListItem Value="54">Sakarya</asp:ListItem>
            <asp:ListItem Value="55">Samsun</asp:ListItem>
            <asp:ListItem Value="56">Siirt</asp:ListItem>
            <asp:ListItem Value="57">Sinop</asp:ListItem>
            <asp:ListItem Value="58">Sivas</asp:ListItem>
            <asp:ListItem Value="59">Tekirdağ</asp:ListItem>
            <asp:ListItem Value="60">Tokat</asp:ListItem>
            <asp:ListItem Value="61">Trabzon</asp:ListItem>
            <asp:ListItem Value="62">Tunceli</asp:ListItem>
            <asp:ListItem Value="63">Şanlıurfa</asp:ListItem>
            <asp:ListItem Value="64">Uşak</asp:ListItem>
            <asp:ListItem Value="65">Van</asp:ListItem>
            <asp:ListItem Value="66">Yozgat</asp:ListItem>
            <asp:ListItem Value="67">Zonguldak</asp:ListItem>
            <asp:ListItem Value="68">Aksaray</asp:ListItem>
            <asp:ListItem Value="69">Bayburt</asp:ListItem>
            <asp:ListItem Value="70">Karaman</asp:ListItem>
            <asp:ListItem Value="71">Kırıkkale</asp:ListItem>
            <asp:ListItem Value="72">Batman</asp:ListItem>
            <asp:ListItem Value="73">Şırnak</asp:ListItem>
            <asp:ListItem Value="74">Bartın</asp:ListItem>
            <asp:ListItem Value="75">Ardahan</asp:ListItem>
            <asp:ListItem Value="76">Iğdır</asp:ListItem>
            <asp:ListItem Value="77">Yalova</asp:ListItem>
            <asp:ListItem Value="78">Karabük</asp:ListItem>
            <asp:ListItem Value="79">Kilis</asp:ListItem>
            <asp:ListItem Value="80">Osmaniye</asp:ListItem>
            <asp:ListItem Value="81">Düzce</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>İlçe</label>
                                <div class="form-group"> 
                                    <asp:TextBox CssClass="form-control" ID="District" runat="server" placeholder="District" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Posta Kodu</label>
                                <div class="form-group"> 
                                    <asp:TextBox CssClass="form-control" ID="Post_Code" runat="server" placeholder="Post Code" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!--İl İlçe posta kodu alanı sonu-->


                         <div class="row">
                             <div class="col">
                                                    <br />
                             </div>
                         </div>


                        <!--Adres Bilgileri alanı başı-->
                         <div class="row">
                            <div class="col">
                                <label>Adres Bilgileri</label>
                                <div class="form-group "> 
                                    <asp:TextBox CssClass="form-control" ID="Full_Address" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox> <!--standart toolboxları kullandık veri tabanına bağliycaz-->
                                </div>
                            </div>
                        </div>
                        <!--Adres Bilgileri alanı sonu-->


                         <div class="row">
                             <div class="col">
                                                    <br /> <br />
                             </div>
                         </div>


                        <!--Kimlik Kaydı badge i-->
                        <div class="row">
                            <center>
                                <div class="col">
                                     <h4><span class="badge bg-secondary ">Kimlik Kaydı</span></h4>
                               </div>
                            </center>
                         </div>
                        <!--Kimlik Kayıtı badge i-->


                        <!--Kullanıcı_ID ve şifre alanı başı-->
                         <div class="row">
                            <div class="col-md-6">
                                <label>Kullanıcı ID</label>
                                <div class="form-group"> 
                                    <asp:TextBox class="form-control" ID="Member_ID" runat="server" placeholder="Member ID" TextMode="SingleLine"></asp:TextBox> <!--standart toolboxları kullandık veri tabanına bağliycaz-->
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Şifre</label>
                                <div class="form-group"> 
                                    <asp:TextBox CssClass="form-control" ID="Password" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!--Kullanıcı_ID ve şifre alanı sonu-->


                        <div class="row">
                             <div class="col">
                                                    <br />
                             </div>
                         </div>


                        <!--Kayıt ol butonu başı-->
                        <div class="row">
                            <div class="col">
                                <div class="form-group"> <!--form oluşturma aktif ediyor-->
                                    <asp:Button class="btn btn-success w-100 btn-lg" ID="Button1" runat="server" Text="Kayıt ol" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>
                        <!--Kayıt ol butonu sonu-->

                    </div>
                </div>
            <!--Kutu içi sonu -->
                <a href="homepage.aspx"><< Ana Sayfaya Geri Dön</a>
            </div>
        </div>
                <br/>
    </div>



</asp:Content>
