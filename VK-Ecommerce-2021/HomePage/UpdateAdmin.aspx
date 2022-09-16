<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateAdmin.aspx.cs" Inherits="VK_Ecommerce.HomePage.UpdateAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Online Shopping</title>
    <link rel="icon" type="image/png" href="../Image/favicon.ico"/>
     <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'/>
       <!-- Bootstrap -->
    <link href="bootstrap.cosmo.min.css" rel="stylesheet" />
      <!-- font awesome/Boxicons cdn link  -->
    <script src="https://kit.fontawesome.com/144ffef8f7.js" crossorigin="anonymous"></script>
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'/>
    <link href="UpdateAdmin.css" rel="stylesheet" />
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
          <a href="#">
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
          <a href="#" class="active">
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
        <span class="dashboard">Admin Profile</span>
      </div>
      
      <div class="profile-details">
        <!--<img src="images/profile.jpg" alt="">-->
        <i class='bx bxs-user-detail' ></i>
        <span class="admin_name"><asp:Label ID="LblAdmin" runat="server"></asp:Label></span>
                       
      </div>                              
    </nav>
       <br />
     <br />
     <br />
      <br />
      <div id="login" class="login-form-container" >
                             <div class="Info-conatiner">
                                 <span>Fullname</span>
                                 <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                 <span>Username</span>
                                 <asp:TextBox ID="TextBox7" runat="server" ReadOnly="true"></asp:TextBox>
                                 <span>Password</span>
                                 <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                 <span>Contact</span>
                                 <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                 <span>Home Address</span>
                                 <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                 <span>Email Address</span>
                                 <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                                
                                 
                                 
                                 
                             </div>
                <asp:Button ID="BtnAdminUpdate" runat="server" Text="Update"  OnClick="BtnAdminUpdate_Click"/>      
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
