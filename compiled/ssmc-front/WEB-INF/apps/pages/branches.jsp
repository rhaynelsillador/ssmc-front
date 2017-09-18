<!DOCTYPE html>
<html>
  <%@ include file="commons/Assets.jsp"%>
  <body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-6" data-genuitec-path="/ssmc-front/WebContent/WEB-INF/apps/pages/branches.jsp">
    <%@ include file="commons/CorporateHeader.jsp"%>
    <section data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-6" data-genuitec-path="/ssmc-front/WebContent/WEB-INF/apps/pages/branches.jsp">
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
          preloader();
          new WOW().init();

	        $(".blue .nav li a").click(function(){
	          console.log("gg");
	          $(".blue .nav li").removeClass("active");
	        });

	        POST("HeadersInformation", {"app" : "BUSINESS", "page" : "HospitalAndClinic"}, function(data){
	        	data = data.data;
	        	$("#headerTitle").html(data.title);
	        	$("#headerContent").html(data.content);
	        })

	        POST("Cities", {}, function(data){
	        	console.log(data);
	        	var cityList = "";
	        	for (index = 0; index < data.length; ++index) {
	        	    console.log(data[index]);
	        	    if(index == 0){
	        	    	cityList += '<li class="active"><a href="#'+data[index].cityKey+'" data-toggle="tab">'+data[index].name+'</a></li>';
	        	    }else{
	        	    	cityList += '<li><a href="#'+data[index].cityKey+'" data-toggle="tab">'+data[index].name+'</a></li>';
	        	    }
	        	}
	        	$('#clinicCities').html(cityList)
	        })


      	});
		
        function preloader() {
          $("header,section,footer").hide()

          $(window).load(function(){
            $("header,section,footer").fadeIn();
            setTimeout(function(){ $('#preloader').fadeOut('slow'); }, 500);
            console.log("peace out");
          });

        }
    </script>
  </body>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"59876",secure:"59881"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></html>
