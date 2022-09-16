<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Messages.aspx.cs" Inherits="VK_Ecommerce.HomePage.Messages" %>

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
          <a href="#" >
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
     <br />   
     <br />
     <br />
     <br />  
   <div class="container" align="center" style="height: auto">
    <div class="row">
      <div class="col-lg-12 ">
        <div class="table-responsive">

            <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-hover" runat="server" AllowPaging="True" CellSpacing="2" PageSize="5" DataKeyNames="ID" AutoGenerateColumns="False">
                 <Columns>
                     <asp:TemplateField HeaderText="ID" Visible="False">
                       <ItemTemplate>
                           <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>

                      <asp:TemplateField HeaderText="Reply">
                       <ItemTemplate>
                           <asp:Button ID="BtnReply" runat="server" Text="Reply"  OnClick="BtnReply_Click"/>
                       </ItemTemplate>
                   </asp:TemplateField>

                   <asp:TemplateField HeaderText="Firstname" >
                       <ItemTemplate>
                           <asp:Label ID="Label2" runat="server" Text='<%# Eval("Firstname") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>

                     <asp:TemplateField HeaderText="Lastname" >
                       <ItemTemplate>
                           <asp:Label ID="Label3" runat="server" Text='<%# Eval("Lastname") %>' ></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>

                     <asp:TemplateField HeaderText="Email Address" >
                       <ItemTemplate>
                           <asp:Label ID="Label4" runat="server" Text='<%# Eval("Email") %>' ></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>

                     <asp:TemplateField HeaderText="Contact No." >
                       <ItemTemplate>
                           <asp:Label ID="Label5" runat="server" Text='<%# Eval("Phone") %>' ></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>

                     <asp:TemplateField HeaderText="Message" >
                       <ItemTemplate>
                           <asp:Label ID="Label6" runat="server" Text='<%# Eval("Message") %>' ></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>

                     <asp:TemplateField HeaderText="Username">
                       <ItemTemplate>
                           <asp:Label ID="Label7" runat="server" Text='<%# Eval("Username") %>' ></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                 </Columns>
            </asp:GridView>

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
