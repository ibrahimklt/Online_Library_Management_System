<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewbooks.aspx.cs" Inherits="Fınal_OLMS.viewbooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
            $(document).ready(function () {
                $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            });
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
            <div class="row">


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
                    
                
                <center>
                    <a href="homepage.aspx">
                        << Ana sayfaya geridön</a><span class="clearfix"></span>
                            <br />
                            <center>
    
<br /><br /><br /><br /><br /><br /><br /><br /><br />


</asp:Content>
