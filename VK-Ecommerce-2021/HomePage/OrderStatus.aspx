<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderStatus.aspx.cs" Inherits="VK_Ecommerce.HomePage.OrderStatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Online Shoes</title>
    <link rel="icon" type="image/png" href="../Image/favicon.ico"/>
    <link href="OrderStatus.css" rel="stylesheet" />
     <!-- font awesome/Boxicons cdn link  -->
    <script src="https://kit.fontawesome.com/144ffef8f7.js" crossorigin="anonymous"></script>
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'/>
      <!-- Bootstrap -->
    <link href="bootstrap.cosmo.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="containers">
        <h1 class="navbar-brand"><i class='bx bxl-vk'></i> Online Shoes</h1>
	   
        <h3><asp:LinkButton ID="BtnShopAgain" runat="server"><a href="Product.aspx"><i class='bx bxs-left-arrow-circle'></i>Back to Shopping</a></asp:LinkButton></h3>
    </div>

        <div align="center">
            <h1>My Delivery Status</h1>
            <div class="User-details">
                <div class="details">
                     <b>User: </b> <asp:Label ID="LblUser" runat="server" ></asp:Label>
                     <br />
                     <b>Home Address: </b> <asp:Label ID="LblAddress" runat="server" ></asp:Label>
                     <b>Contact No.: </b> <asp:Label ID="LblContact" runat="server" ></asp:Label>
                     <br />
                     <br />
                </div>
                
            </div>
           
        </div>
        <br />
        

        <div style="margin-bottom: 40px;">
             <div class="container">
             <div class="row">
             <div class="col-lg-12 ">
             <div class="table-responsive">
                     <center>
                     <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered table-hover" OnRowDataBound="GridView1_RowDataBound" DataKeyNames="ID" OnRowDeleting="GridView1_RowDeleting">
                         <Columns>

                              <asp:CommandField DeleteText="Cancel Order" ShowDeleteButton="True">
                              <ItemStyle HorizontalAlign="Center" Width="200px" />
                              </asp:CommandField>

                             

                             
                         </Columns>
                         </asp:GridView>
                     </center>
             </div>
             </div>
             </div>
             </div>
        </div>
    </form>
</body>
</html>
