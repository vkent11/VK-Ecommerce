<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="VK_Ecommerce.HomePage.About" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Online Shopping</title>
     <link rel="icon" type="image/png" href="../Image/favicon.ico"/>
    <link rel="stylesheet" href="About.css"/>
    <!-- font awesome/Boxicons cdn link  -->
    <script src="https://kit.fontawesome.com/144ffef8f7.js" crossorigin="anonymous"></script>
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'/>
</head>
<body>
    <form id="form1" runat="server">
        <header>
        <div id="menu-bar" class="fas fa-bars"></div>
        <div class="contain">
           <h1 class="navbar-brand"><i class='bx bxl-vk'></i> Online Shoes</h1>
        </div>
    
        <!-- Nav-bar -->
        <div class="nav-bar">
            <a href="HomePage.aspx" class="nav-item scroll-link">Home</a>
            <a href="Product.aspx" class="nav-item scroll-link">Products</a>
            <a href="#" class="nav-item scroll-link">About</a>
            <a href="Contact.aspx" class="nav-item scroll-link">Contact</a>
        </div>
       
       
    </header>


    <section class="About-us">
        <div class="banner_image">
		    <div class="banner_content">
			    <h1>About Us<br/> <span>Here at ‘VK Online Shoes’.com, we realize that style and prosperity begin with the correct shoes.</span></h1>
			    <p>We likewise understand that effectively finding the size and style to meet your requirements is vital to your web-based shopping knowledge. Since beginning our web-based business website in 2021, we’ve been endeavoring to present to you that perfect shopping experience.

We pride ourselves on conveying hard-to-discover styles, sizes and widths since we realize that each individual’s needs contrast. Regardless of whether you’re experiencing issues looking over our vast determination of different shoes or you have a straightforward inquiry, our client benefit group is prepared and willing to help.

Some time before our online business, our family shoe stores, fatherly shoe store Footwear in Indianapolis, IN, opened its entryways in 1886. Today we are glad to state that we have the longest constantly running shoe store in the United States. The life span of our physical business is a demonstration of our duty to you and the majority of our clients. We realize that on the off chance that you are not content with our items and administrations, we are not carrying out our responsibility.

This is the reason we take a stab at 100% consumer loyalty, offer a 105% value coordinate guarantee and additionally free delivery and returns.

Next time you require another match of kicks for this experience we call life, our group is here to ensure that you get the execution that you require from your apparatus. Regardless of whether you are difficult to fit or have explicit requirements, let ‘Organization Name’ .com enable you to make progress toward your objective.</p>
		    </div>	
	    </div>

       


         <div class="ourteam" id="ourteam">
            <h1 class="title">our team</h1>
            <div class="ourteam_wrapper">
                <div class="team-1 team">
                    <div class="team_members" data-name="Virnil Kent"><img src="../Image/kent.jpg" alt="Team_Images"/></div>
                    <div class="team_members" data-name="Lois Lane"><img src="../Image/Lois.jpg" alt="Team_Images"/></div>
                    <div class="team_members" data-name="Sonny"><img src="../Image/Sonny.jpg" alt="Team_Images"/></div>
                </div>
               <%-- <div class="team-2 team">
                    <div class="team_members" data-name="Beth"><img src="./images/products/iPhone/iphone2.jpeg" alt="Team_Images"/></div>
                    <div class="team_members" data-name="Meg Lanning"><img src="./images/products/headphone/headphone12.jpeg" alt="Team_Images"/></div>
                    <div class="team_members" data-name="Sophie Devine"><img src="./images/products/iPhone/iphone3.jpeg" alt="Team_Images"/></div>
                </div>--%>
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
     <script src="About.js"></script>
</body>
</html>
