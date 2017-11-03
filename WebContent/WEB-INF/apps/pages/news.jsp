<!DOCTYPE html>
<html>
  <%@ include file="commons/Assets.jsp"%>
  <link rel="stylesheet" href="assets/css/custom/corporate.css">

  <body>
  	<%@ include file="commons/SSMCHospitalsHeader.jsp"%>
    <%@ include file="commons/Preloader.jsp"%>
    <section id="faq">
      <div class="sec">
        <%-- <div class="wow fadeInUp"> --%>
          <div class="container">
            <div class="main-news-img" id="imageCarousel"></div>
            <strong class="main-news-title"></strong>
            <br>
            <span class="main-news-date"></span>
            <br>
            <br>
            <p class="main-news-content"></p>
            
            <a href="" class="btn btn-danger pull-left" id="previousBtn">PREVIOUS</a>
       		<a href="" class="btn btn-danger pull-right" id="nextBtn">NEXT</a>
          </div>
       	
      </div>
    </section>
    <%@ include file="commons/SSMCHospitalsFooter.jsp"%>
    <script type="text/javascript">
    	$("#menuFaq a").addClass("active");
      	$(document).ready(function(){
	        console.log("G!");
	        // preloader();
	        wow = new WOW({offset: 300});
	        wow.init();
	        $(".blue .nav li a").click(function(){
	          console.log("gg");
	          $(".blue .nav li").removeClass("active");
	        });
      	});
      	var params = {
      		"id" : getUrlParameter("news")
      	}
      	
      	POST("NewsAndUpdateCurrent", params, function(data){
      		if(data){
      			$(".main-news-title").html(data.title);
      			$(".main-news-date").html("Posted on " + moment(data.date).format("MMM DD YYYY hh:mm A"));
      			$(".main-news-content").html(data.news);
      			if(data.images.length > 0){
      				var imageCarousel = "";
        	      	$.each(data.images, function(index, value){
        	      		imageCarousel += '<div class="item"><img src="'+fileServer+value.image+'" alt=""></div>';
        	     	})
        	     	$("#imageCarousel").html(imageCarousel);
        	      	initNewsCarousel();
      			}else{
      				$("#imageCarousel").remove();
      			}
      			
      		}
      	})
      	
      	if(getUrlParameter("news")){
      		params.button = "PREVIOUS";
    		POST("NewsAndUpdateCurrent", params, function(data){
    			console.log(data);
    			if(data.id != 0 || data.title != null){
    				$("#previousBtn").prop("href", "News?news="+data.id+"&button=PREVIOUS");
    			}else{
    				$("#previousBtn").remove();
    			}
    		})
      	}else{
      		$("#previousBtn").remove();
      	}
      	
		params.button = "NEXT";
		POST("NewsAndUpdateCurrent", params, function(data){
			if(data.id != 0 || data.title != null){
				$("#nextBtn").prop("href", "News?news="+data.id+"&button=NEXT&news-title="+data.title);
			}else{
				$("#nextBtn").remove();
			}
		})
		
      	function initNewsCarousel(){
      		$('#imageCarousel').owlCarousel({
                loop:true,
                nav:true,
                items:1,
                autoplay:true,
                autoplayTimeout:8000,
                animateOut: 'fadeOut',
                animateIn: 'fadeIn',
                autoplayHoverPause:true
            });
      	}
    </script>
  </body>
</html>
