<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReplyMessage.aspx.cs" Inherits="VK_Ecommerce.HomePage.ReplyMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Online Shopping</title>
    <link href="Messages.css" rel="stylesheet" />
    <link rel="icon" type="image/png" href="../Image/favicon.ico"/>
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'/>
     <!-- Bootstrap -->
    <link href="bootstrap.cosmo.min.css" rel="stylesheet" />
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
          <a href="AddProduct.aspx">
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
          <a href="Messages.aspx" class="active">
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
        <span class="dashboard">Messages</span>
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
                          <span>ID</span>
                          <asp:TextBox ID="txtID" CssClass="Product" runat="server" ReadOnly="True" Visible="False"></asp:TextBox>
                      </div>
                       <div>
                          <span>Firstname</span>
                          <asp:TextBox ID="txtFirstname" CssClass="Product" runat="server" ReadOnly="True"></asp:TextBox>
                      </div>
                      <div>
                          <span>Lastname</span>
                          <asp:TextBox ID="txtLastname" CssClass="Product" runat="server" ReadOnly="True"></asp:TextBox>
                      </div>
                      <div>
                          <span>Email Address</span>
                          <asp:TextBox ID="txtEmail" CssClass="Product" runat="server" ReadOnly="True"></asp:TextBox>
                      </div>
                      <div>
                          <span>Contact Number</span>
                          <asp:TextBox ID="txtContact" CssClass="Product" runat="server" ReadOnly="True"></asp:TextBox>
                      </div>
                       <div>
                          <span>Username</span>
                          <asp:TextBox ID="txtUsername" CssClass="Product" runat="server" ReadOnly="True"></asp:TextBox>
                      </div>
                      
                     
                     
                       <div>
                           <asp:Button ID="BtnSend" CssClass="Product" runat="server" Text="Send Message" OnClick="BtnSend_Click"/>
                      </div>

                      
                  </div>
                  <div>
                      <h2>Reply Message</h2>
                      <asp:TextBox ID="txtReply"  rows="10" TextMode="Multiline" class = "Product form-control" runat="server"></asp:TextBox>
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
