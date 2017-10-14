<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>SSMC</title>
    <link rel="stylesheet" href="assets/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/custom/global.css">
    <link rel="stylesheet" href="assets/css/custom/common.css">
    <link rel="stylesheet" href="assets/css/custom/medical.css">
    <link rel="stylesheet" href="assets/css/custom/corporate.css">


  </head>
  <body>
    <header>
      <div class="header-top">
        <div class="container">
          <div class="pull-left">
            <span><i>t</i> +6398863555</span> &nbsp; <span><i>t</i> support@ssmc.com</span>
          </div>
          <div class="pull-right">
            <span><a href="#"><i>f</i></a></span>
            <span><a href="#"><i>t</i></a></span>
            <span><a href="#"><i>y</i></a></span>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="header-bot">
          <a class="logo pull-left" href="#"><img src="assets/img/logo.png" alt=""></a>
          <div class="nav pull-right">
            <ul class="list-inline">
              <li><a href="#" class="active">HOME</a></li>
              <li><a href="#">ABOUT</a></li>
              <li><a href="#">SERVICES</a></li>
              <li><a href="#">FAQ</a></li>
              <li><a href="#">CONTACT US</a></li>
            </ul>
          </div>
          <div class="clearfix"></div>
        </div>
      </div>
    </header>
    <section>
      <div class="sec welcome">
        <!-- <h3>Welcome to</h3>
        <h1>Corporate Service</h1>
        <span>We have the most advance medical <br /> technology and innovations</span> -->
        
        ${ requestScope.header.content }
        
        <br>
        <a href="#" class="btn btn-default">EXPLORE NOW</a>
        <a href="#" class="btn btn-primary">CONTACT US</a>
      </div>
      <div class="sec info">
        <div class="container">
          <div class="row">
            <div class="col-md-4">
              <div class="info-box">
                <h3>FREE CHECKUP</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Dui </p>

              </div>

            </div>
            <div class="col-md-4">
              <div class="info-box">
                <h3>EMERGENCY CARE</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Dui </p>
                <a href="#" class="btn">CONTACT US</a>

              </div>

            </div>
            <div class="col-md-4">
              <div class="info-box">
                <h3>QUALIFIED DOCTORS</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Dui </p>

              </div>

            </div>
          </div>
        </div>
      </div>
      <div class="sec choose">
        <div class="container">
          <div class="choose row text-center">
            <span class="header-span">Why choose <strong>SSMC</strong></span>
            <h3>WE PROVIDE THE BEST SERVICE</h3>
            <br>
            <div class="col-md-4">
              <ul class="nav nav-pills nav-stacked">
                <li class="active">
                  <a href="#choose_1" class="side" data-toggle="tab">
                    <aside></aside>
                    <h4>RESPIRATORY SERVICE</h4>
                    <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  </span>
                  </a>
                <li>
                  <a href="#choose_2" class="side" data-toggle="tab">
                    <aside></aside>
                    <h4>INFUSION THERAPY</h4>
                    <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  </span>
                  </a>
                </li>
              </li>
              <li>
                <a href="#choose_3" class="side" data-toggle="tab">
                  <aside></aside>
                  <h4>PEDIATRICIAN</h4>
                  <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  </span>
                </a>
              </li>
              </ul>
            </div>
            <div class="col-md-8">
              <div class="tab-content choose-content">
                <div id="choose_1" class="tab-pane active">
                  <img src="assets/img/banner.png" alt="">
                </div>
                <div id="choose_2" class="tab-pane">
                  <img src="assets/img/banner2.png" alt="">
                </div>
                <div id="choose_3" class="tab-pane">
                  <img src="assets/img/banner.png" alt="">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="sec blue">
        <div class="container">
          <div class="row text-center">
            <span class="header-span">How We <strong>WORK</strong></span>
            <h3>MEDICAL SERVICES</h3>
            <br>
          </div>
          <div class="col-md-4">
            <ul  class="nav nav-pills">
            
              <li class="active">
                <a href="#service_1" data-toggle="tab" class="service-left">
                  <aside></aside>
                  <h5>${requestScope.service1.title }</h5>
                  <span>${requestScope.service1.content }</span>
                </a>
              </li>
              <li>
                <a href="#service_2" data-toggle="tab" class="service-left">
                  <aside></aside>
                  <h5>${requestScope.service2.title }</h5>
                  <span>${requestScope.service2.content }</span>
                </a>
              </li>
              <li>
                <a href="#service_3" data-toggle="tab" class="service-left">
                  <aside></aside>
                  <h5>${requestScope.service3.title }</h5>
                  <span>${requestScope.service3.content }</span>
                </a>
              </li>
            </ul>
          </div>
          <div class="col-md-4">
            <div class="service-center">
              <div class="tab-content">
                <div id="service_1" class="tab-pane active">
                  <div class="service-img">
                    <img src="assets/img/service1.png" alt="">
                  </div>
                  <div class="service-content">
                    <h4>Medical Checkup</h4>
                    <span>1Lorem ipsum dolor sit amet,tetur adipisicing elit, s consecteturu </span>
                  </div>
                </div>
                <div id="service_2" class="tab-pane">
                  <div class="service-img">
                    <img src="assets/img/service1.png" alt="">
                  </div>
                  <div class="service-content">
                    <h4>Medical Checkup</h4>
                    <span>2Lorem ipsum dolor sit amet,tetur adipisicing elit, s consecteturu </span>
                  </div>
                </div>
                <div id="service_3" class="tab-pane">
                  <div class="service-img">
                    <img src="assets/img/service1.png" alt="">
                  </div>
                  <div class="service-content">
                    <h4>Medical Checkup</h4>
                    <span>3Lorem ipsum dolor sit amet,tetur adipisicing elit, s consecteturu </span>
                  </div>
                </div>
                <div id="service_4" class="tab-pane">
                  <div class="service-img">
                    <img src="assets/img/service1.png" alt="">
                  </div>
                  <div class="service-content">
                    <h4>Medical Checkup</h4>
                    <span>4Lorem ipsum dolor sit amet,tetur adipisicing elit, s consecteturu </span>
                  </div>
                </div>
                <div id="service_5" class="tab-pane">
                  <div class="service-img">
                    <img src="assets/img/service1.png" alt="">
                  </div>
                  <div class="service-content">
                    <h4>Medical Checkup</h4>
                    <span>5Lorem ipsum dolor sit amet,tetur adipisicing elit, s consecteturu </span>
                  </div>
                </div>
                <div id="service_6" class="tab-pane">
                  <div class="service-img">
                    <img src="assets/img/service1.png" alt="">
                  </div>
                  <div class="service-content">
                    <h4>Medical Checkup</h4>
                    <span>6Lorem ipsum dolor sit amet,tetur adipisicing elit, s consecteturu </span>
                  </div>
                </div>
              </div>
				
            </div>
          </div>
          <div class="col-md-4">
            <ul  class="nav nav-pills">
              <li>
                <a href="#service_4" data-toggle="tab" class="service-right">
                  <aside></aside>
                  <h5>${requestScope.service4.title }</h5>
                  <span>${requestScope.service4.content }</span>
                </a>
              </li>
              <li>
                <a href="#service_5" data-toggle="tab" class="service-right">
                  <aside></aside>
                  <h5>${requestScope.service5.title }</h5>
                  <span>${requestScope.service5.content }</span>
                </a>
              </li>
              <li>
                <a href="#service_6" data-toggle="tab" class="service-right">
                  <aside></aside>
                  <h5>${requestScope.service6.title }</h5>
                  <span>${requestScope.service6.content }</span>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="sec branch">
        <div class="container">
          <div class="row text-center">
            <span class="header-span">Find <strong>SSMC</strong></span>
            <h3>CLINICS AND HOSPITALS</h3>
            <br>
            <div class="col-md-3">
              <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="#branch_1" data-toggle="tab">Quezon City</a></li>
                <li><a href="#branch_2" data-toggle="tab">Makati City</a></li>
                <li><a href="#branch_3" data-toggle="tab">Mandaluyong City</a></li>
                <li><a href="#branch_4" data-toggle="tab">Taguig City</a></li>
              </ul>
            </div>
            <div class="col-md-9">
              <div class="tab-content">
                <div id="branch_1" class="tab-pane active">
                  <div class="branch-info">
                    <h4>General Medicine</h4>
                    <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span>
                    <br>
                    <br>
                    <span>Phone: 234-2223 <br>Email: ssmc@gmail.com</span>
                  </div>
                  <div class="branch-img">
                    <img src="assets/img/cross.png" style="width: 250px;" alt="">
                  </div>
                </div>
                <div id="branch_2" class="tab-pane">
                  <div class="branch-info">
                    <h4>General Medicine2</h4>
                    <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span>
                    <br>
                    <br>
                    <span>Phone: 234-2223 <br>Email: ssmc@gmail.com</span>
                  </div>
                  <div class="branch-img">
                    <img src="assets/img/cross.png" style="width: 250px;" alt="">
                  </div>
                </div>
                <div id="branch_3" class="tab-pane">
                  <div class="branch-info">
                    <h4>General Medicin3e</h4>
                    <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span>
                    <br>
                    <br>
                    <span>Phone: 234-2223 <br>Email: ssmc@gmail.com</span>
                  </div>
                  <div class="branch-img">
                    <img src="assets/img/cross.png" style="width: 250px;" alt="">
                  </div>
                </div>
                <div id="branch_4" class="tab-pane">
                  <div class="branch-info">
                    <h4>General Medicin4e</h4>
                    <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span>
                    <br>
                    <br>
                    <span>Phone: 234-2223 <br>Email: ssmc@gmail.com</span>
                  </div>
                  <div class="branch-img">
                    <img src="assets/img/cross.png" style="width: 250px;" alt="">
                  </div>
                </div>

              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="sec med-promo">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <h1>Need a medicine on the go?</h1>
              <span>You have a partner with us in affordable and effective medicine <br /> Call us <span style="color: #f57e2b;">(02) 234-2345</span> and let us help you.</span>
            </div>
            <div class="col-md-6">
              <img src="assets/img/medicine.png" style="width: 380px; "alt="">
            </div>
          </div>
        </div>
      </div>
      <div class="sec contact-us">
        <div class="container">
          <div class="row">
            <div class="col-md-8 col-md-offset-2">
              <div class="contact-box">
                <h2>CONTACT US NOW!</h2>
                <form class="contact-form">
                  <div class="row">
                    <div class="col-md-6">
                      <input type="text" class="form-control" name="" value="" placeholder="Full name">
                      <input type="email" class="form-control" name="" value="" placeholder="E-mail">
                      <input type="text" class="form-control" name="" value="" placeholder="Phone">
                      <select class="form-control" name="">
                        <option>Type of Inquiry</option>
                        <option>Type of Inquiry</option>
                        <option>Type of Inquiry</option>
                        <option>Type of Inquiry</option>
                      </select>
                    </div>
                    <div class="col-md-6">
                      <input type="text" class="form-control" name="" value="" placeholder="Message">
                    </div>
                    <div class="col-md-12">
                      <button type="button" class="contact-submit" name="button">S</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <footer>
      <div class="footer-top">
        <div class="container">
          <div class="row">
            <div class="col-md-3">
              <div class="footer-box">
                <img src="assets/img/logo.png" style="width: 200px;margin-bottom: 15px;" alt="">
                <br>
                <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore mtesingsd ijid asdhhuds</span>
            </div>
            </div>
            <div class="col-md-3">
              <div class="footer-box">
                <h5>CONTACT INFORMATION</h5>
                <ul class="list-unstyled">
                  <li>Phone: +639176588492</li>
                  <li>E-mail: support@ssmc.com</li>
                  <li>Office: Km 17 W Service Rd, Paranaque, 1715 Metro Manila</li>
                </ul>
              </div>
            </div>
            <div class="col-md-3">
              <div class="footer-box">
                <h5>USEFUL LINKS</h5>
                <ul class="list-unstyled">
                  <li><a href="#">About Us</a></li>
                  <li><a href="#">Services</a></li>
                  <li><a href="#">FAQ</a></li>
                  <li><a href="#">Contact Us</a></li>
                </ul>
              </div>
            </div>
            <div class="col-md-3">
              <div class="footer-box">
                <h5>SOCIAL MEDIA</h5>
                <ul class="list-unstyled">
                  <li><a href="#">twitter.com/ssmchealth</a></li>
                  <li><a href="#">facebook.com/ssmchealth</a></li>
                  <li><a href="#">youtube.com/ssmchealth</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="footer-bot">Copyright (c) 2017. All Rights Reserved SSMC</div>
    </footer>

    <script  type="text/javascript" src="assets/js/jquery.min.js"></script>
    <script  type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function(){
        console.log("G!");
        $(".blue .nav li a").click(function(){
          console.log("gg");
          $(".blue .nav li").removeClass("active");
        });
      });
    </script>
  </body>
</html>
