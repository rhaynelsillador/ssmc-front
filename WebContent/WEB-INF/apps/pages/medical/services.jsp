<!DOCTYPE html>
<html>
  <%@ include file="../commons/Assets.jsp"%>
  <%-- <link rel="stylesheet" href="assets/css/custom/corporate.css"> --%>
  <body>
    <%@ include file="../commons/SSMCHealthClinicsHeader.jsp"%>
    <%@ include file="../commons/Preloader.jsp"%>
    <section>
      <div class="sec welcome welcome-common">
        <h1>Service</h1>
        <div id="headerInfo"></div>
        <div class="welcome-background" id="imageCarousel">
        </div>
      </div>
      <%-- <%@ include file="../medical/MedicalServices1.jsp"%> --%>
	  <%@ include file="../medical/MedicalServices2.jsp"%>
    </section>

    <%@ include file="../commons/SSMCHealthClinicFooter.jsp"%>
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

	        POST("HeadersInformation", {"app":"CLINIC", "page":"Service"}, function(data){
	        	if(data.data){
	        		$("#headerInfo").html(data.data.content);
	        	}
	        });

	        POST("SystemImages", {"app":"CLINIC", "page":"Service", "module":"HEADER"}, function(data){
	        	var imageCarousel = "";
	        	$.each(data.data, function(index, value){
	        		imageCarousel += '<div class="item"><img src="'+fileServer+value.image+'" alt=""></div>';
	        	})
	        	$("#imageCarousel").html(imageCarousel);
	        })
      	});
    </script>
  </body>
</html>
