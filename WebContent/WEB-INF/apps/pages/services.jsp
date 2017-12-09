<!DOCTYPE html>
<html>
  <%@ include file="commons/Assets.jsp"%>
  <link rel="stylesheet" href="assets/css/custom/corporate.css">
  <body>
    <%@ include file="commons/SSMCHospitalsHeader.jsp"%>
    <%@ include file="commons/Preloader.jsp"%>
    <section>
      <div class="sec welcome welcome-common">
        <h1>Service</h1>
        <span id="headerContent"></span>
        <div class="welcome-background" id="imageCarousel">
        </div>
      </div>
      <%@ include file="CorporateServices1.jsp"%>
      <%@ include file="CorporateServices2.jsp"%>
    </section>

    <%@ include file="commons/SSMCHospitalsFooter.jsp"%>
    <script type="text/javascript">
    	$("#menuAServices a").addClass("active");
    	$(document).ready(function(){
	        console.log("G!");
          // preloader();
          wow = new WOW({offset: 300});
          wow.init();
	        $(".blue .nav li a").click(function(){
	          console.log("gg");
	          $(".blue .nav li").removeClass("active");
	        });

	        POST("HeadersInformation", {"app":"HOSPITALS", "page":"Service"}, function(data){
	        	console.log(data);
	        	$("#headerContent").html(data.data.content);
	        });

	        POST("SystemImages", {"app":"HOSPITALS", "page":"Service", "module":"HEADER"}, function(data){
	        	var imageCarousel = "";
	        	$.each(data.data, function(index, value){
	        		imageCarousel += '<div class="item"><img src="'+fileServer+value.image+'" alt=""></div>';
	        	})
	        	$("#imageCarousel").html(imageCarousel);
	        	//initCarousel();
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
