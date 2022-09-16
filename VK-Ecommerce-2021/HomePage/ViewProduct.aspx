<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewProduct.aspx.cs" Inherits="VK_Ecommerce.HomePage.ViewProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Online Shopping</title>
    <link rel="icon" type="image/png" href="../Image/favicon.ico"/>
    <link href="ViewProduct.css" rel="stylesheet" />
     <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
      <!-- font awesome/Boxicons cdn link  -->
    <script src="https://kit.fontawesome.com/144ffef8f7.js" crossorigin="anonymous"></script>
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'/>
    <!-- AOS Link -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
         <div class="containers">
            <h1 class="navbar-brand"><i class='bx bxl-vk'></i> Online Shoes</h1>
	   
            <h3><asp:LinkButton ID="BtnShopAgain" runat="server"><a href="Product.aspx"><i class='bx bxs-left-arrow-circle'></i>Back to Shopping</a></asp:LinkButton></h3>
        </div>
        <div align="center">
            <asp:DataList ID="DataList1" runat="server" DataKeyField="ID" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-12-lg mt-2">
                        <div class="Wrapper">
                            <div class="card" style="width:70rem;display:grid;grid-template-columns:repeat(2, 1fr);">
                                <asp:Image ID="Image1" CssClass="card-img-top" runat="server" ImageUrl='<%# "~/Uploads/" + Eval("Image") %>' AlternateText="Product Image" Height="400px" Width="600px"/>
                                <div class="card-body bg-dark">
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("Productid") %>' Font-Bold="True" Font-Size="X-Large" Font-Strikeout="False" ForeColor="#333333" style="text-transform:capitalize; font-family:'Bebas Neue', cursive; letter-spacing:2px" Visible="False"></asp:Label>
                                    <h3 class="card-title text-white"><%# Eval("Name") %></h3>
                                    <h4 class="card-title text-white">Price: ₱<%# Eval("Price") %></h4>
                                    <p class="card-text text-white">Product Detail: <br /><%# Eval("Detail") %></p>
                                    <h4 class="card-title text-white">Material: <%# Eval("Material") %></h4>
                                    <h4 class="card-title text-white">Brand: <%# Eval("Brand") %></h4>
                                    <h4 class="card-title text-white">Category: <%# Eval("Category") %></h4>
                                    <h4 class="card-title text-white">Sub-Category: <%# Eval("Sub") %></h4>
                                    <p class="card-text text-white">
                                        Size
                                       <asp:DropDownList ID="DropDownList2" runat="server">
                                         <asp:ListItem>5</asp:ListItem>
                                         <asp:ListItem>5&#39;1/2</asp:ListItem>
                                         <asp:ListItem>6</asp:ListItem>
                                         <asp:ListItem>6&#39;1/2</asp:ListItem>
                                         <asp:ListItem>7</asp:ListItem>
                                         <asp:ListItem>7&#39;1/2</asp:ListItem>
                                         <asp:ListItem>8</asp:ListItem>
                                         <asp:ListItem>8&#39;1/2</asp:ListItem>
                                         <asp:ListItem>9</asp:ListItem>
                                         <asp:ListItem>9&#39;1/2</asp:ListItem>
                                         <asp:ListItem>10</asp:ListItem>
                                         <asp:ListItem>10&#39;1/2</asp:ListItem>
                                         <asp:ListItem>11</asp:ListItem>
                                         <asp:ListItem>11&#39;1/2</asp:ListItem>
                                         <asp:ListItem>12</asp:ListItem>
                                       </asp:DropDownList>
                                    </p>
                                    <p class="card-text text-white">
                                     Quantity
                                     <asp:DropDownList ID="DropDownList1" runat="server">
                                     <asp:ListItem>1</asp:ListItem>
                                     <asp:ListItem>2</asp:ListItem>
                                     <asp:ListItem>3</asp:ListItem>
                                     <asp:ListItem>4</asp:ListItem>
                                     <asp:ListItem>5</asp:ListItem> 
                                   </asp:DropDownList>
                                    </p>
                                    <asp:LinkButton ID="BtnCartAdd" CssClass="btn btn-primary" runat="server" CommandArgument='<%# Eval("Productid") %>' CommandName="AddToCart">Add To Cart</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VkEcommerceConnectionString %>" SelectCommand="SELECT [ID], [Productid], [Name], [Price], [Detail], [Material], [Brand], [Category], [Sub], [Image] FROM [product] WHERE ([Productid] = @Productid)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="Productid" QueryStringField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>


         
    </form>

    <!-- Aos JS Link -->
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script> 
</body>
</html>
