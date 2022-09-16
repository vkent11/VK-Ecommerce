<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="VK_Ecommerce.HomePage.AddCategory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title></title>
    <link rel="stylesheet" href="AddCategory.css"/>
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
          <a href="#" class="active">
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
          <a href="#">
            <i class='bx bx-coin-stack' ></i>
            <span class="links_name">Stock</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class='bx bx-book-alt' ></i>
            <span class="links_name">Total order</span>
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
        <span class="dashboard">Add Category</span>
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
                          <span>Category Name</span>
                         <!-- <asp:DropDownList ID="DdlCategory" runat="server">
                              <asp:ListItem>Men's Shoes</asp:ListItem>
                              <asp:ListItem>Women's Shoes</asp:ListItem>
                              <asp:ListItem>Kids Shoes</asp:ListItem>
                             
                          </asp:DropDownList>-->
                          <asp:TextBox ID="TextBox1" runat="server" required=""></asp:TextBox>
                      </div>
                      <div>
                           <asp:Button ID="BtnAddCategory" CssClass="Product" runat="server" Text="Add Catgeory" OnClick="BtnAddCategory_Click"/>
                      </div>
                  </div>
                  
              </div>

               <div align="center" class="Gridview">
                  <asp:GridView ID="GridView1" runat="server" DataKeyNames="ID" EmptyDataText="No Products in Shopping Cart"  CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" HorizontalAlign="Center" Width="200px" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" >
                      <Columns>
                          <asp:TemplateField HeaderText="Category">
                              <ItemStyle HorizontalAlign="Center" />
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("CategoryName") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="Label1" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:CommandField CausesValidation="False" HeaderText="Options" ShowDeleteButton="True" ShowEditButton="True" />
                      </Columns>

                  </asp:GridView>
              </div>


             

             
          </div>
     </div>
     

       <div class="Buttons">
                 <asp:LinkButton ID="BtnBack2"  class="Btn" runat="server" OnClick="BtnBack2_Click">Back</asp:LinkButton>
                 
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
