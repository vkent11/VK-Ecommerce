<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="VK_Ecommerce.HomePage.AddBrand" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Online Shopping</title>
    <link rel="icon" type="image/png" href="../Image/favicon.ico"/>
    <link rel="stylesheet" href="ProductList.css"/>
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
          <a href="OrderList.aspx">
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
        <span class="dashboard">Product List</span>
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
<div class="Category">
     Sort By:
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryName" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AppendDataBoundItems="True">
        <asp:ListItem>Select Category</asp:ListItem>
     </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VkEcommerceConnectionString %>" SelectCommand="SELECT [CategoryName] FROM [Category]"></asp:SqlDataSource>
     <br />
     <br />
     <br />
</div>
 <div class="Buttons" align="right" style="padding: 20px">
      <asp:LinkButton ID="BtnBack"  class="Btn" runat="server" OnClick="BtnBack_Click">Back</asp:LinkButton>
 </div>
<center>
 
 <div class="container">
  <div class="row">
    <div class="col-lg-12 ">
      <div class="table-responsive">
       <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered table-hover mydatagrid"  EmptyDataText="Empty List" AutoGenerateColumns="False"  DataKeyNames="ID" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Height="300px" Width="647px" AllowPaging="True"  HorizontalAlign="Center">
                              <Columns>
                                  <asp:TemplateField HeaderText="ID">
                                       <EditItemTemplate>
                                          <asp:TextBox ID="txtID" runat="server" Text='<%# Eval("ID") %>'></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                          <asp:Label ID="LblID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                      </ItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" />
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Product ID">
                                     
                                      <ItemTemplate>
                                          <asp:Label ID="Label1" runat="server" Text='<%# Eval("Productid") %>'></asp:Label>
                                      </ItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" />
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Product Name">
                                      
                                      <ItemTemplate>
                                          <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                      </ItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" />
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Price">
                                       <EditItemTemplate>
                                          <asp:TextBox ID="txtPrice" runat="server" Text='<%# Eval("Price") %>'></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                          <asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                      </ItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" />
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Details">
                                      
                                      <ItemTemplate>
                                          <asp:Label ID="Label4" runat="server" Text='<%# Eval("Detail") %>'></asp:Label>
                                      </ItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" />
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Material">
                                     
                                      <ItemTemplate>
                                          <asp:Label ID="Label5" runat="server" Text='<%# Eval("Material") %>'></asp:Label>
                                      </ItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" />
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Quantity">
                                      <EditItemTemplate>
                                          <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                          <asp:Label ID="Label6" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                      </ItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" />
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Brand">
                                      
                                      <ItemTemplate>
                                          <asp:Label ID="Label7" runat="server" Text='<%# Eval("Brand") %>'></asp:Label>
                                      </ItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" />
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Category">
                                      
                                      <ItemTemplate>
                                          <asp:Label ID="Label8" runat="server" Text='<%# Eval("Category") %>'></asp:Label>
                                      </ItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" />
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Sub Category">
                                     
                                      <ItemTemplate>
                                          <asp:Label ID="Label9" runat="server" Text='<%# Eval("Sub") %>'></asp:Label>
                                      </ItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" />
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Image">
                                       <EditItemTemplate>
                                            <asp:Image ID="img_user" runat="server" ImageUrl='<%# "~/Uploads/" + Eval("Image") %>'  
                                             Height="80px" Width="100px" /><br />  
                                           <asp:FileUpload ID="FileUpload1" runat="server" />
                                       </EditItemTemplate>
                                       <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/Uploads/" + Eval("Image") %>' Height="100px" Width="100px" />
                                        </ItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" />
                                  </asp:TemplateField>
                                  <asp:CommandField HeaderText="Options" ShowDeleteButton="True" ShowEditButton="True" />
                              </Columns>
                          </asp:GridView>
                   </div>
                  </div>
                </div>
              </div>
          </center> 
      
             

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
