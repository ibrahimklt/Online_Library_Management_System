<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminmembermanagement.aspx.cs" Inherits="Fınal_OLMS.adminmembermanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {

            //$(document).ready(function () {
            //$('.table').DataTable();
            // });

            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();     //https://datatables.net/manual/styling/theme-creator
            responsive: true;
            //$('.table1').DataTable();
        });
    </script>  

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid">
        <div class="row">

            <!--sol kutu içi-->

            <div class="col-md-5">

                <div class="card">
                    <div class="card-body">


                        <!--kutu içi resim ve badge'li Üye Bilgileri yazısı-->
                        <div class="row">
                            <div class="col">
                                <center>
                                        <h3>Üye Bilgileri</h3>
                                </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <center>
                                        <img width="150px" src="images/generaluser.png" />
                                </center>
                            </div>
                        </div>
                        <!--resim ve badge'li Üye Bilgileri yazısı sonu-->


                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>


                        <!--Üye ID, Ad Soyad ve Hesap Durumu bilgileri-->
                        <div class="row">

                            <div class="col-md-3">
                                <label>Üye ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Member ID"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary" ID="LinkButton1" runat="server" Text="Git" OnClick="LinkButton1_Click"><i class="fa-brands fa-git"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Ad Soyad</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Full Name" ReadOnly="true" BackColor="#CCCCCC"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <label>Hesap Durumu</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Account Status" ReadOnly="true" BackColor="#CCCCCC"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-success mr-1" ID="Button4" runat="server" Text="K" OnClick="LinkButton4_Click"><i class="fa-solid fa-circle-check"></i></asp:LinkButton> 
                                        <asp:LinkButton class="btn btn-warning mr-1" ID="Button5" runat="server" Text="B" OnClick="LinkButton5_Click"><i class="fa-regular fa-circle-pause"></i></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-danger mr-1" ID="Button6" runat="server" Text="D" OnClick="LinkButton6_Click"><i class="fa-solid fa-circle-xmark"></i></asp:LinkButton>

                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        <!--Üye ID, Ad Soyad ve Hesap Durumu bilgileri sonu -->


                        <div class="row">
                            <div class="col">
                                <br/>
                            </div>
                        </div>


                        <!--Doğum Tarihi, İletişim Numarası ve Email bilgileri -->
                        <div class="row">

                            <div class="col-md-3">
                                <label>Doğum Tarihi</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Date Of Birth" ReadOnly="True" BackColor="#CCCCCC"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>İletişim Numarası</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Contact No" ReadOnly="True" BackColor="#CCCCCC"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-5">
                                <label>Email</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email ID" ReadOnly="True" BackColor="#CCCCCC"></asp:TextBox>

                                </div>
                            </div>

                        </div>
                        <!--Doğum Tarihi, İletişim Numarası ve Email bilgileri sonu -->


                        <div class="row">
                            <div class="col">
                                <br/>
                            </div>
                        </div>


                        <!--İl, İlçe ve Posta kodu bilgileri -->
                        <div class="row">

                            <div class="col-md-4">
                                <label>İl</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Province" ReadOnly="True" BackColor="#CCCCCC"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>İlçe</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="district" ReadOnly="True" BackColor="#CCCCCC"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Posta Kodu</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Post Code" ReadOnly="True" BackColor="#CCCCCC"></asp:TextBox>

                                </div>
                            </div>

                        </div>
                        <!--İl, İlçe ve Posta kodu bilgileri sonu -->


                        <div class="row">
                            <div class="col">
                                <br/>
                            </div>
                        </div>


                        <!--Tam Posta Adresi Bilgileri -->

                        <div class="row">
                            <div class="col-12">
                                 <label>Tam Posta Adresi</label>
                                      <div class="form-group">
                                          <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Full Postal Address" TextMode="MultiLine" Rows="2" ReadOnly="True" BackColor="#CCCCCC"></asp:TextBox>
                                      </div>
                            </div>
                         </div>

                        <!--Tam Posta Adresi Bilgileri sonu-->


                        <div class="row">
                            <div class="col">
                                <br/>
                            </div>
                        </div>
                        

                        <!--Kullanıcıyı Kalıcı Olarak Sil butonu -->

                        <div class="row">
                            <div class="col-12 mx-auto">
                                <asp:Button ID="Button2" class="btn btn-danger btn-lg col-12" runat="server" Text="Kullanıcıyı Kalıcı Olarak Sil" OnClick="Button2_Click" />
                            </div>
                        </div>

                        <!--Kullanıcıyı Kalıcı Olarak Sil butonu sonu-->


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


                        <!--Üye Listesi yazısı-->
                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4>Üye Listesi</h4>
                                </center>
                            </div>
                        </div>
                        <!--Üye Listesi yazısı sonu-->


                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>


                        <!--Üye Listesi gridview table-->
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryDBConnectionString2 %>" ProviderName="<%$ ConnectionStrings:eLibraryDBConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="ID" ReadOnly="True" SortExpression="member_id"></asp:BoundField>
                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name"></asp:BoundField>
                                        <asp:BoundField DataField="account_status" HeaderText="Account Status" SortExpression="account_status"></asp:BoundField>
                                        <asp:BoundField DataField="contact_no" HeaderText="Contact No" SortExpression="contact_no"></asp:BoundField>
                                        <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email"></asp:BoundField>
                                        <asp:BoundField DataField="province" HeaderText="Province" SortExpression="province"></asp:BoundField>
                                        <asp:BoundField DataField="district" HeaderText="District" SortExpression="district"></asp:BoundField>
                                        </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <!--Üye Listesi gridview table sonu-->

                    </div>
                </div>

            </div>

            <!--sağ kutu içi sonu-->
            


        </div>
   <br /><br /><br /></div>


</asp:Content>
