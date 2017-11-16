<div class="sec med-promo">
  <div class="welcome-carousel owl-carousel" id="advertisementImageCarousel">
  </div>
</div>

<script>
	
	$(document).ready(function(){
		POST("AdvertisementList", {}, function(data){
        	var imageCarousel = "";
        	$.each(data, function(index, value){
        		imageCarousel += '<div class="item"><img src="'+fileServer+value.image+'" alt=""></div>';
        	})
        	$("#advertisementImageCarousel").html(imageCarousel);
        	initAdsCarousel("advertisementImageCarousel");
        })
	})
	

</script>