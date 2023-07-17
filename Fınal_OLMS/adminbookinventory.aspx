<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookinventory.aspx.cs" Inherits="Fınal_OLMS.adminbookinventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       }); 

       function readURL(input) {
           if (input.files && input.files[0]) {
               var reader = new FileReader();

               reader.onload = function (e) {
                   $('#imgview').attr('src', e.target.result);
               };

               reader.readAsDataURL(input.files[0]);
           }
       }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container-fluid">
        <div class="row">

            <!--sol kutu içi-->

            <div class="col-md-5">

                <div class="card">
                    <div class="card-body">


                        <!--resim ve badge'li Kitap Detaylarıyazısı-->
                        <div class="row">
                            <div class="col">
                                <center>
                                        <h3>Kitap Detayları</h3>
                                </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <center>
                                        <img id="imgview" Height="150px" width="100px" src="book_inventory_img/books1.png" />
                                </center>
                            </div>
                        </div>
                        <!--resim ve badge'li Kitap Detayları yazısı sonu-->


                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        

                        <!--Dosya yükleme alanı-->
                        <div class="row">
                            <div class="col">
                                <asp:FileUpload onchange="readURL(this);" CssClass="form-control" ID="FileUpload1" runat="server" />
                            </div>
                        </div>
                        <!--Dosya yükleme alanı sonu-->


                         <div class="row">
                            <div class="col">
                                <br/>
                            </div>
                        </div>


                        <!--Kitap ID, Kitap Adı bilgileri-->
                        <div class="row">

                            <div class="col-md-3">
                                <label>Kitap ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Book ID"></asp:TextBox>
                                        <%--<asp:LinkButton class="btn btn-primary" ID="LinkButton1" runat="server" Text="Git" OnClick="LinkButton1_Click"><i class="fa-brands fa-git"></i></asp:LinkButton> --%>
                                        <asp:Button class="btn btn-primary" ID="Button4" runat="server" Text="Git" OnClick="Button4_Click" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-9">
                                <label>Kitap Adı</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Book Name"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <!--Kitap ID, Kitap Adı bilgileri sonu -->


                        <div class="row">
                            <div class="col">
                                <br/>
                            </div>
                        </div>


                        <!--Dil, Yayıncı İsmi, Yazar Adı, Yayın Tarihi ve Tür bilgileri -->
                        <div class="row">

                            <div class="col-md-4">

                                <label>Dil</label>
                                <div class="form-group">
                                    <asp:DropDownList Class="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Türkçe" Value="Türkçe" />
                                        <asp:ListItem Text="İngilizce" Value="English" />
                                        <asp:ListItem Text="Fransızca" Value="French" />
                                        <asp:ListItem Text="Almanca" Value="German" />
                                        <asp:ListItem Text="İbranice" Value="Hebrew" />
                                        <asp:ListItem Text="Urduca" Value="Urdu" />
                                    </asp:DropDownList>
                                </div>


                                <div class="row">
                                  <div class="col">
                                     <br/>
                                  </div>
                               </div>


                                <label>Yayıncı İsmi</label>
                                <div class="form-group">
                                    <asp:DropDownList Class="form-control" ID="DropDownList2" runat="server">
                                        <asp:ListItem Text="Publisher 1" Value="Publisher 1" ></asp:ListItem>
                                        <asp:ListItem Text="Publisher 2" Value="Publisher 2" ></asp:ListItem>

                                    </asp:DropDownList>
                                </div>

                            </div>

                            <div class="col-md-4">

                                <label>Yazar Adı</label>
                                <div class="form-group">
                                    <asp:DropDownList Class="form-control" ID="DropDownList3" runat="server">
                                        <asp:ListItem Text="A1" Value="A1" />
                                        <asp:ListItem Text="A2" Value="A2" />
                                    </asp:DropDownList>
                                </div>
                        

                                <!--Arada boşluk için-->
                                <div class="row">
                                  <div class="col">
                                     <br/>
                                  </div>
                               </div>


                       
                                <label>Yayın Tarihi</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Publish Date" TextMode="Date"></asp:TextBox>
                                </div>

                            </div>

                            <div class="col-md-4">
                                <label>Tür</label>
                                <asp:ListBox CssClass="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="5">

                                          <asp:ListItem Text="Aksiyon" Value="Action" />
                                          <asp:ListItem Text="Macera" Value="Adventure" />
                                          <asp:ListItem Text="Çizgi Roman" Value="Comic Book" />
                                          <asp:ListItem Text="Kendi Kendine Yardım" Value="Self Help" />
                                          <asp:ListItem Text="Motivasyon" Value="Motivation" />
                                          <asp:ListItem Text="Sağlıklı Yaşam" Value="Healthy Living" />
                                          <asp:ListItem Text="Sağlık" Value="Wellness" />
                                          <asp:ListItem Text="Suç" Value="Crime" />
                                          <asp:ListItem Text="Drama" Value="Drama" />
                                          <asp:ListItem Text="Fantazi" Value="Fantasy" />
                                          <asp:ListItem Text="Korku" Value="Horror" />
                                          <asp:ListItem Text="Şiir" Value="Poetry" />
                                          <asp:ListItem Text="Kişisel Gelişim" Value="Personal Development" />
                                          <asp:ListItem Text="Roman" Value="Romance" />
                                          <asp:ListItem Text="Bilim Kurgu" Value="Science Fiction" />
                                          <asp:ListItem Text="Gerilim" Value="Suspense" />
                                          <asp:ListItem Text="Sanat" Value="Art" />
                                          <asp:ListItem Text="Otobiyografi" Value="Autobiography" />
                                          <asp:ListItem Text="Ansiklopedi" Value="Encyclopedia" />
                                          <asp:ListItem Text="Sağlık" Value="Health" />
                                          <asp:ListItem Text="Tarih" Value="History" />
                                          <asp:ListItem Text="Matematik" Value="Math" />
                                          <asp:ListItem Text="Ders Kitabı" Value="Textbook" />
                                          <asp:ListItem Text="Bilim" Value="Science" />
                                          <asp:ListItem Text="Seyahat" Value="Travel" />

                                </asp:ListBox>
                            </div>

                        </div>
                        <!--Dil, Yayıncı İsmi Yazar Adı, Yayın Tarihi ve Tür bilgileri sonu-->


                        <div class="row">
                            <div class="col">
                                <br/>
                            </div>
                        </div>


                        <!--Kitap Baskısı, Kitap Maliyeti (Birim Başına), Sayfalar, Gerçek Stok, Mevcut Stok ve Yayınlanmış Kitaplar bilgileri -->
                        <div class="row">

                            <div class="col-md-4">
                                <label>Kitap Baskısı</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Edition" ></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Kitap Maliyeti (Birim Başına)</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Book Cost (Per Unit)" TextMode="Number"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Sayfalar</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Pages" TextMode="Number"></asp:TextBox>

                                </div>
                            </div>

                        </div>


                        <!--Arada boşluk için-->
                                <div class="row">
                                  <div class="col">
                                     <br/>
                                  </div>
                               </div>


                        <div class="row">

                            <div class="col-md-4">
                                <label>Gerçek Stok</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Actual Stock" TextMode="Number"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Mevcut Stok</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Current Stock" Enabled="true" TextMode="Number" ReadOnly="true" BackColor="#CCCCCC"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Yayınlanmış Kitaplar</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Issued Books" Enabled="true" TextMode="Number" ReadOnly="true" BackColor="#CCCCCC"></asp:TextBox>

                                </div>
                            </div>

                        </div>
                        <!--Kitap Baskısı, Kitap Maliyeti (Birim Başına), Sayfalar, Gerçek Stok, Mevcut Stok ve Yayınlanmış Kitaplar bilgileri -->


                        <div class="row">
                            <div class="col">
                                <br/>
                            </div>
                        </div>


                        <!--Kitap Açıklaması -->

                        <div class="row">
                            <div class="col-12">
                                 <label>Kitap Açıklaması</label>
                                      <div class="form-group">
                                           <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Book Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                      </div>
                            </div>
                         </div>

                        <!--Kitap Açıklaması sonu-->


                        <div class="row">
                            <div class="col">
                                <br/>
                            </div>
                        </div>
                        

                        <!--Ekle, Güncelle ve Sil butonları -->
                      <div class="row">   
                          
                             <div class="col-4 mx-auto">
                                 <asp:Button ID="Button1" class="btn btn-success btn-lg w-100" runat="server" Text="Ekle" OnClick="Button1_Click" />
                             </div>
   
   
                            <div class="col-4 mx-auto">
                                <asp:Button ID="Button3" class="btn btn-warning btn-lg w-100" runat="server" Text="Güncelle" OnClick="Button3_Click" />
                            </div>
                  
       
                            <div class="col-4 mx-auto">
                                <asp:Button ID="Button2" class="btn btn-danger btn-lg w-100" runat="server" Text="Sil" OnClick="Button2_Click" />
                            </div>
                  

                      </div>
                        <!--Ekle, Güncelle ve Sil butonları sonu-->


                    </div>
                </div>

                <a href="homepage.aspx"><< Ana Sayfaya Geri Dön</a> 
                <br>

            </div>

            <!--sol kutu içi sonu-->

            <!--sağ kutu içi -->

            <div class="col-md-7">

                <div class="card">
                    <div class="card-body">


                        <!--Kitap Envanter Listesi yazısı-->
                        <div class="row">
                            <div class="col">
                                <center>
                                        <h3>Kitap Envanter Listesi</h3>
                                </center>
                            </div>
                        </div>
                        <!--Kitap Envanter Listesi yazısı sonu-->


                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>


                        <!--Kitap Envanter Listesi gridview table-->
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryDBConnectionString2 %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        
                                        <asp:BoundField DataField="book_id" HeaderText="book_id" ReadOnly="True" SortExpression="book_id"></asp:BoundField>
                                        
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                       <div class="row">
                                          <div class="col-lg-10">
                                             <div class="row">
                                                <div class="col-12">
                                                   <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   <span>Yazar - </span>
                                                   <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("author_name") %>'></asp:Label>
                                                   &nbsp;| <span><span>&nbsp;</span>Türü - </span>
                                                   <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>'></asp:Label>
                                                   &nbsp;| 
                                                   
                                                   <span>Dil -<span>&nbsp;</span>
                                                      <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("language") %>'></asp:Label>
                                                   </span>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   Yayıncı -
                                                   <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                   &nbsp;| Yayınlanma Tarihi -
                                                   <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("publish_date") %>'></asp:Label>
                                                   &nbsp;| Sayfa Sayısı -
                                                   <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("no_of_pages") %>'></asp:Label>
                                                   &nbsp;| Baskı -
                                                   <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("edition") %>'></asp:Label>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   Maliyet -
                                                   <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("book_cost") %>'></asp:Label>
                                                   &nbsp;| Gerçek Stok -
                                                   <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("actual_stock") %>'></asp:Label>
                                                   &nbsp;| Mevcut Stok -
                                                   <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("current_stock") %>'></asp:Label>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   Tanım -
                                                   <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("book_description") %>'></asp:Label>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="col-lg-2">
                                             <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                          </div>
                                       </div>
                                    </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <!--Kitap Envanter Listesi gridview table sonu-->

                    </div>
                </div>

            </div>

            <!--sağ kutu içi sonu-->
            


        </div>
   <br /><br /></div>


</asp:Content>
