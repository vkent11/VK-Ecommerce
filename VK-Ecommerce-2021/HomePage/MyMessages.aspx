<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyMessages.aspx.cs" Inherits="VK_Ecommerce.HomePage.MyMessages" %>

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

        <div>
            <asp:Button ID="BtnDeleteMessage" runat="server" Text="Delete All Messages"  OnClick="BtnDeleteMessage_Click"/>
        </div>

        <div style="margin-bottom: 40px;">
             <div class="container">
             <div class="row">
             <div class="col-lg-12 ">
             <div class="table-responsive">
                    <center>
                     <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered table-hover"  AutoGenerateColumns="False" EmptyDataText="There is no Messages" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="ID">
                         <Columns>
                             <asp:TemplateField HeaderText="ID" Visible="False">
                                 <ItemTemplate>
                                     <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" />
                             </asp:TemplateField>


                             <asp:TemplateField HeaderText="Firstname" >
                                 <ItemTemplate>
                                     <asp:Label ID="Label2" runat="server" Text='<%# Eval("Firstname") %>'></asp:Label>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" />
                             </asp:TemplateField>

                             <asp:TemplateField HeaderText="Lastname" >
                                 <ItemTemplate>
                                     <asp:Label ID="Label3" runat="server" Text='<%# Eval("Lastname") %>'></asp:Label>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" />
                             </asp:TemplateField>

                             <asp:TemplateField HeaderText="Email Address" >
                                 <ItemTemplate>
                                     <asp:Label ID="Label4" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" />
                             </asp:TemplateField>

                             <asp:TemplateField HeaderText="Phone" >
                                 <ItemTemplate>
                                     <asp:Label ID="Label5" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" />
                             </asp:TemplateField>

                             <asp:TemplateField HeaderText="Message">
                                 <ItemTemplate>
                                     <asp:TextBox ID="TextBox5" rows="5" TextMode="Multiline" class = "form-control" runat="server" Text='<%# Eval("Reply") %>' ></asp:TextBox>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" />
                             </asp:TemplateField>

                             

                              
                             
                             <asp:CommandField DeleteText="Delete Message" ShowDeleteButton="True">
                             <ItemStyle ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
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
