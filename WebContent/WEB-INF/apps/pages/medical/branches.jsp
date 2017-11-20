<!DOCTYPE html>
<html>
  <%@ include file="../commons/Assets.jsp"%>
  <%-- <link rel="stylesheet" href="assets/css/custom/corporate.css"> --%>
  <body>
    <%@ include file="../commons/SSMCHealthClinicsHeader.jsp"%>
    <%@ include file="../commons/Preloader.jsp"%>
    <section>
      <div class="sec welcome welcome-common">
        <h1 id="headerTitle">Hospitals and Clinics</h1>
        <span id="headerContent">We have the most advance medical <br /> technology and innovations</span>
        <div class="welcome-background">
          <img src="assets/img/banner-branch.jpg" alt="">
        </div>
      </div>
      <%@ include file="../branchesList.jsp"%>
    </section>

    <%@ include file="../commons/SSMCHealthClinicFooter.jsp"%>

   <!--  <script src="https://maps.googleapis.com/maps/api/js?callback=myMap"></script> -->
    <script type="text/javascript">
    	$("#menuBranches a").addClass("active");
      	$(document).ready(function(){
          wow = new WOW({offset: 300});
          wow.init();

	        $(".blue .nav li a").click(function(){
	          $(".blue .nav li").removeClass("active");
	        });

	        POST("HeadersInformation", {"app" : "CLINIC", "page" : "HospitalAndClinic"}, function(data){
	        	data = data.data;
	        	if(data){
	        		$("#headerTitle").html(data.title);
		        	$("#headerContent").html(data.content);
	        	}
	        	
	        })
      	});
    </script>
  </body>
</html>
