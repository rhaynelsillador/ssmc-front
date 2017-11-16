<div class="sec info" id="featured-box-sec">
  <div class="container">
    <div class="row">
      <div class="col-sm-4 wow bounceInUp">
        <div class="box-flip">
          <div class="info-box">
            <img src="assets/img/icon-info1.png" class="icon-info" alt="">
            <h4></h4>
            <p></p>
            <%-- <div class="info-bg">
              <img src="assets/img/bg-info1.jpg" alt="">
            </div> --%>
            <div class="info-carousel">
              <div class="owl-carousel owl-theme">
                <div class="item"><img src="assets/img/bg-info1.jpg" alt=""></div>
                <div class="item"><img src="assets/img/bg-info2.jpg" alt=""></div>
                <div class="item"><img src="assets/img/bg-info1.jpg" alt=""></div>
                <div class="item"><img src="assets/img/bg-info2.jpg" alt=""></div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-4 wow bounceInUp">
        <div class="box-flip">
          <div class="info-box">
            <h4></h4>
            <p></p>
            <a href="Medical-ContactUs" class="btn">CONTACT US</a>
            <%-- <div class="info-bg">
              <img src="assets/img/bg-info2.jpg" alt="">
            </div> --%>
            <div class="info-carousel">
              <div class="owl-carousel owl-theme">
                <div class="item"><img src="assets/img/bg-info1.jpg" alt=""></div>
                <div class="item"><img src="assets/img/bg-info2.jpg" alt=""></div>
                <div class="item"><img src="assets/img/bg-info1.jpg" alt=""></div>
                <div class="item"><img src="assets/img/bg-info2.jpg" alt=""></div>
              </div>
            </div>
          </div>
        </div>

      </div>
      <div class="col-sm-4 wow bounceInUp">
        <div class="info-box news">
         <h4 class="text-center" id="news-header">NEW & UPDATES</h4>

          <div class="news-container">
          </div>
        </div>

      </div>
    </div>
  </div>
</div>

<script>

	$(document).ready(function(){
		POST("FeaturedBoxes", {"page":"Medical"}, function(data){
			$.each(data, function(index, value){
	    		$(".box-"+value.box+" > h4").html(value.name.toUpperCase());
	    		$(".box-"+value.box+" > p").html(value.description);
	    	})
		})

		POST("NewsAndUpdatePublished", {}, function(data){
			var html = "";
			$.each(data, function(index, value){
				html += '<div class="news-box">';
				html += '<div class="news-img">';
				html += '<img id="news-update-image-'+value.id+'">';
				html += '</div>';
				html += '<div class="news-content">';
				html += '<span><strong class="news-title">'+value.title+'</strong>'+value.news+'</span>';
				html += '<a href="News2?news='+value.id+'&button=NEXT&news-title='+value.title+'">Learn more</a>';
				html += '</div></div>';
				POST("NewsAndUpdatePublishedImages/"+value.id, {}, function(imgData){
					if(imgData.length >= 1){
						$("#news-update-image-"+value.id).attr("src", fileServer+imgData[0].image);
					}
				})
	    	})
	    	if(html == ""){
	    		$("#news-header").html("NO UPDATES");
	    	}else{
	    		$(".news-container").html("<div>"+html+"</div>");
	    		ticker();
	    	}
		})
	})


	function ticker(){
		$('.news-container').easyTicker({
	        direction: 'up',
	        easing: 'swing',
	        speed: 'slow',
	        interval: 3000,
	        height: 'auto',
	        visible: 3,
	        mousePause: 1,
	        controls: {
	        up: '',
	        down: '',
	        toggle: '',
	        playText: 'Play',
	        stopText: 'Stop'
	        }
	      });
	}

  $('.info-carousel .owl-carousel').owlCarousel({
    loop:true,
    nav:true,
    items:1,
    autoplay:true,
    autoplayTimeout:5000,
  })


</script>
