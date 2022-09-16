<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="VK_Ecommerce.HomePage.Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Online Shopping</title>
    <link rel="stylesheet" href="Product.css"/>
    <script src="https://kit.fontawesome.com/144ffef8f7.js" crossorigin="anonymous"></script>
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'/>
     <!-- Swiper JS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/css/swiper.min.css"/>
    <link
      rel="stylesheet"
      href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />

    
    <link rel="icon" type="image/png" href="../Image/favicon.ico"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class = "main-wrapper">
        <nav class = "navbar">
          <div class = "brand-and-icon">
            <a href = "#" class = "navbar-brand"><i class='bx bxl-vk'></i>Online Shoes</a>
            <button type = "button" class = "navbar-toggler">
              <i class = "fas fa-bars"></i>
            </button>
          </div>
  
         <div class = "navbar-collapse">
            <ul class = "navbar-nav">
              <li>
                <a><asp:LinkButton ID="BtnHome" runat="server" OnClick="BtnHome_Click">Home</asp:LinkButton></a>
              </li>
  
              <li>
                <a  class="menu-link">
                     <asp:LinkButton ID="BtnMenCat" class="Link"  runat="server" OnClick="BtnMenCat_Click">Men</asp:LinkButton>
                </a>
                
                
                <div class = "sub-menu">
                  <!-- item -->
                  <div class = "sub-menu-item">
                    <h4>Shoes</h4>
                    <ul>
                      <li><a href = "#">
                          <asp:LinkButton ID="BtnRunning" runat="server" OnClick="BtnRunning_Click">Running</asp:LinkButton></a></li>
                      <li><a href = "#"><asp:LinkButton ID="BtnBasketball" runat="server" OnClick="BtnBasketball_Click">Basketball</asp:LinkButton></a></li>
                      <li><a href = "#"><asp:LinkButton ID="BtnFormal" runat="server" OnClick="BtnFormal_Click">Formal</asp:LinkButton></a></li>
                      <li><a href = "#"><asp:LinkButton ID="BtnCasual" runat="server" OnClick="BtnCasual_Click">Casual</asp:LinkButton></a></li>
                     
                    </ul>
                  </div>
                  <!-- end of item -->
                  <!-- item -->
                 
                   <div class = "sub-menu-item">
                    <h2>stylish and modern fashion Shoes</h2>
                    
                  </div>
                  <!-- end of item -->
                  <!-- item -->
                  <div class = "sub-menu-item">
                      <img src="../Image/ShoeHero.png" />
                  </div>
                  <!-- end of item -->
                </div>
              </li>
  
              <li>
                  <a  class="menu-link">
                      <asp:LinkButton ID="BtnWomenCat"  runat="server" OnClick="BtnWomenCat_Click">Women</asp:LinkButton>
                  </a>
                  
               
                <div class = "sub-menu">
                 <!-- item -->
                  <div class = "sub-menu-item">
                    <h4>Shoes</h4>
                    <ul>
                      <li><a href = "#"><asp:LinkButton ID="BtnHeelsSandals" runat="server" OnClick="BtnHeelsSandals_Click">Heels and Sandals</asp:LinkButton></a></li>
                      <li><a href = "#"><asp:LinkButton ID="BtnRunning2" runat="server" OnClick="BtnRunning2_Click">Running</asp:LinkButton></a></li>
                      <li><a href = "#"><asp:LinkButton ID="BtnFormal2" runat="server" OnClick="BtnFormal2_Click">Formal</asp:LinkButton></a></li>
                      <li><a href = "#"><asp:LinkButton ID="BtnCasual2" runat="server" OnClick="BtnCasual2_Click">Casual</asp:LinkButton></a></li>
                    </ul>
                  </div>
                  <!-- end of item -->
                  <!-- item -->
                  <div class = "sub-menu-item">
                    <h2>stylish and modern fashion Shoes</h2>
                    
                  </div>
                  <!-- end of item -->
                  <!-- item -->
                  <div class = "sub-menu-item">
                    <img src="../Image/ShoeHero2.png" />
                  </div>
                  <!-- end of item -->
                </div>
              </li>
  
              <li>
                <a class="menu-link">
                     <asp:LinkButton ID="BtnKidCat"  runat="server" OnClick="BtnKidCat_Click">Kids</asp:LinkButton>
                </a>
                
                 
                
                <div class = "sub-menu">
                  <!-- item -->
                  <div class = "sub-menu-item">
                    <h4>Shoes</h4>
                    <ul>
                      <li><a href = "#"><asp:LinkButton ID="BtnHeels3" runat="server" OnClick="BtnHeels3_Click">Heels and Sandals</asp:LinkButton></a></li>
                      <li><a href = "#"><asp:LinkButton ID="BtnRunning3" runat="server" OnClick="BtnRunning3_Click">Running</asp:LinkButton></a></li>
                      <li><a href = "#"><asp:LinkButton ID="BtnFormal3" runat="server" OnClick="BtnFormal3_Click">Formal</asp:LinkButton></a></li>
                      <li><a href = "#"><asp:LinkButton ID="BtnCasual3" runat="server" OnClick="BtnCasual3_Click">Casual</asp:LinkButton></a></li>
                      <li><a href = "#"><asp:LinkButton ID="BtnBasketball3" runat="server" OnClick="BtnBasketball3_Click">Basketball</asp:LinkButton></a></li>
                    </ul>
                  </div>
                  <!-- end of item -->
                  <!-- item -->
                  <div class = "sub-menu-item">
                    <h2>the latest product is here</h2>
                    
                  </div>
                  <!-- end of item -->
                  <!-- item -->
                  <div class = "sub-menu-item">
                    <img src="../Image/BannerKidsShoes.jpg" />
                  </div>
                  <!-- end of item -->
                </div>
              </li>
              
            <li>
                <a class="menu-link">
                     <asp:LinkButton ID="BtnViewAll" runat="server" OnClick="BtnViewAll_Click">View All Products</asp:LinkButton>
                </a>
            </li>
             
            </ul>
          </div>
        </nav>
      </div>

       

        
     <!-- Search -->
        <div class="search-bar-container">
            
            <div class="Search-wrap">
                 <div class="search-box">
                     <asp:TextBox ID="txtSearch" type="search"  placeholder="Search here..."  runat="server"></asp:TextBox>
                    <asp:Button ID="search"  runat="server" Text="Search"  OnClick="search_Click"/>
                </div>
            </div>
           
           
        </div>


         <section id="Banner">
       
        <div class="Banner-Content">
            <div class="Banner">
               <!-- Swiper -->
                  <div class="swiper Product-swiper">
                    <div class="swiper-wrapper">
                      <div class="swiper-slide">
                         <img src="../Image/Banner8.jpeg" />
                          <h3></h3>
                      </div>
                      <div class="swiper-slide">
                         <img src="../Image/Banner2.jpg" />
                          <h3> </h3>
                      </div>
                      <div class="swiper-slide">
                          <img src="../Image/Banner3.jpg" />
                         <h3> </h3>
                      </div>
                      <div class="swiper-slide">
                          <img src="../Image/Banner5.jpg" />
                          <h3></h3>
                      </div>
                      <div class="swiper-slide">
                          <img src="../Image/Banner4.jpg" />
                          <h3></h3>
                      </div>
                      <div class="swiper-slide">
                          <img src="../Image/Banner10.jpg" />
                          <h3></h3>
                      </div>
                      <div class="swiper-slide">
                          <img src="../Image/Banner6.jpg" />
                          <h3></h3>
                      </div>
                      <div class="swiper-slide">
                          <img src="../Image/Banner9.jpg" />
                          <h3></h3>
                      </div>
                     
                    </div>
                    <div class="swiper-pagination"></div>
                  </div>
            </div>
        </div>

       
    </section>







        <div class="Product-Title">
            <h1>Products</h1>
            
            
            
            
            <asp:DropDownList ID="DdlSubCat" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DdlSubCat_SelectedIndexChanged"></asp:DropDownList>
            
        </div>


   
    <table>

    </table>
       
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" DataKeyField="Productid" Height="290px" Width="270px" RepeatDirection="Horizontal" HorizontalAlign="Center" RepeatColumns="3" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound"  >
            <ItemTemplate >
            <div style="text-align:center" align="center">
                <div style="width:50%; margin: 0 auto; text-align:center"  >
                <table   runat="server" style="width:100%;margin: 40px 60px" >

                    <tr>
                        <td>
                            <td style="text-align:center" >
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Productid") %>' Font-Bold="True" Font-Size="X-Large" Font-Strikeout="False" ForeColor="#333333" style="text-transform:capitalize; font-family:'Bebas Neue', cursive; letter-spacing:2px" Visible="False"></asp:Label>
                        </td>
                        </td>
                    </tr>

                     <tr>
                        <td style="text-align:center;width:100%">
                            <asp:ImageButton ID="ImageButton1" runat="server" Height="250px" Width="250px" ImageUrl='<%# "~/Uploads/" + Eval("Image") %>' ImageAlign="Middle" CommandName="ViewProductDetail" CommandArgument='<%# Eval("Productid") %>' />
                        </td>
                        
                    </tr>

                     <tr>
                        <td style="text-align:center" >
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>' Font-Bold="True" Font-Size="Medium" Font-Strikeout="False" ForeColor="#333333" style="text-transform:capitalize; font-family:'Bebas Neue', cursive; letter-spacing:2px"></asp:Label>
                        </td>
                    </tr>

                     <tr>
                        <td style="text-align:center" >
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Brand") %>' Font-Bold="True" Font-Size="X-Large" Font-Strikeout="False" ForeColor="#333333" style="text-transform:capitalize; font-family:'Bebas Neue', cursive; letter-spacing:2px"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:center">Size
                            <asp:DropDownList ID="DropDownList2" runat="server">
                              <asp:ListItem>5</asp:ListItem>
                              <asp:ListItem>5&#39;1/2</asp:ListItem>
                              <asp:ListItem>6</asp:ListItem>
                              <asp:ListItem>6&#39;1/2</asp:ListItem>
                              <asp:ListItem>7</asp:ListItem>
                              <asp:ListItem>7&#39;1/2</asp:ListItem>
                              <asp:ListItem>8</asp:ListItem>
                              <asp:ListItem>8&#39;1/2</asp:ListItem>
                              <asp:ListItem>9</asp:ListItem>
                              <asp:ListItem>9&#39;1/2</asp:ListItem>
                              <asp:ListItem>10</asp:ListItem>
                              <asp:ListItem>10&#39;1/2</asp:ListItem>
                              <asp:ListItem>11</asp:ListItem>
                              <asp:ListItem>11&#39;1/2</asp:ListItem>
                              <asp:ListItem>12</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>

                     <tr>
                        <td style="text-align:center" >Quantity
                            <asp:DropDownList ID="DropDownList1" runat="server">

                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                

                            </asp:DropDownList>
                        </td>
                    </tr>

                     <tr>
                        <td style="text-align:center">
                            <asp:Label ID="Label2" runat="server" Text="Price: ₱" Style="text-align:center" Font-Bold="True" Font-Size="Medium" ForeColor="#FF6600"></asp:Label>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>' Style="text-align:center; font-family:'Roboto', sans-serif" ForeColor="#666666"></asp:Label>
                           
                            <br />
                            Stock:
                            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                           
                            <br />
                            <br />
                           
                        </td>
                    </tr>

                    

                     <tr>
                        <td style="text-align:center">
                            <asp:LinkButton ID="BtnAdCart" style="outline:none; background:crimson; color: white; padding:10px 8px; border-radius: 20px; text-decoration:none; font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif" runat="server" CommandArgument='<%# Eval("Productid") %>' CommandName="AddToCart" Font-Names="Bahnschrift SemiCondensed">Add To Cart</asp:LinkButton>   
                            
                            <br />
                            <br />
                        </td>

                         
                    </tr>
                    <tr>
                         <td>
                             <asp:LinkButton ID="BtnAddWish" style="outline:none; background:crimson; color: white; padding:10px 8px; border-radius: 20px; text-decoration:none; font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif" runat="server" CommandArgument='<%# Eval("Productid") %>' CommandName="AddToWish">Add To WishList</asp:LinkButton>
                         </td>
                    </tr>

                </table> 
              </div>
             </div>
                
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VkEcommerceConnectionString %>" SelectCommand="SELECT [ID], [Productid], [Name], [Price], [Detail], [Material], [Brand], [Category], [Sub], [Image] FROM [product]"></asp:SqlDataSource>
     
        <!-- Footer -->

    <footer class="footer">
      <div class="container">
        <div class="row">
          <div class="footer-col" data-aos="fade-right" data-aos-delay="100">
            <h4>company</h4>
            <ul>
              <li><a href="#">about us</a></li>
              <li><a href="#">our services</a></li>
              <li><a href="#">privacy policy</a></li>
              <li><a href="#">affiliate program</a></li>
            </ul>
          </div>
          <div class="footer-col" data-aos="fade-right" data-aos-delay="200">
            <h4>get help</h4>
            <ul>
              <li><a href="#">FAQ</a></li>
              <li><a href="#">shipping</a></li>
              <li><a href="#">returns</a></li>
              <li><a href="#">order status</a></li>
              <li><a href="#">payment options</a></li>
            </ul>
          </div>
          <div class="footer-col" data-aos="fade-right" data-aos-delay="300">
            <h4>online shop</h4>
            <ul>
              <li><a href="#">watch</a></li>
              <li><a href="#">bag</a></li>
              <li><a href="#">shoes</a></li>
              <li><a href="#">dress</a></li>
            </ul>
          </div>
          <div class="footer-col" data-aos="fade-right" data-aos-delay="400">
            <h4>follow us</h4>
            <div class="social-links">
              <a href="#"><i class='bx bxl-facebook-circle' ></i></a>
              <a href="#"><i class='bx bxl-twitter' ></i></a>
              <a href="#"><i class='bx bxl-instagram' ></i></a>
              <a href="#"><i class='bx bxl-linkedin' ></i></a>
            </div>
          </div>
        </div>
      </div>
   </footer>





    
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:VkEcommerceConnectionString %>" SelectCommand="SELECT * FROM [product] WHERE ([Category] = @Category)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Category" QueryStringField="cat" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
     
        




        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:VkEcommerceConnectionString %>" SelectCommand="SELECT * FROM [product] WHERE ([Sub] = @Sub)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Sub" QueryStringField="sub" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
     
        




    </form>

    <!--jQuery-->
      <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
      <script src="Product.js"></script>
     
     <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <script>
        //Banner JS
        var swiper = new Swiper(".Product-swiper", {
            loop: true,
            direction: "vertical",
            speed: 2000,
            autoplay: {
                delay: 2500,
                disableOnInteraction: false,
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
        });
    </script>
     </body>
</html>



