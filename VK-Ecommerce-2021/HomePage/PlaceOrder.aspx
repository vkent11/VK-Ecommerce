<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="VK_Ecommerce.PlaceOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Online Shopping</title>
    <link rel="icon" type="image/png" href="../Image/favicon.ico"/>
    <link href="PlaceOrder.css" rel="stylesheet" />
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'/>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
        <div class="wrapper">
            <h2>Payment Method</h2>
            <div class="form-container">
                <div class="form">
                    <div class="input-name">
                        <i class='bx bx-user'></i>
                        <asp:TextBox ID="TextBox1" runat="server" class="name" required=""  placeholder="Enter Firstname"></asp:TextBox>
                        <span>
                            <i class='bx bx-user'></i>
                        <asp:TextBox ID="TextBox2" runat="server" class="name" required=""  placeholder="Enter Lastname"></asp:TextBox>
                        </span>
                    </div>
                    <div class="input-name">
                        <img src="../Image/discover-credit-card-icon-9.jpg" />
                    </div>
                     <div class="input-name">
                         <h3>Card Number</h3>
                         <i class='bx bx-credit-card' ></i>
                         <asp:TextBox ID="TextBox3" runat="server" class="text-name" required=""  placeholder="Enter Card Number"></asp:TextBox>
                     </div>
                    <div class="input-name">
                        <h3>Expiry Date</h3>
                        <i class='bx bx-time-five' ></i>
                        <asp:TextBox ID="TextBox4" runat="server" class="name" required="" placeholder="MM/YY(Eg:061996)"  ></asp:TextBox>
                        <span>
                            <i class='bx bx-barcode' ></i>
                        <asp:TextBox ID="TextBox5" runat="server" class="name" required=""  placeholder="CCV must be 3 digits"></asp:TextBox>
                        </span>
                    </div>
                     <div class="input-name">
                         <h3>Billing Address</h3>
                         <i class='bx bxs-map' ></i>
                         <asp:TextBox ID="TextBox6" runat="server" class="text-name" required=""  placeholder="Enter Billing Address"></asp:TextBox>
                     </div>
                    <div class="input-name">
                        <asp:Button ID="BtnSubmitOrder" runat="server" Text="Submit" OnClick="BtnSubmitOrder_Click" />
                    </div>
                    <div class="input-name">
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Previous Page</asp:LinkButton>
                        
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
