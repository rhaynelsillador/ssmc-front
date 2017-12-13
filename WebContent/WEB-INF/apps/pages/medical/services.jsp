<!DOCTYPE html>
<html>
  <%@ include file="../commons/Assets.jsp"%>
  <%-- <link rel="stylesheet" href="assets/css/custom/corporate.css"> --%>
  <body class="inner-page">
    <%@ include file="../commons/SSMCHealthClinicsHeader.jsp"%>
    <%@ include file="../commons/Preloader.jsp"%>
    <section class="service-inner">
      <div class="sec welcome welcome-common">
        <h1>Service</h1>
        <span id="headerContent"></span>
        <div class="welcome-background" id="imageCarousel">
        </div>
      </div>
      <%-- <%@ include file="../medical/MedicalServices1.jsp"%> --%>
	  <%-- <%@ include file="../medical/MedicalServices1.jsp"%> --%>
	  <div class="sec choose">
		  <div class="container">
		    <div class="choose row text-center">
		      <span class="header-span">Why choose <strong>SSMC</strong></span>
		      <h3>WE PROVIDE THE BEST SERVICE</h3>
		      <br>
		      <div class="big-tabination">
		        <div class="col-md-3 col-sm-4">
		          <ul class="nav nav-pills nav-stacked wow fadeInRight" id="corporateServicesTitle1">
		          </ul>
		        </div>
		        <div class="col-md-9 col-sm-8">
		          <div class="tab-content choose-content wow fadeInLeft"  id="corporateServicesContent1"></div>
		        </div>
		      </div>
		    </div>
        <div class="clearfix"></div>
        <br>
	    	<a href="Medical-Services?page=0" class="btn btn-warning" id="previousBtn">Previous</a>
	    	<a href="Medical-Services?page=1" class="btn btn-warning" id="nextBtn">Next</a>
        <div class="clearfix"></div>
        <br>
		  </div>
		</div>


    </section>

    <%@ include file="../commons/SSMCHealthClinicFooter.jsp"%>
    <script type="text/javascript">
    	$("#menuAServices a").addClass("active");
    	$(document).ready(function(){
       	  wow = new WOW({offset: 300});
          wow.init();

	        $(".blue .nav li a").click(function(){
	          $(".blue .nav li").removeClass("active");
	        });

	        POST("HeadersInformation", {"app":"CLINIC", "page":"Service"}, function(data){
	        	if(data.data){
	        		$("#headerContent").html(data.data.content);
	        	}
	        });

	        POST("SystemImages", {"app":"CLINIC", "page":"Service", "module":"HEADER"}, function(data){
	        	var imageCarousel = "";
	        	$.each(data.data, function(index, value){
	        		imageCarousel += '<div class="item"><img src="'+fileServer+value.image+'" alt=""></div>';
	        	})
	        	$("#imageCarousel").html(imageCarousel);
	        })

	        var page = getUrlParameter("page") ? getUrlParameter("page") : 0;

	        if(page <= 0){
	        	$("#previousBtn").attr("disabled", true);
	        }else{
	        	$("#previousBtn").attr("href", "Medical-Services?page="+(parseInt(page)-1));
	        }

	        $("#nextBtn").attr("href", "Medical-Services?page="+(parseInt(page)+1));

	        POST("ServicesInformation", {"app": "CLINIC", "num":2, "limit" : 15, "pageNum" : page}, function(data){
	    		data = data.data;
	    		if(data.length <= 15){
	    			$("#nextBtn").attr("disabled", "disabled");
	    		}
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
	    			corporateServicesTitle1 += '<li class="'+isActive+'">'+
	    				'<a href="#service_'+index+'" class="side service1-tab" data-toggle="tab" data-isLoaded="'+isloaded+'" data-id="'+value.id+'">'+
	    	            // '<aside></aside>'+
	    	            '<h5>'+value.name+'</h5>'+
	    	            // '<span>'+value.content+'</span>'+
	    	          	'</a>'+
	    	         '</li>';

	    	         corporateServicesContent1 += '<div id="service_'+index+'" class="tab-pane '+isActive+'">'+
	    	         '<div class="welcome-carousel owl-carousel" id="service_images_'+value.id+'"></div><div class="clearfix"></div><br><div>'+value.content2+'</div></div>';

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

      	});
    </script>
  </body>
</html>
