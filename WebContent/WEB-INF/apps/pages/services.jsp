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
        <div id="headerInfo"></div>
        <div class="welcome-background" id="imageCarousel">
        </div>
      </div>
      <%@ include file="CorporateServices1.jsp"%>
      <%@ include file="CorporateServices2.jsp"%>
      <!-- <div class="sec">
        <div class="container">
          <div class="row text-center">
            <br>
            <div class="big-tabination">
              <div class="col-md-4">
                <ul class="nav nav-pills nav-stacked wow fadeInRight" id="servicesDataTitle">
                </ul>
              </div>
              <div class="col-md-8">
                <div class="tab-content service-content wow fadeInLeft" id="servicesDataContent">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div> -->
    </section>

    <%@ include file="commons/CorporateFooter.jsp"%>
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
	        	$("#headerInfo").html(data.data.content);
	        });

	        POST("SystemImages", {"app":"HOSPITALS", "page":"Service", "module":"HEADER"}, function(data){
	        	var imageCarousel = "";
	        	$.each(data.data, function(index, value){
	        		imageCarousel += '<div class="item"><img src="'+fileServer+value.image+'" alt=""></div>';
	        	})
	        	$("#imageCarousel").html(imageCarousel);
	        	//initCarousel();
	        })

	        POST("ServicesInformation", {"app": "HOSPITALS"}, function(data){
	        	data = data.data;
	        	var servicesDataTitle = "";
	        	var servicesDataContent = "";
	        	$.each(data, function(index, value){
	        		var isActive = "";
	        		if(index == 0){
	        			isActive = "active";
	        		}
	        		servicesDataTitle += '<li class="'+isActive+'">'+
		            	'<a href="#service_'+index+'" class="side" data-toggle="tab">'+
	                    '<aside></aside>'+
	                    '<h4>'+value.title+'</h4>'+
	                    '<span>'+value.content+'</span>'+
	                  '</a>'+
	                 '</li>';

	        		servicesDataContent += '<div id="service_'+index+'" class="tab-pane '+isActive+'">'+
	                    '<img src="'+fileServer+value.image+'" alt="">'+
	                    '<div>'+value.content2+'</div>'+
	                    '</div>';
	        	})
	        	$("#servicesDataTitle").html(servicesDataTitle);
	        	$("#servicesDataContent").html(servicesDataContent);
	        });
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
