<!DOCTYPE html>
<html>
  <%@ include file="commons/Assets.jsp"%>
  <link rel="stylesheet" href="assets/css/custom/corporate.css">
  <body>
    <%@ include file="commons/CorporateHeader.jsp"%>
    <%@ include file="commons/Preloader.jsp"%>
    <section>
      <div class="sec welcome welcome-common">
        <h1 id="headerTitle">Hospitals and Clinics</h1>
        <span id="headerContent">We have the most advance medical <br /> technology and innovations</span>
        <div class="welcome-background">
          <img src="assets/img/banner-branch.jpg" alt="">
        </div>
      </div>
      <%@ include file="branchesList.jsp"%>
    </section>

    <%@ include file="commons/CorporateFooter.jsp"%>

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

	        POST("HeadersInformation", {"app" : "BUSINESS", "page" : "HospitalAndClinic"}, function(data){
	        	data = data.data;
	        	$("#headerTitle").html(data.title);
	        	$("#headerContent").html(data.content);
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
