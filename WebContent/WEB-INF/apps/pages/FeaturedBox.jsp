<div class="sec info" id="featured-box-sec">
  <div class="container">
    <div class="row">
      <div class="col-sm-4 wow bounceInUp">
        <div class="info-box">
          <h4>Careers</h4>
          <div class="career-container">
            <div id="careers"></div>
          </div>
        </div>

      </div>
      <div class="col-sm-4 wow bounceInUp">
        <div class="info-box box-2">
          <h4></h4>
          <p> </p>
          <a href="ContactUs" class="btn">CONTACT US</a>
          <%-- <div class="info-bg">
            <img src="assets/img/bg-info2.jpg" alt="">
          </div> --%>
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
		POST("ServicesInformation", {"app":"HOSPITALS", "num":3}, function(data){
			console.log("FeaturedBoxes ServicesInformation ", data);
			var html = "";
			$.each(data.data, function(index, value){
				console.log(value);

				html += '<div class="item">'+
	                '<h5>Medical Technologist</h5>'+
	                value.content2+
	              	'</div>';
			})
			$("#careers").html(html);
      $("#careers").mCustomScrollbar();
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
				html += '<a href="News?news='+value.id+'&button=NEXT&news-title='+value.title+'">Learn more</a>';
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



</script>
