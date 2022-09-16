<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pdf_File.aspx.cs" Inherits="VK_Ecommerce.HomePage.Pdf_File" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Online Shopping</title>
    <link rel="icon" type="image/png" href="../Image/favicon.ico"/>
      <!-- Bootstrap -->
    <link href="bootstrap.cosmo.min.css" rel="stylesheet" />
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'/>
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap');
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            outline: none;
        }

        *::selection {
            color: var(--orange);
            background-color: #fff;
        }
        .auto-style1 {
            width: 923px
        }
        .auto-style2 {
            width: 1056px
        }
        .containers .navbar-brand{
            font-size: 2.8rem;
            letter-spacing: 3px;
            font-weight: 700;
            text-decoration: none;
            color: #000;
            font-family: 'Bebas Neue', cursive;
            padding-left: 90px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
   <div class="containers">
        <h1 class="navbar-brand"><i class='bx bxl-vk'></i> Online Shoes</h1>
    </div>
        <asp:Panel ID="Panel1" runat="server">
           
                <table style="width: 100%;">
                    <tr>
                        <td style="text-align:center; font-family: 'Bebas Neue', cursive;font-size: 2.8rem;letter-spacing: 3px;font-weight: 700;">
                            <h2>Retail Invoice</h2>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Username: 
                            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="margin-left:30px;">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Order Date:
                            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        </td>
                        
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td style="margin-left:30px;" class="auto-style2">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Buyer Address:
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    
                                    <td style="margin-left:30px;" class="auto-style1">
                                        Seller Address:
                                         <br />
                                        WestPlains Subd. Blk 20 Lot 24,Trece Martires City, Cavite
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div class="container">
                             <div class="row">
                               <div class="col-lg-12 ">
                                 <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" Width="1000px">

                                <Columns>
                                    <asp:BoundField DataField="sno" HeaderText="Sno">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="productid" HeaderText="Product ID">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="productname" HeaderText="Product Name">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="brand" HeaderText="Brand">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="size" HeaderText="Size">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="price" HeaderText="Price">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="quantity" HeaderText="Quantity">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="totalprice" HeaderText="Total Price">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                </Columns>

                                <HeaderStyle BackColor="Silver" />

                            </asp:GridView>
                            </div>
                           </div>
                          </div>
                        </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:center">
                            Total Amount:
                            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                            <br />
                            <br />
                        </td>
                    </tr>
                     <tr>
                        <td style="text-align:center">
                            Payment Method:
                            <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            This is a Computer Generated Invoice and does not required Signature.
                            <br />
                        </td>
                    </tr>
                </table>
            
        </asp:Panel>
            <div style="text-align:center">
                <asp:Button ID="BtnDL" runat="server" Text="Thank You For Shopping" OnClick="BtnDL_Click"  />
            </div>
    </form>
</body>
</html>
