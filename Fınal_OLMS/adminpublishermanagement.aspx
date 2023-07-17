<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminpublishermanagement.aspx.cs" Inherits="Fınal_OLMS.adminpublishermanagement" %>
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


    <div class="container">
        <div class="row">

            <!--sol kutu içi -->

            <div class="col-md-5">

                <div class="card">
                    <div class="card-body">


                        <!--kutu içi resim ve badge'li yayıncı detayları yazısı-->
                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4>Yayıncı Detayları</h4>
                                </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <center>
                                        <img width="100px" src="images/publisher.png" />
                                </center>
                            </div>
                        </div>
                        <!--resim ve badge'li yayıncı detayları yazısı sonu-->


                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>


                        <!--yayıncı ıd ve yayıncı adı -->
                        <div class="row">
                            <div class="col-md-5">
                                <label>Yayıncı ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Publisher ID"></asp:TextBox>
                                   <%-- <asp:Button class="btn btn-warning" ID="Button1" runat="server" Text="Git" />  --%> 
                                        <asp:LinkButton class="btn btn-warning" ID="LinkButton1" runat="server" Text="Git" OnClick="Button1_Click"><i class="fa-brands fa-git"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-7">
                                <label>Yayıncı Adı</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Publisher Name"></asp:TextBox>

                                </div>
                            </div>
                        </div>
                        <!--yayıncı ıd ve yayıncı adı sonu-->


                        <div class="row">
                            <div class="col">
                                <br/>
                            </div>
                        </div>


                        <!--ekle, güncelle ve sil butonları -->
                        <div class="row">
                            <div class="col-4 ">
                                <asp:Button ID="Button2" class="btn btn-success w-100 btn-lg" runat="server" Text="Ekle" OnClick="Button2_Click" />
                            </div>
                            <div class="col-4 mx-auto">
                                <asp:Button ID="Button3" class="btn btn-primary w-100 btn-lg" runat="server" Text="Güncelle" OnClick="Button3_Click" />
                            </div>
                            <div class="col-4 mx-auto">
                                <asp:Button ID="Button4" class="btn btn-danger w-100 btn-lg" runat="server" Text="Sil" OnClick="Button4_Click" />
                            </div>
                        </div>
                        <!--ekle, güncelle ve sil butonları sonu-->


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


                        <!--yayıncı listesi yazısı-->
                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4>Yayıncı Listesi</h4>
                                    </center>
                            </div>
                        </div>
                        <!--yayıncı listesi yazısı sonu-->


                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>


                        <!--yayıncı listesi gridview table-->
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryDBConnectionString %>" SelectCommand="SELECT * FROM [publisher_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1"></asp:GridView>
                            </div>
                        </div>
                        <!--yayıncı listesi gridview table sonu-->

                    </div>
                </div>

            </div>

            <!--sağ kutu içi sonu-->


        </div>
   <br /><br /><br /><br /><br /><br /><br /><br /><br /> <br /><br /><br /><br /><br /><br /><br /><br /> </div>


</asp:Content>
