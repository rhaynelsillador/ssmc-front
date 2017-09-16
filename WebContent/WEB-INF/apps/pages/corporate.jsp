<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <%@ include file="commons/Assets.jsp"%>

  <%-- Owl Carousel --%>
  <link rel="stylesheet" href="assets/css/vendor/owl.carousel.min.css">

  <link rel="stylesheet" href="assets/css/custom/corporate.css">
  <body>
  	<%@ include file="commons/CorporateHeader.jsp"%>

    <section>
      <div class="sec welcome">
        <div class="welcome-content wow fadeIn">
          <div id="headerInfo"></div>
          <br>
          <a href="#" class="btn btn-default hvr-grow">EXPLORE NOW</a>
          <a href="#" class="btn btn-primary hvr-grow">CONTACT US</a>
        </div>
          <div class="welcome-carousel owl-carousel owl-theme" id="imageCarousel">
          </div>
      </div>
      <div class="sec info">
        <div class="container">
          <div class="row">
            <div class="col-sm-4 wow bounceInUp">
              <div class="info-box free-checkup">
                <img src="assets/img/icon-info1.png" class="icon-info" alt="">
                <h4>FREE CHECKUP</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Dui </p>

              </div>

            </div>
            <div class="col-sm-4 wow bounceInUp">
              <div class="info-box emergency-care">
                <h4>EMERGENCY CARE</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Dui </p>
                <a href="#" class="btn">CONTACT US</a>

              </div>

            </div>
            <div class="col-sm-4 wow bounceInUp">
              <div class="info-box qualified-doctors">
                <img src="assets/img/icon-info2.png" class="icon-info" alt="">
                <h4>QUALIFIED DOCTORS</h4>
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
            <div class="big-tabination">
              <div class="col-md-4 col-sm-5">
                <ul class="nav nav-pills nav-stacked wow fadeInRight">
                  <li class="active">
                    <a href="#choose_1" class="side" data-toggle="tab">
                      <aside></aside>
                      <h5>RESPIRATORY SERVICE</h5>
                      <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  </span>
                    </a>
                  <li>
                    <a href="#choose_2" class="side" data-toggle="tab">
                      <aside></aside>
                      <h5>INFUSION THERAPY</h5>
                      <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  </span>
                    </a>
                  </li>
                </li>
                <li>
                  <a href="#choose_3" class="side" data-toggle="tab">
                    <aside></aside>
                    <h5>PEDIATRICIAN</h5>
                    <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  </span>
                  </a>
                </li>
                </ul>
              </div>
              <div class="col-md-8 col-sm-7">
                <div class="tab-content choose-content wow fadeInLeft">
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
      </div>
	
      <div class="sec blue">
        <div class="container">
          <div class="row text-center">
            <span class="header-span">How We <strong>WORK</strong></span>
            <h3>MEDICAL SERVICES</h3>
            <br>
          </div>
          <div class="col-md-4 col-sm-3">
            <ul  class="nav nav-pills wow fadeInRightBig">
              <li class="active">
                <a href="#service_1" data-toggle="tab" class="service-left" id="service1">
                  <aside></aside>
                  <h5>Gynological Services</h5>
                  <span>Lorem ipsum dolor sit ame hiijasdt, consectetur adipisicing elit, sed do eiu sed do eiu </span>
                </a>
              </li>
              <li>
                <a href="#service_2" data-toggle="tab" class="service-left" id="service2">
                  <aside></aside>
                  <h5>Gynological Services</h5>
                  <span>Lorem ipsum dolor sit ame hiijasdt, consectetur adipisicing elit, sed do eiu sed do eiu </span>
                </a>
              </li>
              <li>
                <a href="#service_3" data-toggle="tab" class="service-left" id="service3">
                  <aside></aside>
                  <h5>Gynological Services</h5>
                  <span>Lorem ipsum dolor sit ame hiijasdt, consectetur adipisicing elit, sed do eiu sed do eiu </span>
                </a>
              </li>
            </ul>
          </div>
          <div class="col-md-4 col-sm-6">
            <div class="service-center wow fadeInUpBig">
              <div class="tab-content">
                <div id="service_1" class="tab-pane active">
                  <div class="service-img">
                    <img src="assets/img/service1.png" alt="">
                  </div>
                  <span class="service-circle"></span>
                  <div class="service-content">
                    <h4>Medical Checkup</h4>
                    <span>1Lorem ipsum dolor sit amet,tetur adipisicing elit, s consecteturu </span>
                  </div>
                </div>
                <div id="service_2" class="tab-pane">
                  <div class="service-img">
                    <img src="assets/img/service1.png" alt="">
                  </div>
                  <span class="service-circle"></span>
                  <div class="service-content">
                    <h4>Medical Checkup</h4>
                    <span>2Lorem ipsum dolor sit amet,tetur adipisicing elit, s consecteturu </span>
                  </div>
                </div>
                <div id="service_3" class="tab-pane">
                  <div class="service-img">
                    <img src="assets/img/service1.png" alt="">
                  </div>
                  <span class="service-circle"></span>
                  <div class="service-content">
                    <h4>Medical Checkup</h4>
                    <span>3Lorem ipsum dolor sit amet,tetur adipisicing elit, s consecteturu </span>
                  </div>
                </div>
                <div id="service_4" class="tab-pane">
                  <div class="service-img">
                    <img src="assets/img/service1.png" alt="">
                  </div>
                  <span class="service-circle"></span>
                  <div class="service-content">
                    <h4>Medical Checkup</h4>
                    <span>4Lorem ipsum dolor sit amet,tetur adipisicing elit, s consecteturu </span>
                  </div>
                </div>
                <div id="service_5" class="tab-pane">
                  <div class="service-img">
                    <img src="assets/img/service1.png" alt="">
                  </div>
                  <span class="service-circle"></span>
                  <div class="service-content">
                    <h4>Medical Checkup</h4>
                    <span>5Lorem ipsum dolor sit amet,tetur adipisicing elit, s consecteturu </span>
                  </div>
                </div>
                <div id="service_6" class="tab-pane">
                  <div class="service-img">
                    <img src="assets/img/service1.png" alt="">
                  </div>
                  <span class="service-circle"></span>
                  <div class="service-content">
                    <h4>Medical Checkup</h4>
                    <span>6Lorem ipsum dolor sit amet,tetur adipisicing elit, s consecteturu </span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4 col-sm-3">
            <ul  class="nav nav-pills wow fadeInLeftBig">
              <li>
                <a href="#service_4" data-toggle="tab" class="service-right" id="service4">
                  <aside></aside>
                  <h5>Gynological Services</h5>
                  <span>Lorem ipsum dolor sit ame hiijasdt, consectetur adipisicing elit, sed do eiu sed do eiu </span>
                </a>
              </li>
              <li>
                <a href="#service_5" data-toggle="tab" class="service-right" id="service5">
                  <aside></aside>
                  <h5>Gynological Services</h5>
                  <span>Lorem ipsum dolor sit ame hiijasdt, consectetur adipisicing elit, sed do eiu sed do eiu </span>
                </a>
              </li>
              <li>
                <a href="#service_6" data-toggle="tab" class="service-right" id="service6">
                  <aside></aside>
                  <h5>Gynological Services</h5>
                  <span>Lorem ipsum dolor sit ame hiijasdt, consectetur adipisicing elit, sed do eiu sed do eiu </span>
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
            <div class="basic-tabination">
              <div class="col-md-3 col-sm-4">
                <ul class="nav nav-pills nav-stacked wow fadeInLeft">
                  <li class="active"><a href="#branch_1" data-toggle="tab">Quezon City</a></li>
                  <li><a href="#branch_2" data-toggle="tab">Makati City</a></li>
                  <li><a href="#branch_3" data-toggle="tab">Mandaluyong City</a></li>
                  <li><a href="#branch_4" data-toggle="tab">Taguig City</a></li>
                </ul>
              </div>
              <div class="col-md-9 col-sm-8">
                <div class="tab-content wow fadeInRight">
                  <div id="branch_1" class="tab-pane fade in active">
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
                    <div class="clearfix"></div>
                  </div>
                  <div id="branch_2" class="tab-pane fade">
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
                    <div class="clearfix"></div>
                  </div>
                  <div id="branch_3" class="tab-pane fade">
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
                    <div class="clearfix"></div>
                  </div>
                  <div id="branch_4" class="tab-pane fade">
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
      </div>
      <div class="sec med-go">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <div class="wow fadeInUp">
                <h1>Need a medicine on the go?</h1>
                <span>You have a partner with us in affordable and effective medicine <br /> Call us <span style="color: #f57e2b;">(02) 234-2345</span> and let us help you.</span>
              </div>
              </div>
            <div class="col-md-6">
              <div class="wow fadeInDown">
                <img src="assets/img/medicine.png" style="width: 380px; "alt="">
              </div>
            </div>
          </div>
        </div>
      </div>

      <%@ include file="ContactUsForm.jsp"%>

    </section>

    <%@ include file="commons/CorporateFooter.jsp"%>

    <script  type="text/javascript" src="assets/js/owl.carousel.min.js"></script>

    <script type="text/javascript">
    	$("#menuCorporate a").addClass("active");
     	$(document).ready(function(){
        new WOW().init();
        $(".blue .nav li a").click(function(){
          $(".blue .nav li").removeClass("active");
        });

        function initCarousel(){
        	$('.owl-carousel').owlCarousel({
                loop:true,
                nav:true,
                items:1,
                autoplay:true,
                autoplayTimeout:5000,
                autoplayHoverPause: true,
            });
        }

        POST("SystemImages", {"app":"BUSINESS", "page":"Main", "module":"HEADER"}, function(data){
        	var imageCarousel = "";
        	$.each(data.data, function(index, value){
        		imageCarousel += '<div class="item"><img src="'+fileServer+value.image+'" alt=""></div>';
        	})
        	$("#imageCarousel").html(imageCarousel);
        	initCarousel();
        })
        
        POST("CorporateHeaderInfo", {}, function(data){
        	$("#headerInfo").html(data.content);
        })

        POST("CorporateServices", {}, function(data){
        	$.each(data, function(index, value){
        		$("#service"+index+" h5").html(value.title);
        		$("#service"+index+" span").html(value.content);

        		$("#service_"+index+" .service-content h4").html(value.title);
        		$("#service_"+index+" .service-content span").html(value.content2);

        		$("#service_"+index+" .service-img img").attr("src", fileServer+value.image);

        	})
        })

    	});
    </script>
  </body>
</html>
