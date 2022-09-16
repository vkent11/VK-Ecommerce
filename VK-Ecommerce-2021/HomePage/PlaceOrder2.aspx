<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlaceOrder2.aspx.cs" Inherits="VK_Ecommerce.HomePage.PlaceOrder2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title></title>
     <!-- font awesome/Boxicons cdn link  -->
    <script src="https://kit.fontawesome.com/144ffef8f7.js" crossorigin="anonymous"></script>
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'/>
      <!-- Bootstrap -->
    <link href="bootstrap.cosmo.min.css" rel="stylesheet" />
    <link href="PlaceOrder2.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="containers">
        <h1 class="navbar-brand"><i class='bx bxl-vk'></i> Online Shoes</h1>
	   
        <h3><asp:LinkButton ID="BtnShopAgain" runat="server"><a href="Product.aspx"><i class='bx bxs-left-arrow-circle'></i>Back to Shopping</a></asp:LinkButton></h3>
    </div>
    <div>
        <h3>Check Out</h3>
    </div>

    <table>
        <tr>
            <td>
                <asp:Label ID="LblUser" runat="server" Text="Label"></asp:Label>
            </td>
             <td>
                <asp:Label ID="LblContact" runat="server" Text="Label"></asp:Label>
            </td>
             <td>
                <asp:Label ID="LblAddress" runat="server" Text="Label"></asp:Label>
            </td>
             <td>
                <asp:Label ID="LblEmail" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
       
    </table>

    <div>
        <asp:Button ID="BtnPlaceOrders" runat="server" Text="Place Order"  OnClick="BtnPlaceOrders_Click"/>
    </div>
    </form>
</body>
</html>
