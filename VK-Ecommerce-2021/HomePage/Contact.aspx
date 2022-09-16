<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="VK_Ecommerce.HomePage.Contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Online Shopping</title>
    <link rel="icon" type="image/png" href="../Image/favicon.ico"/>
    <link rel="stylesheet" href="Contact.css"/>
    <!-- font awesome/Boxicons cdn link  -->
    <script src="https://kit.fontawesome.com/144ffef8f7.js" crossorigin="anonymous"></script>
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'/>
    <!-- AOS Link -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"/>
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
        <a href="HomePage.aspx" class="nav-item scroll-link" >Home</a>
        <a href="Product.aspx" class="nav-item scroll-link" >Products</a>
        <a href="about.aspx" class="nav-item scroll-link" >About</a>
        <a href="#" class="nav-item scroll-link" >Contact</a>
    </div>
  
   
</header>


         <section class = "contact-section">
        <div class = "contact-bg">
          <h3>LET’S STAY IN TOUCH!</h3>
          <h2>contact us</h2>
          <div class = "line">
            <div></div>
            <div></div>
            <div></div>
          </div>
          <p class = "text">We'd Love to Here From You</p>
        </div>
  
  
        <div class = "contact-body">
          <div class = "contact-info">
            <div >
              <span><i class = "fas fa-mobile-alt"></i></span>
              <span>Phone No.</span>
              <span class = "text">09053294693</span>
            </div>
            <div >
              <span"><i class = "fas fa-envelope-open"></i></span>
              <span">E-mail</span>
              <span class = "text">Virnilkent45@Gmail.com</span>
            </div>
            <div >
              <span><i class = "fas fa-map-marker-alt"></i></span>
              <span>Address</span>
              <span class = "text">Trece Martires City Cavite, Westplain Subd.</span>
            </div>
            <div >
              <span><i class = "fas fa-clock"></i></span>
              <span>Opening Office Hours</span>
              <span class = "text">Monday - Friday (9:00 AM to 5:00 PM)</span>
            </div>
          </div>
  
          <div class = "contact-form">
            <div class="form">
              <div>
                <asp:TextBox ID="TextBox1" runat="server" class = "form-control" placeholder="First Name" required=""  autocomplete="off"></asp:TextBox>
                <asp:TextBox ID="TextBox2" runat="server" class = "form-control" placeholder="Last Name" required="" autocomplete="off"></asp:TextBox>
               
              </div>
              <div>
                <asp:TextBox ID="TextBox3"  type = "email"  runat="server" class = "form-control" placeholder="E-mail" required="" autocomplete="off"></asp:TextBox>
                <asp:TextBox ID="TextBox4" runat="server" class = "form-control" placeholder="Phone" required="" autocomplete="off"></asp:TextBox>
               
              </div>
                <asp:TextBox ID="TextBox5" rows="5" TextMode="Multiline" runat="server"  placeholder="Message" class = "form-control" required="" autocomplete="off"></asp:TextBox>
              
             
                <asp:Button ID="BtnSaveMessages" runat="server"  class = "send-btn" Text="send message" OnClick="BtnSaveMessage_Click1"/>
            </div>
  
            <div>
              <img src="../Image/ContactUs.png" />
            </div>
          </div>
        </div>
  
        <div class = "map">
          <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2298.906176430559!2d120.85074176745267!3d14.294928874634468!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33bd81a97f70a765%3A0x3aadea05378f0cb1!2sWest%20Plain%20Subdivision!5e0!3m2!1sen!2sph!4v1634183567974!5m2!1sen!2sph"  height="450" frameborder="0" style="border:0;" allowfullscreen="" loading="lazy" aria-hidden="false" tabindex="0"></iframe>
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
    <script src="Contact.js"></script>
     <!-- Aos JS Link -->
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
</body>
</html>
