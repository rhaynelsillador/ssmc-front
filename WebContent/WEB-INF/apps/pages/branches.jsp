<!DOCTYPE html>
<html>
  <%@ include file="commons/Assets.jsp"%>
  <link rel="stylesheet" href="assets/css/custom/corporate.css">
  <body class="inner-page">
    <%@ include file="commons/SSMCHospitalsHeader.jsp"%>
    <%@ include file="commons/Preloader.jsp"%>
    <section>
      <div class="sec welcome welcome-common">
        <h1 id="headerTitle">Hospitals and Clinics</h1>
        <span id="headerContent"></span>
        <!-- <div class="welcome-background"> -->
        <div class="welcome-background" id="imageCarousel">
          <img src="assets/img/banner-branch.jpg" alt="">
        </div>
      </div>
      <%@ include file="branchesList.jsp"%>
    </section>

    <%@ include file="commons/SSMCHospitalsFooter.jsp"%>

   <!--  <script src="https://maps.googleapis.com/maps/api/js?callback=myMap"></script> -->
    <script type="text/javascript">
    	$("#menuBranches a").addClass("active");
      	$(document).ready(function(){
	        console.log("G!");
          // preloader();
          wow = new WOW({offset: 300});
          wow.init();

	        $(".blue .nav li a").click(function(){
	          console.log("gg");
	          $(".blue .nav li").removeClass("active");
	        });

	        POST("SystemImages", {"app":"HOSPITALS", "page":"HospitalAndClinic", "module":"HEADER"}, function(data){
	        	var imageCarousel = "";
	        	$.each(data.data, function(index, value){
	        		imageCarousel += '<div class="item"><img src="'+fileServer+value.image+'" alt=""></div>';
	        	})
	        	$("#imageCarousel").html(imageCarousel);
	        	//initCarousel();
	        })

	        POST("HeadersInformation", {"app" : "HOSPITALS", "page" : "HospitalAndClinic"}, function(data){
	        	if(data.data){
	        		data = data.data;
		        	$("#headerContent").html(data.content);
	        	}
	        })
      	});

        // function preloader() {
        //   $("header,section,footer").hide()
        //
        //   $(window).load(function(){
        //     $("header,section,footer").fadeIn();
        //     setTimeout(function(){ $('#preloader').fadeOut('slow'); }, 500);
        //     console.log("peace out");
        //   });
        //
        // }
    </script>
  </body>
</html>
