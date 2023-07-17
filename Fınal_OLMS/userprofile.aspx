<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="Fınal_OLMS.userprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {

            //$(document).ready(function () {
            //$('.table').DataTable();
            // });

            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();     //https://datatables.net/manual/styling/theme-creator
            //$('.table1').DataTable();
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid">
        <div class="row">

            <!--sol kutu içi -->

            <div class="col-md-5 ">
                <!--Kutu içi başı -->
                <div class="card">
                    <div class="card-body">
                        <!--kutu içi resim ve badge'li profilin yazısı -->
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
                                    <h3><span class="badge bg-primary ">Profilin</span></h3>
                                    <span>Hesap Durumu - </span>  
                                    <asp:label class="badge rounded-pill text-bg-info" ID="Label1" runat="server" Text="Your Status"></asp:label>
                                </center>
                            </div>
                        </div>
                        <!--kutu içi resim ve profilin yazısı sonu-->


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
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Name Surname" ></asp:TextBox> <!--standart toolboxları kullandık veri tabanına bağliycaz-->
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Doğum Tarihi</label>
                                <div class="form-group"> 
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
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
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="PhoneNumber" TextMode="Phone"></asp:TextBox> <!--standart toolboxları kullandık veri tabanına bağliycaz-->
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Email</label>
                                <div class="form-group"> 
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
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
                                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server" >
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
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="District" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Posta Kodu</label>
                                <div class="form-group"> 
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Post Code" TextMode="Number"></asp:TextBox>
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
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox> <!--standart toolboxları kullandık veri tabanına bağliycaz-->
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
                            <div class="col-md-4">
                                <label>Kullanıcı ID</label>
                                <div class="form-group"> 
                                    <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="User ID" TextMode="SingleLine" ReadOnly="True"></asp:TextBox> <!--standart toolboxları kullandık veri tabanına bağliycaz-->
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Eski Şifre</label>
                                <div class="form-group"> 
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="OldPassword" TextMode="Password" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Yeni Şifre</label>
                                <div class="form-group"> 
                                    <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!--Kullanıcı_ID ve şifre alanı sonu-->


                        <div class="row">
                             <div class="col">
                                                    <br />
                             </div>
                         </div>


                        <!--Güncelleştirme butonu başı-->
                        <div class="row">
                            <div class="col-8 mx-auto">
                                <center>
                                    <div class="form-group"> <!--form oluşturma aktif ediyor-->
                                        <asp:Button class="btn btn-warning w-75 btn-lg" ID="Button1" runat="server" Text="Güncelleştirme" OnClick="Button1_Click" />
                                    </div>
                                </center>
                            </div>
                        </div>
                        <!--Güncelleştirme butonu sonu-->

                    </div>
                </div>
            <!--Kutu içi sonu -->
                <a href="homepage.aspx"><< Ana Sayfaya Geri Dön</a>
            </div>

            <!--sol kutu içi sonu-->


            <!--sağ kutu içi -->

            <div class="col-md-7">
            <div class="card">
                    <div class="card-body">
                        <!--kutu içi resim ve Yayınlanmış kitaplarınız yazısı -->
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="images/books1.png" />
                                </center>
                            </div>
                        </div>
                      
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h5><span class="badge bg-primary ">Yayınlanmış kitaplarınız</span></h5> 
                                    <asp:Label class="badge badge-pill badge-info " ID="Label2" runat="server" Text="Your Books Info"></asp:Label>
                                </center>
                            </div>
                        </div>
                        <!--kutu içi resim ve Yayınlanmış kitaplarınız yazısı sonu-->


                        <div class="row">
                            <div class="col">
                                <hr/>
                            </div>
                        </div>


                        <!--gridview başı-->
                        <div class="row">
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server"></asp:GridView>
                            </div>
                        </div>
                        <!--gridview sonu-->
                       
             </div>
         </div>



            </div>

            <!--sağ kutu içi sonu-->


        </div>
                
    </div>


</asp:Content>
