    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="VK_Ecommerce.HomePage.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Online Shoes</title>
    <link rel="stylesheet" href="HomePage.css"/>
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'/>
    <!-- Carousel -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.core.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.theme.min.css"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Archivo:wght@400;700&display=swap" rel="stylesheet" />
    <!-- Swiper JS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/css/swiper.min.css"/>
    <!-- Link Swiper's CSS -->
    <link
      rel="stylesheet"
      href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />
    <link rel="icon" type="image/png" href="../Image/favicon.ico"/>
    
    <!-- AOS Link -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"/>
    <!-- font awesome cdn link  -->
    <script src="https://kit.fontawesome.com/144ffef8f7.js" crossorigin="anonymous"></script>

     <script src="http://code.jquery.com/jquery-1.11.3.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ShowHidePassword() {
            var txt = $('#<%=txtPass.ClientID%>');
            if (txt.prop("type") == "password") {
                txt.prop("type", "text");
                $("label[for='cbShowHidePassword']").text("Hide Password");
            }
            else {
                txt.prop("type", "password");
                $("label[for='cbShowHidePassword']").text("Show Password");
            }
        }
    </script>

    
</head>
<body>
    <form id="form1" runat="server">
        <header>
        <div id="menu-bar" class="fas fa-bars"></div>
        <!-- <a href="#" class="Logo" id="nav-bar-logo"><img src="./images/ShoeLogo.png" alt="" class="scroll-link" href="#hero"></a> -->
        <div class="contain" data-aos="fade-right" data-aos-offset="300" data-aos-easing="ease-in-sine">
            <!--<img src="../Image/FinalLogo.png" alt=""/>-->
            
            <h1 class="navbar-brand"><i class='bx bxl-vk'></i> Online Shoes</h1>
        </div>
        <!-- Nav-bar -->
        <div class="nav-bar">
            <a href="#" class="nav-item scroll-link" data-aos="fade-down" data-aos-duration="1500" data-aos-easing="linear">Home</a>
            <a href="Product.aspx" class="nav-item scroll-link" data-aos="fade-down" data-aos-duration="1500" data-aos-easing="linear">Products</a>
            <a href="about.aspx" class="nav-item scroll-link" data-aos="fade-down" data-aos-duration="1500" >About</a>
            <a href="Contact.aspx" class="nav-item scroll-link" data-aos="fade-down" data-aos-duration="1500" data-aos-easing="linear">Contact</a>
        </div>



     
        <div class="nav_right">
			<ul>
              <asp:placeholder id="LoggedInPH" runat="server" visible="false">
				<li class="nr_li dd_main">
                    
					    <i class="far fa-user-circle"></i>
					
					<div class="dd_menu">
						<div class="dd_left">
							<ul>
								<li><i class="far fa-user"></i></li>
								<li><i class="fas fa-cart-plus"></i></li>
								<li><i class="far fa-heart"></i></li>
                                <li><i class="far fa-clipboard"></i></li>
                                <li><i class="far fa-comment-dots"></i></li>
								<li><i class="fas fa-sign-out-alt"></i></li>
							</ul>
						</div>
						<div class="dd_right">
							<ul>
								<li><a href="ViewUser.aspx"><asp:Label ID="LblUser" runat="server" Text="Label"></asp:Label></a></li>
								<li><a href="AddToCart.aspx">My Cart</a> <asp:Label ID="LblCart" runat="server" Text="Label"></asp:Label>  </li>
								<li><a href="AddToWishList.aspx">My WishList</a> <asp:Label ID="LblWish" runat="server" Text="Label"></asp:Label> </li>
                                <li><a href="OrderStatus.aspx">My Orders</a></li>
                                <li><a href="MyMessages.aspx">My Messages</a></li>
								<li>
                                    <a><asp:LinkButton ID="BtnUserLogOut1" runat="server" OnClick="BtnUserLogOut1_Click1">Sign Out</asp:LinkButton></a>                  
                                     
								</li>
							</ul>
						</div>
					</div>
				</li>
              </asp:placeholder>
			</ul>
		</div>
    


        <!-- Icons -->
        <div class="icons">
            <asp:placeholder id="NotLoggedInPH" runat="server">
                <i class="fas fa-user-tie" id="login-btn" data-aos="fade-left" data-aos-offset="300" data-aos-easing="ease-in-sine"></i>
            </asp:placeholder>
             
           
       </div>
    </header>

    <!-- Login  Container Start-->

    <div class="login-form-container">

        <i class='bx bx-x-circle' id="form-close"></i>
       
        <div class="form" >
            <h3>Sign In</h3>
            <asp:TextBox ID="txtUser" class="box" runat="server" placeholder="Enter your Username" autocomplete="off"></asp:TextBox>
            <asp:TextBox ID="txtPass" class="box" TextMode = "Password"  runat="server" placeholder="Enter your Password" autocomplete="off"></asp:TextBox>
              <input id="cbShowHidePassword" type="checkbox" onclick="ShowHidePassword();" />
                            <label class="form-control" for='cbShowHidePassword'>Show Password</label>
            <asp:Button ID="BtnLogin" class="btn-login" runat="server" Text="Sign In" OnClick="BtnLogin_Click"/>
           
       
            <p>forgot password? <a href="ValidateEmail.aspx">Click Here</a></p>
            <p>don't have any account? <a href="Register.aspx">Sign Up Now</a></p>
        </div>
       
    </div>


    <!-- Login  Container End-->

     <!-- hero slide -->
    <div class="hero">
        <div class="slide-container" id="hero-slide">
            <!-- slide item -->
            <div class="slide">
                <div class="slide-txt">
                    <div class="slide-title">
                        <h3>Best Shoes, For Best Style</h3>
                    </div>
                    <div class="slide-description">
                        <p>If The Shoe Fits, Buy It</p>
                    </div>
                    <div class="slide-btn">
                        <a href="Product.aspx" class="hero-btn">
                            buy now
                        </a>
                    </div>
                </div>
                <div class="slide-img">
                    <img src="../Image/ShoeHero.png" />
                </div>
            </div>
            <!-- end slide item -->
            <!-- slide item -->
            <div class="slide">
                <div class="slide-txt">
                    <div class="slide-title">
                        <h3>Imagine the Best in Every Shoe</h3>
                    </div>
                    <div class="slide-description">
                        <p>Shoes as unique as the human who wears it.</p>
                    </div>
                    <div class="slide-btn">
                        <a href="Product.aspx" class="hero-btn">
                            buy now
                        </a>
                    </div>
                </div>
                <div class="slide-img">
                    <img src="../Image/ShoeHero3.png" />
                </div>
            </div>
            <!-- end slide item -->
            <!-- slide item -->
            <div class="slide">
                <div class="slide-txt">
                    <div class="slide-title">
                        <h3>Buy the best shoes, be best.</h3>
                    </div>
                    <div class="slide-description">
                        <p>Get your luxurious elegance with our shoes.</p>
                    </div>
                    <div class="slide-btn">
                        <a href="Product.aspx" class="hero-btn">
                            buy now
                        </a>
                    </div>
                </div>
                <div class="slide-img">
                    <img src="../Image/ShoeHero2.png" />
                </div>
            </div>
            <!-- end slide item -->
            <div class="hero-txt">
                Get your Dream Shoes
            </div>
            <!-- slide control -->
            <ul class="slide-control">
                <li class="slide-prev"><i class="bx bx-chevron-left"></i></li>
                <li class="slide-control-item active">01</li>
                <li class="slide-control-item">02</li>
                <li class="slide-control-item">03</li>
                <li class="slide-next"><i class="bx bx-chevron-right"></i></li>
            </ul>
            <!-- end slide control -->
        </div>
    </div>
    <!-- end hero slide -->

  <!-- About Section -->
