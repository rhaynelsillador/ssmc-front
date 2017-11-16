<div class="sec choose">
  <div class="container">
    <div class="choose row text-center">
      <span class="header-span">Why choose <strong>SSMC</strong></span>
      <h3>WE PROVIDE THE BEST SERVICE</h3>
      <br>
      <div class="big-tabination">
        <div class="col-md-4 col-sm-5">
          <ul class="nav nav-pills nav-stacked wow fadeInRight" id="corporateServicesTitle1">
          </ul>
        </div>
        <div class="col-md-8 col-sm-7">
          <div class="tab-content choose-content wow fadeInLeft"  id="corporateServicesContent1">
            <div id="choose_1" class="tab-pane active">
              <img src="assets/img/banner.png" alt="">
            </div>
            <div id="choose_2" class="tab-pane">
              <img src="assets/img/banner2.png" alt="">
            </div>
            <div id="choose_3" class="tab-pane">
              <img src="assets/img/banner.png" alt="">
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script>

	POST("ServicesInformation", {"app": "CLINIC", "num":1, "limit" : 3}, function(data){
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
			corporateServicesTitle1 += '<li class="'+isActive+'">'+
				'<a href="#service_'+index+'" class="side service1-tab" data-toggle="tab" data-isLoaded="'+isloaded+'" data-id="'+value.id+'">'+
	            '<aside></aside>'+
	            '<h5>'+value.name+'</h5>'+
	            '<span>'+value.content+'</span>'+
	          	'</a>'+
	         '</li>';
	         
	         corporateServicesContent1 += '<div id="service_'+index+'" class="tab-pane '+isActive+'">'+
	         '<div class="welcome-carousel owl-carousel" id="service_images_'+value.id+'"></div></div>';
	         
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
</script>
