<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="VK_Ecommerce.Registration.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Online Shopping</title>
    <link rel="icon" type="image/png" href="../Image/favicon.ico"/>
    <link rel="stylesheet" href="Register.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Archivo:wght@400;700&display=swap" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
       <div class="container">
        <div class="title">Sign Up</div>
        <div  class="form" action="#">
            <div class="user-details">
               
                <div class="input-box">
                    <span class="details">Full Name</span>
                   
                    <asp:TextBox ID="txtFullname" class="TextBox" runat="server" placeholder="Enter Full Name" required="required" autocomplete="off"></asp:TextBox>
                </div>

                <div class="input-box">
                    <span class="details">Username</span>
                   
                    <asp:TextBox ID="txtUsername" class="TextBox" runat="server" placeholder="Enter Username" required="required" autocomplete="off"></asp:TextBox>
                </div>
                
                <div class="input-box">
                    <span class="details">Email Address</span>
                    
                    <asp:TextBox ID="txtEmail" class="TextBox" runat="server" placeholder="Enter Email Address" required="required" autocomplete="off"></asp:TextBox>
                </div>

                <div class="input-box">
                    <span class="details">Password</span>
                    
                    <asp:TextBox ID="txtPassword" class="TextBox" type="password" runat="server" placeholder="Enter Password" required="required" autocomplete="off"></asp:TextBox>
                    <i class="bi bi-eye-slash" id="togglePassword"></i>
                </div>

                <div class="input-box">
                    <span class="details">Contact Number</span>
                    
                    <asp:TextBox ID="txtContact" class="TextBox" runat="server" placeholder="Enter Contact Number" required="required" autocomplete="off"></asp:TextBox>
                </div>

                <div class="input-box">
                    <span class="details">Home Address</span>
                    
                    <asp:TextBox ID="txtAddress" class="TextBox" runat="server" placeholder="Enter Home Address" required="required" autocomplete="off"></asp:TextBox>
                   
                </div>

                <div class="input-box">
                    <span class="details">Gender</span>
                     <asp:DropDownList ID="gender" class="input-box" runat="server">
                             <asp:ListItem Value="">Select Option</asp:ListItem>
                             <asp:ListItem Value="Male">Male</asp:ListItem>
                             <asp:ListItem Value="Female">Female</asp:ListItem> 
                             <asp:ListItem Value="Others">Others</asp:ListItem>
                     </asp:DropDownList>
                </div>

                <div class="input-box">
                     <span class="details">User Type</span>    
                        <asp:DropDownList ID="Usertype" class="input-box" runat="server">
                             <asp:ListItem Value="">Select Option</asp:ListItem>
                             <asp:ListItem Value="2">User</asp:ListItem>  
                        </asp:DropDownList>
                </div>
                <div class="input-box">
                    <span  class="details">Upload Image</span>
                          <asp:FileUpload ID="FileUpload" class="input-box" runat="server" />
                          <asp:Label ID="lblMessage" runat="server"></asp:Label>
                          <asp:Image ID="Image1" CssClass="card-img-top" runat="server"  ImageUrl="../UserImage.png" AlternateText="Profile Image" Height="100px" Width="100px" Visible="False"/> 
                </div>
            </div>
            <div class="btn-save">
                <!-- <input type="button" value="Register"> -->
                <asp:Button ID="BtnSave" runat="server" Text="Register" OnClick="BtnSave_Click"/>
            </div>
            <div class="Back">
                <h3>Already have an Account?<a href="HomePage.aspx">Sign In Here</a></h3>
                
            </div>
        </div>
    </div>

  
    </form>
      <script>
          const togglePassword = document.querySelector('#togglePassword');
          const password = document.querySelector('#txtPassword');

          togglePassword.addEventListener('click', function (e) {
              // toggle the type attribute
              const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
              password.setAttribute('type', type);
              // toggle the eye / eye slash icon
              this.classList.toggle('bi-eye');
          });
      </script>
</body>
</html>
