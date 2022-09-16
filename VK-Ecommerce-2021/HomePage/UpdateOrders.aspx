<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateOrders.aspx.cs" Inherits="VK_Ecommerce.HomePage.UpdateOrders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Online Shopping</title>
    <link rel="icon" type="image/png" href="../Image/favicon.ico"/>
    <link href="UpdateOrders.css" rel="stylesheet" />
     <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'/>
       <!-- Bootstrap -->
    <link href="bootstrap.cosmo.min.css" rel="stylesheet" />
      <!-- font awesome/Boxicons cdn link  -->
    <script src="https://kit.fontawesome.com/144ffef8f7.js" crossorigin="anonymous"></script>
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar">
    <div class="logo-details">
     <i class='bx bxl-vk'></i>
      <span class="logo_name">Online Shoes</span>
    </div>
      <ul class="nav-links">
        <li>
          <a href="AdminPage.aspx" >
            <i class='bx bx-grid-alt' ></i>
            <span class="links_name">Dashboard</span>
          </a>
        </li>
        <li>
          <a href="ProductList.aspx" >
            <i class='bx bx-box' ></i>
            <span class="links_name">Product</span>
          </a>
        </li>
        <li>
          <a href="#" class="active">
            <i class='bx bx-list-ul' ></i>
            <span class="links_name">Order list</span>
          </a>
        </li>
       
        
        <li>
          <a href="#">
            <i class='bx bx-message' ></i>
            <span class="links_name">Messages</span>
          </a>
        </li>
       
      </ul>
  </div>
  <section class="home-section">
    <nav>
      <div class="sidebar-button">
        <i class='bx bx-menu sidebarBtn'></i>
        <span class="dashboard">Order Status Update</span>
      </div>
      
      <div class="profile-details">
        <!--<img src="images/profile.jpg" alt="">-->
        <i class='bx bxs-user-detail' ></i>
        <span class="admin_name"><asp:Label ID="LblAdmin" runat="server"></asp:Label></span>
                       
      </div>                              
    </nav>

     <br />
     <br />
    

       <div class="main-content">
          <div class="overview-boxes">
              <div class="box">
                  <div class="register-products">

                       <div>
                          <span>Order ID</span>
                          <asp:TextBox ID="txtOrderID" CssClass="Product" runat="server" ReadOnly="True"></asp:TextBox>
                      </div>
                      <div>
                          <span>Serianl No.</span>
                          <asp:TextBox ID="txtSno" CssClass="Product" runat="server" ReadOnly="True"></asp:TextBox>
                      </div>
                      <div>
                          <span>Product ID</span>
                          <asp:TextBox ID="txtID" CssClass="Product" runat="server" ReadOnly="True"></asp:TextBox>
                      </div>
                      <div>
                          <span>Product Name</span>
                          <asp:TextBox ID="txtName" CssClass="Product" runat="server" ReadOnly="True"></asp:TextBox>
                      </div>
                       <div>
                          <span>Brand</span>
                          <asp:TextBox ID="txtBrand" CssClass="Product" runat="server" ReadOnly="True"></asp:TextBox>
                      </div>
                       <div>
                          <span>Size</span>
                          <asp:TextBox ID="txtSize" CssClass="Product" runat="server" ReadOnly="True"></asp:TextBox>
                      </div>
                      <div>
                          <span>Price</span>
                          <asp:TextBox ID="txtPrice" CssClass="Product"  runat="server" ReadOnly="True"></asp:TextBox>
                      </div>
                                                             
                       <div>
                          <span>Quantity</span>
                          <asp:TextBox ID="txtQuantity" CssClass="Product"  runat="server" ReadOnly="True"></asp:TextBox>
                      </div>
                      <div>
                          <span>Order Date</span>
                          <asp:TextBox ID="txtOrderDate" CssClass="Product"  runat="server" ReadOnly="True"></asp:TextBox>
                      </div>
                      <div>
                          <span>Payment</span>
                          <asp:TextBox ID="txtPayment" CssClass="Product"  runat="server" ReadOnly="True"></asp:TextBox>
                      </div>
                      <div>
                          <span>Status</span>
                          <asp:DropDownList ID="DDLStatus" CssClass="Product"  runat="server">
                              <asp:ListItem>Select Status</asp:ListItem>
                              <asp:ListItem>Delivering</asp:ListItem>
                              <asp:ListItem>Completed</asp:ListItem>
                          </asp:DropDownList>
                      </div>
                      
                        <div>
                          <span>User</span>
                          <asp:TextBox ID="txtEmail" CssClass="Product"  runat="server" ReadOnly="True"></asp:TextBox>
                      </div>
                     
                     
                       <div>
                           <asp:Button ID="BtnUpdate" CssClass="Product" runat="server" Text="Update Order"  OnClick="BtnUpdate_Click"/>
                      </div>
                  </div>
                  
              </div>
              </div>
           </div>

    </section>
    </form>


      <script>
   let sidebar = document.querySelector(".sidebar");
let sidebarBtn = document.querySelector(".sidebarBtn");
sidebarBtn.onclick = function() {
  sidebar.classList.toggle("active");
  if(sidebar.classList.contains("active")){
  sidebarBtn.classList.replace("bx-menu" ,"bx-menu-alt-right");
}else
  sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
}
      </script>
</body>
</html>
