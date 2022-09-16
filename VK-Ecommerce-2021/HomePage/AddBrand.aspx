<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBrand.aspx.cs" Inherits="VK_Ecommerce.HomePage.AddBrand1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="AddBrand.css" rel="stylesheet" />
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
          <a href="AddProduct.aspx" class="active">
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
          <a href="ReplyMessages.aspx">
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
        <span class="dashboard">Add Brand</span>
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
                          <span>Brand Name</span>
                          <asp:TextBox ID="txtBrand" runat="server"></asp:TextBox>

                      </div>
                      <div>
                           <asp:Button ID="BtnAddBrand" CssClass="Product" runat="server" Text="Add Brand" OnClick="BtnAddBrand_Click"/>
                      </div>
                  </div>
                  
              </div>




              <div class="Buttons">
                 <asp:LinkButton ID="BtnBack"  class="Btn" runat="server" OnClick="BtnBack_Click">Back</asp:LinkButton>
                 
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
