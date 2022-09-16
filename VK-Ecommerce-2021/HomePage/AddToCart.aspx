<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddToCart.aspx.cs" Inherits="VK_Ecommerce.HomePage.AddToCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Online Shopping</title>
    <link rel="icon" type="image/png" href="../Image/favicon.ico"/>
    <link rel="stylesheet" href="AddToCart.css"/>
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

<center>
     <h1 class="Shopping"><i class='bx bx-cart'></i>Shopping Cart</h1>
</center>
<center>
   <div class="User">
       <h1>Delivery Address</h1>
       <span>User:
           <asp:Label ID="LblUser" runat="server" Text=""></asp:Label>
       </span>
       <span>Contact No.:
           <asp:Label ID="LblContact" runat="server" Text=""></asp:Label>
       </span>
       <span>Home Address:
           <asp:Label ID="LblAddress" runat="server" Text=""></asp:Label>
       </span>
       <span>Email Address:
           <asp:Label ID="LblEmail" runat="server" Text=""></asp:Label>
       </span> 
   </div>
    <div>
        <h3>Payment Method</h3>
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>Cash on Delivery</asp:ListItem>
            <asp:ListItem>G-cash</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div>
        <asp:RadioButton ID="RadioButton1" runat="server" Text="Debit/Credit Card"/>
    </div>
    <div>
        <asp:LinkButton ID="BtnClearCart" runat="server" OnClick="BtnClearCart_Click">Clear Cart</asp:LinkButton>
    </div>
 </center>
 <center>
   <div class="container">
    <div class="row">
      <div class="col-lg-12 ">
        <div class="table-responsive">
      
        <asp:GridView ID="GridView1" runat="server"   CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" EmptyDataText="No Products in Shopping Cart" Height="250px" Width="1100px" OnRowDeleting="GridView1_RowDeleting" ShowFooter="True" HorizontalAlign="Center" CellPadding="2" GridLines="None" style="text-align:center;">
            <Columns>
                <asp:BoundField DataField="sno" HeaderText="Serial Number"></asp:BoundField>
                <asp:BoundField DataField="Productid" HeaderText="Product ID">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="Product Name">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Product Image">
                   
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/Uploads/" + Eval("Image") %>' />
                    </ItemTemplate>
                    <ControlStyle Height="100px" Width="100px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="Size" HeaderText="Size">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Brand" HeaderText="Brand">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Price" HeaderText="Price" >
                <ItemStyle HorizontalAlign="Center" Font-Names="₱" />
                </asp:BoundField>
                <asp:BoundField DataField="quantity" HeaderText="Quantity">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="totalPrice" HeaderText="Total Price">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:CommandField DeleteText="Remove Item" ShowDeleteButton="True" >
                    <ItemStyle ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:CommandField>
            </Columns>
            <HeaderStyle BackColor="Silver" />
        </asp:GridView>
        <div style="margin-bottom: 30px;">
            <asp:Button ID="BtnPlaceOrder" runat="server" Text="Check Out" OnClick="BtnPlaceOrder_Click"/>
        </div>
        
       </div>
      </div>
    </div>
  </div>
     </center>
        
   
   
    
        















    </form>

    <script>
      
        let menu = document.querySelector('#menu-bar');
        let navbar = document.querySelector('.nav-bar ');

        // for the behavior of the page// toggles 
        menu.addEventListener('click', () => {
            menu.classList.toggle('fa-times');
            navbar.classList.toggle('actives1');
        });

        
        // Smooth Scroll
        Array.from(scrollLink).map(link => {
            link.addEventListener("click", e => {
                // Prevent Default
                e.preventDefault();

                const id = e.currentTarget.getAttribute("href").slice(1);
                const element = document.getElementById(id);
                const navHeight = navBar.getBoundingClientRect().height;
                const fixNav = navBar.classList.contains("fix__nav");
                let position = element.offsetTop - navHeight;

                if (!fixNav) {
                    position = position - navHeight;
                }

                window.scrollTo({
                    left: 0,
                    top: position,
                });
                navContainer.style.left = "-30rem";
                document.body.classList.remove("active");
            });
        });
    </script>
</body>
</html>
