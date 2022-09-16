<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="VK_Ecommerce.HomePage.AddProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Online Shopping</title>
     <link rel="icon" type="image/png" href="../Image/favicon.ico"/>
     <link rel="stylesheet" href="AddProduct.css"/>
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
          <a href="#" class="active">
            <i class='bx bx-box' ></i>
            <span class="links_name">Product</span>
          </a>
        </li>
        <li>
          <a href="OrderList.aspx">
            <i class='bx bx-list-ul' ></i>
            <span class="links_name">Order list</span>
          </a>
        </li>
       
      
        <li>
          <a href="ReplyMessage.aspx">
            <i class='bx bx-message' ></i>
            <span class="links_name">Messages</span>
          </a>
        </li>

         <li>
          <a href="AdminSettings.aspx">
            <i class='bx bx-cog'></i>
            <span class="links_name">Admin Update</span>
          </a>
        </li>
       
      </ul>
  </div>
  <section class="home-section">
    <nav>
      <div class="sidebar-button">
        <i class='bx bx-menu sidebarBtn'></i>
        <span class="dashboard">Add Products</span>
      </div>
      
      <div class="profile-details">
        <!--<img src="images/profile.jpg" alt="">-->
        <i class='bx bxs-user-detail' ></i>
        <span class="admin_name"><asp:Label ID="LblAdmin" runat="server"></asp:Label></span>
                       
      </div>                              
    </nav>
    

      <div class="main-content">
          <div class="overview-boxes">
              <div class="box">
                  <div class="register-products">
                      <div>
                          <span>Product ID</span>
                          <asp:TextBox ID="txtID" CssClass="Product" runat="server"></asp:TextBox>
                      </div>
                      <div>
                          <span>Product Name</span>
                          <asp:TextBox ID="txtName" CssClass="Product" runat="server"></asp:TextBox>
                      </div>
                      <div>
                          <span>Price</span>
                          <asp:TextBox ID="txtPrice" CssClass="Product"  runat="server"></asp:TextBox>
                      </div>
                                           
                      <div>
                          <span>Product Details</span>
                          <asp:TextBox ID="txtDetails" CssClass="Product"  runat="server"></asp:TextBox>
                      </div>
                      <div>
                          <span>Materials & Care</span>
                          <asp:TextBox ID="txtMaterials" CssClass="Product"  runat="server"></asp:TextBox>
                      </div>
                       <div>
                          <span>Quantity</span>
                          <asp:TextBox ID="txtQuantity" CssClass="Product"  runat="server"></asp:TextBox>
                      </div>
                      <div>
                          <span>Brand</span>
                          <asp:DropDownList ID="DdlBrand" CssClass="Product"  runat="server">
                              <asp:ListItem>Jordan</asp:ListItem>
                              <asp:ListItem>Nike</asp:ListItem>
                              <asp:ListItem>Gibi Shoes</asp:ListItem>
                              <asp:ListItem>Mendrez</asp:ListItem>
                              <asp:ListItem>Parisian</asp:ListItem>
                              <asp:ListItem>World Balance</asp:ListItem>
                              <asp:ListItem>No Brand</asp:ListItem>
                          </asp:DropDownList>
                      </div>
                       <div>
                          <span>Category</span>
                          <asp:DropDownList ID="DdlCategory" CssClass="Product"  runat="server" DataSourceID="SqlDataSource2" DataTextField="CategoryName" DataValueField="CategoryName">
                             
                           </asp:DropDownList>
                          
                      </div>
                       <div>
                          <span>Sub-Category</span>
                          <asp:DropDownList ID="DdlSub" CssClass="Product"  runat="server">
                              <asp:ListItem>Heels and Sandals</asp:ListItem>
                              <asp:ListItem>Running</asp:ListItem>
                              <asp:ListItem>Casual</asp:ListItem>
                              <asp:ListItem>Formal</asp:ListItem>
                              <asp:ListItem>Basketball</asp:ListItem>
                              <asp:ListItem>Boots</asp:ListItem>
                              
                           </asp:DropDownList>
                      </div>
                      <div>
                          <span>Upload Image</span>
                          <asp:FileUpload ID="FileUpload" CssClass="Product" runat="server" />
                          <asp:Label ID="lblMessage" runat="server"></asp:Label>
                      </div>
                     
                       <div>
                           <asp:Button ID="BtnAddProduct" CssClass="Product" runat="server" Text="Add Product"  OnClick="BtnAddProduct_Click"/>
                      </div>
                  </div>
                  
              </div>




              <div class="Buttons">
                 <asp:LinkButton ID="AddBrand"  class="Btn" runat="server" OnClick="AddBrand_Click">Add Brand</asp:LinkButton>
                 
                 <asp:LinkButton ID="ProductList" class="Btn" runat="server"  OnClick="ProductList_Click">Product List</asp:LinkButton>
              </div>

             
          </div>
     </div>
     
      

</section>
        <div>
                  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:VkEcommerceConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
     </div>

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
