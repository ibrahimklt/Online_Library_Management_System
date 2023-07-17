<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookissuing.aspx.cs" Inherits="Fınal_OLMS.adminbookissuing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       }); 
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid">
        <div class="row">

            <!--sol kutu içi -->

            <div class="col-md-5">

                <div class="card">
                    <div class="card-body">


                        <!--kutu içi resim ve badge'li yayıncı detayları yazısı-->
                        <div class="row">
                            <div class="col">
                                <center>
                                        <h3>Kitap Alma & İade</h3>
                                </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <center>
                                        <img width="100px" src="images/books.png" />
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
                            <div class="col-md-6">
                                <label>Üye ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Member ID"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Kitap ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Book ID"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-warning" ID="Button1" runat="server" Text="Git" OnClick="Button1_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--yayıncı ıd ve yayıncı adı sonu-->


                        <div class="row">
                            <div class="col">
                                <br/>
                            </div>
                        </div>


                        <!--yayıncı ıd ve yayıncı adı sonu-->
                        <div class="row">
                            <div class="col-md-6">
                                <label>Üye Adı</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" Enabled="true" runat="server"  ReadOnly="True" BackColor="#CCCCCC"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Kitap Adı</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" Enabled="true" runat="server"  ReadOnly="True" BackColor="#CCCCCC"></asp:TextBox>
                                    
                                </div>
                            </div>
                        </div>
                        <!--yayıncı ıd ve yayıncı adı sonu-->


                        <div class="row">
                            <div class="col">
                                <br/>
                            </div>
                        </div>


                        <!--yayıncı ıd ve yayıncı adı sonu-->
                        <div class="row">
                            <div class="col-md-6">
                                <label>Başlangıç Tarihi</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Start Date" TextMode="Date"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Bitiş Tarihi</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="End Date" TextMode="Date"></asp:TextBox>

                                </div>
                            </div>
                        </div>
                        <!--yayıncı ıd ve yayıncı adı sonu-->


                        <div class="row">
                            <div class="col">
                                <br/>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <br/>
                            </div>
                        </div>

                        
                        <!--Basım ve döndür butonları -->
                        <div class="row">
                            <div class="col-6">
                                <asp:Button ID="Button2" class="btn btn-primary w-100 btn-lg" runat="server" Text="Alma" OnClick="Button2_Click" />
                            </div>
                            <div class="col-6 mx-auto">
                                <asp:Button ID="Button3" class="btn btn-success w-100 btn-lg" runat="server" Text="İade" OnClick="Button3_Click" />
                            </div>
                        </div>
                        <!--Basım ve döndür butonları sonu-->


                    </div>
                </div>

                <a href="homepage.aspx"><< Ana Sayfaya Geri Dön</a> 
                <br>

            </div>

            <!--sol kutu içi sonu -->


            <!--sağ kutu içi -->

            <div class="col-md-7">

                <div class="card">
                    <div class="card-body">


                        <!--Kitap Basımı Listesi yazısı-->
                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4>Kitap Basımı Listesi</h4>
                                </center>
                            </div>
                        </div>
                        <!--Kitap Basımı Listesi yazısı sonu-->


                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>


                        <!--Kitap Basımı Listesi gridview table-->
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="&#220;ye ID" SortExpression="member_id"></asp:BoundField>
                                        <asp:BoundField DataField="member_name" HeaderText="&#220;ye İsmi" SortExpression="member_name"></asp:BoundField>
                                        <asp:BoundField DataField="book_id" HeaderText="Kitap ID" SortExpression="book_id"></asp:BoundField>
                                        <asp:BoundField DataField="book_name" HeaderText="Kitap İsmi" SortExpression="book_name"></asp:BoundField>
                                        <asp:BoundField DataField="issue_date" HeaderText="Veriliş Tarihi" SortExpression="issue_date"></asp:BoundField>
                                        <asp:BoundField DataField="due_date" HeaderText="Bitiş Tarihi" SortExpression="due_date"></asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <!--Kitap Basımı Listesi gridview table sonu-->

                    </div>
                </div>

            </div>

            <!--sağ kutu içi sonu-->


        </div>
   <br /><br /><br /><br /><br /><br /><br /><br /><br /> </div>


</asp:Content>
