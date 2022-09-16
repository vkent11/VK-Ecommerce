<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateUser.aspx.cs" Inherits="VK_Ecommerce.HomePage.UpdateUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Online Shopping</title>
    <link rel="icon" type="image/png" href="../Image/favicon.ico"/>
    <link href="UpdateUser.css" rel="stylesheet" />
    
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
        <div id="login" class="login-form-container" align="center">
                             <div class="Info-conatiner">
                                 <span>Fullname</span>
                                 <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                 <span>Username</span>
                                 <asp:TextBox ID="TextBox7" runat="server" ReadOnly="true"></asp:TextBox>
                                 <span>Password</span>
                                 <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                 <span>Contact</span>
                                 <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                 <span>Home</span>
                                 <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                 <span>Email Address</span>
                                 <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                                 <span>Gender</span>
                                 <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                                 
                                 <asp:FileUpload ID="FileUpload1" runat="server" />
                                 <asp:Image ID="Image1" CssClass="card-img-top" runat="server"  ImageUrl="../UserImage.png" AlternateText="Profile Image" Height="100px" Width="100px" Visible="False"/> 
                                 
                             </div>
                     <asp:Button ID="BtnUpdate" runat="server" Text="Update"  OnClick="BtnUpdate_Click"/>            
         </div>
                     
       

        
    </form>
</body>
</html>
