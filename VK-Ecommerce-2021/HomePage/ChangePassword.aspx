<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="VK_Ecommerce.HomePage.ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Online Shopping</title>
    <link rel="stylesheet" href="ChangePassword.css"/>
     <link rel="icon" type="image/png" href="../Image/favicon.ico"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
    
    
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
        <div class="title">Change Password</div>
        <div class="form" action="#">
            <div class="user-details">

                 <div class="input-box">
                    <span class="details">Email Address</span>
                    <asp:Label ID="lblUser" runat="server"></asp:Label>
                     
                </div>
                              
                <div class="input-box">
                    <span class="details">Enter New Password</span>
                    <asp:TextBox ID="txtPass" type="password" class="TextBox" runat="server" placeholder="Enter Password" required="required"></asp:TextBox>
                    <!--<i id="togglePassword" class="fa fa-eye">Show/Hide Password</i>-->
                     <i class="bi bi-eye-slash" id="togglePassword"></i>
                    
                </div>

                <div class="input-box">
                    <span class="details">Confirm Password</span>
                    <asp:TextBox ID="txtConfirm" type="password"  class="TextBox" runat="server" placeholder="Confirm Password" required="required"></asp:TextBox>
                    <!--<i id="togglePassword1" class="fa fa-eye">Show/Hide Password</i>-->
                     <i class="bi bi-eye-slash" id="togglePassword1"></i>
                     
                </div>

                <asp:CompareValidator ID="CompareValidator2" runat="server"   
                    ControlToCompare="txtPass" ControlToValidate="txtConfirm"   
                    ErrorMessage="Password Mismatch"></asp:CompareValidator>    
                <asp:Label ID="lbl_msg" runat="server" Text=""></asp:Label>
                 
            </div>
            <div class="btn-save">
                <!-- <input type="button" value="Register"> -->
                <a href="#">  
                    <asp:Button ID="BtnSave" runat="server" Text="Save"  OnClick="BtnSave_Click"/>  
                </a>
            </div>
            <div class="Back">
                <!--<h3>Already have an Account?<a href="HomePage.aspx">Sign In Here</a></h3>-->
                <asp:LinkButton ID="SignOut" runat="server" OnClick="SignOut_Click">Sign Out</asp:LinkButton>
            </div>
        </div>
    </div>
    </form>


    
     <script>
         const togglePassword = document.querySelector('#togglePassword');
         const toggleConfirmPassword = document.querySelector('#togglePassword1');
         const password = document.querySelector('#txtPass');
         const ConfirmPassword = document.querySelector('#txtConfirm');

         togglePassword.addEventListener('click', function (e) {
             // toggle the type attribute
             const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
             password.setAttribute('type', type);
             // toggle the eye / eye slash icon
             this.classList.toggle('bi-eye');
         });

         toggleConfirmPassword.addEventListener('click', function (e) {
             // toggle the type attribute
             const type = ConfirmPassword.getAttribute('type') === 'password' ? 'text' : 'password';
             ConfirmPassword.setAttribute('type', type);
             // toggle the eye / eye slash icon
             this.classList.toggle('bi-eye');
         });
     </script>

</body>
</html>
