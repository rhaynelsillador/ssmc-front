<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <%@ include file="../commons/Assets.jsp"%>

  <%-- Owl Carousel --%>
  <link rel="stylesheet" href="assets/css/vendor/owl.carousel.min.css">

  <%-- <link rel="stylesheet" href="assets/css/custom/corporate.css"> --%>
  <body class="home">
  	<%@ include file="../commons/SSMCHealthClinicsHeader.jsp"%>
    <%@ include file="../commons/Preloader.jsp"%>

    <section>
      <div class="sec welcome">
        <div class="welcome-content wow fadeIn">
          <h3>Welcome to</h3>
		  <h1>SSMC Clinics</h1>
          <div id="headerInfo"></div>
          <br>
          <a href="#" class="btn btn-default hvr-grow">EXPLORE NOW</a>
          <a href="Medical-ContactUs" class="btn btn-primary hvr-grow">CONTACT US</a>
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
                <div class="info-bg">
                  <img src="assets/img/bg-info1.jpg" alt="">
                </div>
              </div>

            </div>
            <div class="col-sm-4 wow bounceInUp">
              <div class="info-box emergency-care">
                <h4>EMERGENCY CARE</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Dui </p>
                <a href="#" class="btn">CONTACT US</a>
                <div class="info-bg">
                  <img src="assets/img/bg-info2.jpg" alt="">
                </div>
              </div>

            </div>
            <div class="col-sm-4 wow bounceInUp">
              <div class="info-box qualified-doctors">
                <img src="assets/img/icon-info2.png" class="icon-info" alt="">
                <h4>QUALIFIED DOCTORS</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Dui </p>
                <div class="info-bg">
                  <img src="assets/img/bg-info3.jpg" alt="">
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>


      <%@ include file="../CorporateServices1.jsp"%>
	  <%@ include file="../CorporateServices2.jsp"%>
	  <%@ include file="../branchesList.jsp"%>
	  <%@ include file="../Advertisement.jsp"%>

      <%@ include file="../ContactUsForm.jsp"%>

    </section>

    <%@ include file="../commons/CorporateFooter.jsp"%>



    <script type="text/javascript">
    	$("#menuCorporate a").addClass("active");
     	$(document).ready(function(){
	        // preloader();
          wow = new WOW({offset: 300});
          wow.init();
	        $(".blue .nav li a").click(function(){
	          $(".blue .nav li").removeClass("active");
	        });

	        POST("SystemImages", {"app":"CLINIC", "page":"Medical", "module":"HEADER"}, function(data){
	        	var imageCarousel = "";
	        	$.each(data.data, function(index, value){
	        		imageCarousel += '<div class="item"><img src="'+fileServer+value.image+'" alt=""></div>';
	        	})
	        	$("#imageCarousel").html(imageCarousel);
	        	initCarousel();
	        })

	        POST("HeadersInformation", {"app":"CLINIC", "page":"Medical"}, function(data){
	        	$("#headerInfo").html(data.data.content);
	        });
    	});

    </script>
  </body>
</html>
