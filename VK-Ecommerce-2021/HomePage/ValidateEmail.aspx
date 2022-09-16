<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ValidateEmail.aspx.cs" Inherits="VK_Ecommerce.HomePage.ValidateEmail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Online Shopping</title>
     <link rel="stylesheet" href="ValidateEmail.css"/>
    <link rel="icon" type="image/png" href="../Image/favicon.ico"/>
</head>
<body>
    <form id="form1" runat="server">
     <div class="container">
        <div class="title">Forgot Password</div>
        <div class="sub-title">Validate your Email Address</div>
        <div class="form" action="#">
            <div class="user-details">
                              
                <div class="input-box">
                    <span class="details">Email Address</span>
                    <asp:TextBox ID="txtEmail" type="email" runat="server" placeholder="Enter Email Address" required="required"></asp:TextBox>
                </div>
                <!--<div class="Valid">
                    <asp:Label ID="LblMessage" runat="server"></asp:Label>
                </div>-->
            </div>
            <div class="btn-save">
                <!-- <input type="button" value="Register"> -->
                      
                    <asp:Button ID="BtnContinue" runat="server" Text="Continue"  OnClick="BtnContinue_Click"/>  
               
            </div>
            <div class="Back">
                <h3>Already have an Account?<a href="HomePage.aspx">login Here</a></h3>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
