<!DOCTYPE html>
<html>
  <%@ include file="commons/Assets.jsp"%>
  <link rel="stylesheet" href="assets/css/custom/corporate.css">
  <body class="inner-page">
    <%@ include file="commons/SSMCHospitalsHeader.jsp"%>
    <%@ include file="commons/Preloader.jsp"%>
    <section>
      <div class="sec welcome welcome-common">
        <h1>Careers</h1>
        <span id="headerContent"></span>
        <div class="welcome-background" id="imageCarousel">
        </div>
      </div>
      <div class="sec choose">
		  <div class="container">
		    <div class="choose row text-center">
		      <span class="header-span">Career Opportunities with <strong>SSMC</strong></span>
		      <h3>SSMC Group of Hospitals and Clinics urgently needs:</h3>
		      <br>
		      <div class="big-tabination">
		        <div class="col-md-4 col-sm-5">
		          <ul class="nav nav-pills nav-stacked wow fadeInRight" id="corporateServicesTitle1">
		          </ul>
		        </div>
		        <div class="col-md-8 col-sm-7">
		          <div class="tab-content choose-content wow fadeInLeft"  id="corporateServicesContent1">

		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
    </section>

    <%@ include file="commons/SSMCHospitalsFooter.jsp"%>
    <script type="text/javascript">
    	$("#menuCareers a").addClass("active");
    	$(document).ready(function(){
          wow = new WOW({offset: 300});
          wow.init();
	        $(".blue .nav li a").click(function(){
	          $(".blue .nav li").removeClass("active");
	        });

	        POST("HeadersInformation", {"app":"HOSPITALS", "page":"Careers"}, function(data){
	        	if(data.data){
	        		$("#headerContent").html(data.data.content);
	        	}

	        });

	        POST("SystemImages", {"app":"HOSPITALS", "page":"Careers", "module":"HEADER"}, function(data){
	        	var imageCarousel = "";
	        	$.each(data.data, function(index, value){
	        		imageCarousel += '<div class="item"><img src="'+fileServer+value.image+'" alt=""></div>';
	        	})
	        	$("#imageCarousel").html(imageCarousel);
	        	initCarousel();
	        })

	        POST("ServicesInformation", {"app": "HOSPITALS", "num":3, "limit" : 4}, function(data){
	    		data = data.data;
	    		var corporateServicesTitle1 = "";
	    		var corporateServicesContent1 = "";
	    		var defaultServices;
	    		$.each(data, function(index, value){
	    			var isActive = "", isloaded = false;
	    			if(index == 0){
	    				isActive = "active";
	    				defaultServices = value.id;
	    				isloaded = true;
	    			}

	    			console.log(value.content2);

	    			corporateServicesTitle1 += '<li class="'+isActive+'">'+
	    				'<a href="#service_'+index+'" class="side service1-tab" data-toggle="tab" data-isLoaded="'+isloaded+'" data-id="'+value.id+'">'+
	    	            '<aside></aside>'+
	    	            '<h5>'+value.name+'</h5>'+
	    	            '<span>'+value.content2+'</span>'+
	    	          	'</a>'+
	    	         '</li>';

	    	         corporateServicesContent1 += '<div id="service_'+index+'" class="tab-pane '+isActive+'">'+
	    	         '<div><div class="welcome-carousel owl-carousel" id="service_images_'+value.id+'"></div></div><span>'+value.content2+'</span></div>';

	    		})
	    		$("#corporateServicesTitle1").html(corporateServicesTitle1);
	    		$("#corporateServicesContent1").html(corporateServicesContent1);
	    		if(defaultServices){
	    			retrieveImagesService1(defaultServices);
	    		}
	    		$(".service1-tab").click(function(e){
	    			var tabData = $(this).data();
	    			if(tabData.isloaded == false){
	    				$(this).data("isloaded", true);
	    				retrieveImagesService1(tabData.id)
	    			}
	    		})
	    	});
      	});

    	function retrieveImagesService1(id){
    		POST("ImagesByModuleId", {"num" : id, "module":"SERVICE"}, function(data){
    			var imageCarousel = "";
            	$.each(data, function(index, value){
            		imageCarousel += '<div class="item"><img src="'+fileServer+value.image+'" alt=""></div>';
            	})
            	$("#service_images_"+id).html(imageCarousel);
            	initAdsCarousel("service_images_"+id);
    		});
    	}
    </script>
  </body>
</html>
