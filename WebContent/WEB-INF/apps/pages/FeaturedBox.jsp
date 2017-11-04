<div class="sec info">
  <div class="container">
    <div class="row">
      <div class="col-sm-4 wow slideInUp">
        <div class="info-box box-1">
          <img src="assets/img/icon-info1.png" class="icon-info" alt="">
          <h4></h4>
          <p></p>
          <div class="info-bg">
            <img src="assets/img/bg-info1.jpg" alt="">
          </div>
        </div>

      </div>
      <div class="col-sm-4 wow slideInUp">
        <div class="info-box box-2">
          <h4></h4>
          <p> </p>
          <a href="ContactUs" class="btn">CONTACT US</a>
          <div class="info-bg">
            <img src="assets/img/bg-info2.jpg" alt="">
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
		POST("FeaturedBoxes", {"page":"Hospital"}, function(data){
			console.log("FeaturedBoxes L ", data);
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
				html += '<img src="assets/img/small1.jpg" alt="">';
				html += '</div>';
				html += '<div class="news-content">';
				html += '<span><strong class="news-title">'+value.title+'</strong>'+value.news+'</span>';
				html += '<a href="News?news='+value.id+'&button=NEXT&news-title='+value.title+'">Learn more</a>';
				html += '</div></div>';
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

</script>