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
          <a href="Medical-HMO" class="btn btn-default hvr-grow">SSMC HMO</a>
          <a href="Medical-ContactUs" class="btn btn-primary hvr-grow">CONTACT US</a>
        </div>
          <div class="welcome-carousel owl-carousel owl-theme" id="imageCarousel">
          </div>
      </div>
	
	  <%@ include file="../medical/FeaturedBoxes.jsp"%>
      <%-- <%@ include file="../medical/MedicalServices1.jsp"%> --%>
	  <%@ include file="../medical/MedicalServices2.jsp"%>
	  <%@ include file="../branchesList.jsp"%>
	  <%@ include file="../Advertisement.jsp"%>

      <%@ include file="../ContactUsForm.jsp"%>

    </section>

    <%@ include file="../commons/SSMCHealthClinicFooter.jsp"%>



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
	        	if(data.data){
	        		$("#headerInfo").html(data.data.content);
	        	}
	        });
    	});


      

    </script>
  </body>
</html>
