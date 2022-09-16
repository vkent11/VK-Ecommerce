<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="VK_Ecommerce.HomePage.OrderList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Online Shopping</title>
    <link rel="icon" type="image/png" href="../Image/favicon.ico"/>
    <link href="OrderList.css" rel="stylesheet" />
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
          <a href="AddProduct.aspx" >
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
        <span class="dashboard">Order List</span>
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
 <div class="containers" align="center" style="height: auto">
    <div align="right">
        <asp:Button ID="BtnOrderList" runat="server" Text="Refresh List" OnClick="BtnOrderList_Click" />
        
    </div>
     <div align="left">
         <asp:Label ID="LblTotalOrders" runat="server" Text="Label"></asp:Label>
     </div>
        
     

    <div>
        <b>Search Date: </b>
        <asp:TextBox ID="TextBox1" runat="server" placeholder="dd/mm/yy" ></asp:TextBox>
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Select Date</asp:LinkButton>
        <br /><br />
        <b><asp:Label ID="LblYear" runat="server" Text="Year: "></asp:Label></b>
        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
        &nbsp;&nbsp;
        <b><asp:Label ID="LblMonth" runat="server" Text="Month: "></asp:Label></b>
        <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
        <br /><br />
        <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
            <TodayDayStyle BackColor="#CCCCCC" />
        </asp:Calendar>
        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Search</asp:LinkButton>
        <br /><br />
  <div class="container">
    <div class="row">
      <div class="col-lg-12 ">
        <div class="table-responsive">
        <asp:GridView ID="GridView1" runat="server"  CssClass="table table-striped table-bordered table-hover"  Height="300px" Width="800px" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" CellSpacing="2" PageSize="5" DataKeyNames="ID" AutoGenerateColumns="False" OnDataBound="GridView1_DataBound" >
            <Columns>
                    <asp:TemplateField HeaderText="ID" Visible="False">
                       <ItemTemplate>
                           <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>

                 <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnUpdate" Text="Update Status" runat="server"  OnClick="btnUpdate_Click"/>
                            
                        </ItemTemplate>
                   </asp:TemplateField>

                 <asp:TemplateField HeaderText="Order ID">
                       <ItemTemplate>
                           <asp:Label ID="Label2" runat="server" Text='<%# Eval("orderid") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>

                 <asp:TemplateField HeaderText="Serial No.">
                       <ItemTemplate>
                           <asp:Label ID="Label3" runat="server" Text='<%# Eval("sno") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>

                 <asp:TemplateField HeaderText="Product ID">
                       <ItemTemplate>
                           <asp:Label ID="Label4" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label>
                       </ItemTemplate>
                  </asp:TemplateField>

                 <asp:TemplateField HeaderText="Product Name">
                       <ItemTemplate>
                           <asp:Label ID="Label5" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                       </ItemTemplate>
                  </asp:TemplateField>

                 <asp:TemplateField HeaderText="Brand">
                       <ItemTemplate>
                           <asp:Label ID="Label6" runat="server" Text='<%# Eval("Brand") %>'></asp:Label>
                       </ItemTemplate>
                  </asp:TemplateField>

                 <asp:TemplateField HeaderText="Size">
                       <ItemTemplate>
                           <asp:Label ID="Label7" runat="server" Text='<%# Eval("Size") %>'></asp:Label>
                       </ItemTemplate>
                  </asp:TemplateField>

                 <asp:TemplateField HeaderText="Price">
                       <ItemTemplate>
                           <asp:Label ID="Label8" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                       </ItemTemplate>
                  </asp:TemplateField>

                 <asp:TemplateField HeaderText="Quantity">
                       <ItemTemplate>
                           <asp:Label ID="Label9" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                       </ItemTemplate>
                  </asp:TemplateField>

                 <asp:TemplateField HeaderText="Orderdate">
                       <ItemTemplate>
                           <asp:Label ID="Label10" runat="server" Text='<%# Eval("Orderdate") %>'></asp:Label>
                       </ItemTemplate>
                  </asp:TemplateField>

                 <asp:TemplateField HeaderText="Payment">
                       <ItemTemplate>
                           <asp:Label ID="Label11" runat="server" Text='<%# Eval("Payment") %>'></asp:Label>
                       </ItemTemplate>
                  </asp:TemplateField>

                 <asp:TemplateField HeaderText="Status">
                       <ItemTemplate>
                           <asp:Label ID="Label12" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                       </ItemTemplate>
                  </asp:TemplateField>

               

                 <asp:TemplateField HeaderText="User">
                       <ItemTemplate>
                           <asp:Label ID="Label13" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                       </ItemTemplate>
                  </asp:TemplateField>
            </Columns>
            <PagerSettings PageButtonCount="4" />
        </asp:GridView>
    </div>
     </div>
       </div>
        </div>
        <br />
       

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
