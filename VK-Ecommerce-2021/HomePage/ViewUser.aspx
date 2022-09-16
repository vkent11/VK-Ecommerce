<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewUser.aspx.cs" Inherits="VK_Ecommerce.HomePage.ViewUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Online Shopping</title>
    <link rel="icon" type="image/png" href="../Image/favicon.ico"/>
    
    <link href="ViewUser.css" rel="stylesheet" />
     <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
      <!-- font awesome/Boxicons cdn link  -->
    <script src="https://kit.fontawesome.com/144ffef8f7.js" crossorigin="anonymous"></script>
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'/>
    <!-- AOS Link -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="containers">
            <h1 class="navbar-brand"><i class='bx bxl-vk'></i> Online Shoes</h1>
	   
            <h3><asp:LinkButton ID="BtnShopAgain" runat="server"><a href="Product.aspx"><i class='bx bxs-left-arrow-circle'></i>Back to Shopping</a></asp:LinkButton></h3>
        </div>
        <div class="Profile-Image" align="right">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  
                                    BackColor="#CC3300" ForeColor="Black" ShowHeader="False" >  
                                    <Columns>  
                                   <asp:TemplateField>  
                                    <ItemTemplate>  
                                    <asp:Image ID="Image1" CssClass="card-img-top" runat="server" ImageUrl='<%# "~/Uploads/" + Eval("Image") %>' AlternateText="Profile Image" Height="100px" Width="100px"/> 
                                    </ItemTemplate>  
                                    </asp:TemplateField>  
                                    </Columns>  
                              </asp:GridView>  
            
       </div>
        <div align="left">
            <asp:Button ID="BtnUpdateUser" runat="server" Text="Update User"  OnClick="BtnUpdateUser_Click" />
        </div>
        <div class="container-content" align="center">
                         <div class="content" align="center">
                               <%--<asp:Image ID="Image1" CssClass="card-img-top" runat="server" ImageUrl='<%# "~/Uploads/" + Eval("Image") %>' AlternateText="Profile Image" Height="400px" Width="600px"/>--%>
                               <span class="Labels">Fullname:</span>
                               <asp:Label ID="Label1" runat="server" class="LB" Text="Label"></asp:Label>  
                             
                               <span class="Labels">Username:</span>
                              <asp:Label ID="Label2" runat="server" class="LB" Text="Label"></asp:Label>
                              
                               <span class="Labels">Password:</span>
                               <asp:Label ID="Label3" runat="server" class="LB" Text="Label"></asp:Label>
                              
                               <span class="Labels">Contact:</span>
                               <asp:Label ID="Label4" runat="server" class="LB" Text="Label"></asp:Label>
                              

                               <span class="Labels">Email Address:</span>
                               <asp:Label ID="Label6" runat="server" class="LB" Text="Label"></asp:Label>
                              
                               <span class="Labels">Gender:</span>
                               <asp:Label ID="Label7" runat="server" class="LB" Text="Label"></asp:Label>
                              
                              <span class="Labels">Home Address</span>
                               <asp:Label ID="Label5" runat="server" class="LB" Text="Label"></asp:Label>
                               
                           </div>
                        
         </div>
       
        
    </form>
</body>
</html>
