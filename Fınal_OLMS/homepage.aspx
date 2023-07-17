<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="Fınal_OLMS.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section> <!--belgede bir bölüm tanımladık (en üst bölüm)-->
        <img src="images/milletkutup1.png" class="img-fluid"/>  <!--Bir resme .img-fluid eklediğimizde width:100%; ve height:auto; özelliklerini uygulamış oluyoruz dolayısıyla resmin genişliği içinde bulunduğu etiketin genişliğine göre ayarlanmış oluyor.-->
    </section>

    <section class="bg-info-subtle"> <!--belgede bir bölüm tanımladık (üsteki section nun bir alt bölümü)-->     <!--container[row [column], row [column column column]] -->
        <div class="container"> 
            <div class="row">
                <div class="col-12">
                    <center>
                    <h2>Özelliklerimiz</h2>
                    <p><b>3 temel özelliğimiz </b></p>
                    </center>
                </div>
            </div>

            <div class="row"> <!--row sadece 2 ye bölünebilir -->
                <div class="col-md-4">  <!--https://sadikturan.com/bootstrap/bootstrap-grids/1201--> <!--kısaca col-md-4 classı row içerisinde tüm alanı 4 e ayırdı-->
               <center>
                  <img width="150px" src="images/digital-inventory.png" />
                  <h4>Dijital Kitap Envanteri</h4>
                  <p class="text-justify">kullanıcıların çevrimiçi olarak erişebileceği geniş bir dijital kitap koleksiyonudur. Bu envanter, farklı türlerde ve konularda yüzlerce e-kitap içermektedir. Kullanıcılar, kitap arama, ödünç alma ve iade etme işlemlerini kolayca yapabilirler.</p>
               </center>
                </div>

                <div class="col-md-4">  
               <center>
                   <img width="150px" src="images/search-online.png" />
                  <h4>Kitap Ara</h4>
                  <p class="text-justify">kullanıcıların dijital kitap envanterindeki kitapları hızlı ve kolay bir şekilde aramasına olanak tanır. Kullanıcılar, kitap adı, yazar, veya konu numarasına göre arama yapabilirler.</p>
               </center>
                </div>

                <div class="col-md-4">  
               <center>
                   <img width="150px" src="images/defaulters-list.png" />
                  <h4>Geciken Kitaplar Listesi</h4>
                  <p class="text-justify">kitap ödünç alan ancak süresi dolup iade etmeyen kullanıcıların listesini içerir. Bu liste, kütüphane personelinin hangi kullanıcıların kitapları iade etmediğini takip etmelerine yardımcı olur. Kullanıcılar, bu listede isimlerinin yer almaması için ödünç aldıkları kitapları zamanında iade etmek zorundadırlar. Aksi takdirde, kütüphane personeli bu listedeki kullanıcıların hesaplarını askıya alabilir veya diğer yaptırımlar uygulayabilir.</p>
               </center>
                </div>


            </div>
        </div>
    </section>

    <section> <!--belgede bir bölüm tanımladık (3.bölüm)-->
        <img src="images/milletkutup2.jpg" class="img-fluid" />
    </section>

    <section class="bg-info-subtle"> <!--belgede bir bölüm tanımladık (4.bölüm)-->
        <div class="container"> <!--boostrap dan gelir container-->
            <div class="row">
                <div class="col-12">
                    <center>
                    <h2>Sürecimiz</h2>
                    <p><b>3 Adımlık Basit Bir Sürecimiz Var</b></p>
                    </center>
                </div>
            </div>

            <div class="row"> <!--row sadece 2 ye bölünebilir -->
                <div class="col-md-4">  <!--https://sadikturan.com/bootstrap/bootstrap-grids/1201--> <!--kısaca col-md-4 classı row içerisinde tüm alanı 4 e ayırdı-->
               <center>
                   <img width="150px" src="images/sign-up.png" />
                  <h4>Kayıt Ol</h4>
                  <p class="text-justify">Kullanıcılar, kişisel bilgilerini girerek kolayca bir hesap oluşturabilirler. Kayıt olan kullanıcılar, kitapları ödünç alabilir, okuyabilir ve iade edebilirler.</p>
               </center>
                </div>

                <div class="col-md-4">  
               <center>
                   <img width="150px" src="images/search-online.png" />
                  <h4>Kitap Ara</h4>
                  <p class="text-justify">dijital kitap envanterindeki kitapları hızlı ve kolay bir şekilde ara.</p>
               </center>
                </div>

                <div class="col-md-4">  
               <center>
                   <img width="150px" src="images/library.png" />
                  <h4>Bizi Ziyaret Edin</h4>
                  <p class="text-justify">Kullanıcılar, kütüphaneye fiziksel olarak ziyaret ederek kitapları ödünç alabilir, kütüphane koleksiyonunu inceleyebilir ve diğer kütüphane hizmetlerinden yararlanabilirler.</p>
               </center>
                </div>


            </div>
        </div>
    </section>


</asp:Content>