<section id="about">
    <div class="about about-container">
        <div class="col-left">
            <div class="about-img" data-aos="fade-up" data-aos-delay="500" data-aos-offset="100" data-aos-easing="ease-in-sine">
                <img src="../Image/FeaturedShoes5.png" />
            </div>
        </div>
        <div class="col-right">
            <h1 class="section-title" data-aos="fade-up" data-aos-delay="100" data-aos-offset="100" data-aos-easing="ease-in-sine">BE THE FIRST TO <span>KNOW</span></h1>
            <h2 data-aos="fade-up" data-aos-delay="200" data-aos-offset="100" data-aos-easing="ease-in-sine">Sign Up today</h2>
            <p data-aos="fade-up" data-aos-delay="300" data-aos-offset="100" data-aos-easing="ease-in-sine">Sign up for VK Online Shoes emails to be the first to see inspiring content, news and exclusive offers.
            </p>
            <a href="Register.aspx" class="cta" data-aos="fade-up" data-aos-delay="400" data-aos-offset="100" data-aos-easing="ease-in-sine">Sign Up Now<i class="uil uil-file-download"></i></a>
        </div>
    </div>
</section>
<!-- About End -->

    
     <section class="BG-hero" id="BG-hero" data-aos="flip-down" data-aos-delay="100">

        <div class="BG-hero-content" >
            <h3>Shopping <span>on</span> the go</h3>
            <p>Fast & Easy</p>
            <a href="Product.aspx" class="BG-hero-btn">shop now</a>
        </div>

      </section> 

          
     <section id="Banner">
       
        <div class="Banner-Content">
            <div class="Banner">
               <!-- Swiper -->
                  <div class="swiper mySwiper1">
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








    </form>


    <script>
        var dd_main = document.querySelector(".dd_main");

        dd_main.addEventListener("click", function () {
            this.classList.toggle("active");
        })
    </script>


   
    

     <!-- Hero JS Link -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/js/swiper.min.js"></script>

    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- Aos JS Link -->
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>

    <!-- App.JS Link -->
    <script src="HomePage.js"></script>
    <script src="Login.js"></script>
    <script src="HomePage2.js"></script>
    <!-- Product Swiper -->
   <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</body>
</html>
