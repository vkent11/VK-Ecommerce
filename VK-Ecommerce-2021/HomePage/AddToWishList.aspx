<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddToWishList.aspx.cs" Inherits="VK_Ecommerce.HomePage.AddToWishList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Online Shopping</title>
    <link rel="icon" type="image/png" href="../Image/favicon.ico"/>
    <link href="AddToWishList.css" rel="stylesheet" />
     <!-- font awesome/Boxicons cdn link  -->
    <script src="https://kit.fontawesome.com/144ffef8f7.js" crossorigin="anonymous"></script>
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'/>
      <!-- Bootstrap -->
    <link href="bootstrap.cosmo.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="containers">
             <h1 class="navbar-brand"><i class='bx bxl-vk'></i> Online Shoes</h1>
	        
             <h3><asp:LinkButton ID="BtnShopAgain" runat="server"><a href="Product.aspx"><i class='bx bxs-left-arrow-circle'></i>Back to Shopping</a></asp:LinkButton></h3>
        </div>

        <div align="center">
            <h1>My Wish List</h1>
        </div>

        <div align="right" style="margin-right: 20px;">
            <asp:Button ID="BtnClearWish" runat="server" Text="Clear Wish List"  OnClick="BtnClearWish_Click"/>
        </div>

        <div class="container">
             <div class="row">
             <div class="col-lg-12 ">
             <div class="table-responsive">
                  <center>
                      <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting">
                          <Columns>
                              <asp:BoundField DataField="sno" HeaderText="Serial Number">
                              <ItemStyle HorizontalAlign="Center" />
                              </asp:BoundField>
                              <asp:BoundField DataField="productid" HeaderText="Product ID">
                              <ItemStyle HorizontalAlign="Center" />
                              </asp:BoundField>
                             <asp:TemplateField HeaderText="Product Image">
                                   <ItemTemplate>
                                       <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/Uploads/" + Eval("Image") %>' />
                                   </ItemTemplate>
                                   <ControlStyle Height="100px" Width="100px" />
                                   <ItemStyle HorizontalAlign="Center" />
                               </asp:TemplateField>
                              <asp:BoundField DataField="name" HeaderText="Product Name">
                              <ItemStyle HorizontalAlign="Center" />
                              </asp:BoundField>
                              <asp:BoundField DataField="price" HeaderText="Price">
                              <ItemStyle HorizontalAlign="Center" />
                              </asp:BoundField>
                              <asp:CommandField DeleteText="Remove" ShowDeleteButton="True">
                              <ItemStyle ForeColor="#666666" />
                              </asp:CommandField>
                          </Columns>
                      </asp:GridView>





                  </center>
             </div>
             </div>
             </div>
        </div>
    </form>
</body>
</html>
