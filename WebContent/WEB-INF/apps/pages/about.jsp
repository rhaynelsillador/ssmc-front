<!DOCTYPE html>
<html>
  <%@ include file="commons/Assets.jsp"%>
  <link rel="stylesheet" href="assets/css/custom/corporate.css">
  <body>
    <%@ include file="commons/SSMCHospitalsHeader.jsp"%>
    <%@ include file="commons/Preloader.jsp"%>
    <section id="about">
      <div class="sec welcome welcome-common">
        <h1 id="aboutUsHeaderTitle">About us</h1>
        <span id="aboutUsHeaderContent">We have the most advance medical <br /> technology and innovations</span>
        <div class="welcome-background" id="imageCarousel">
        </div>

      </div>
      <div class="sec branch">
        <div class="container">
          <div class=" text-center">
            <br>
            <div class="basic-tabination">
                <div class="tab-about wow fadeInRight" id="aboutUsContent">
                </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <%@ include file="commons/SSMCHospitalsFooter.jsp"%>

    <script type="text/javascript">
    $("#menuAbout a").addClass("active");
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

	POST("AboutUsHeaderInfo", {}, function(data){
	 	$("#aboutUsHeaderTitle").html(data.title);
	 	$("#aboutUsHeaderContent").html(data.content);
	})

	POST("SystemImages", {"app":"HOSPITALS", "page":"About", "module":"HEADER"}, function(data){
        	var imageCarousel = "";
        	$.each(data.data, function(index, value){
        		imageCarousel += '<div class="item"><img src="'+fileServer+value.image+'" alt=""></div>';
        	})
        	$("#imageCarousel").html(imageCarousel);
        })

	POST("AboutUsInformation?app=HOSPITALS", {}, function(data){
		data = data.data
		console.log(data);
		var aboutUsMenus  = "";
		var aboutUsContent = "";
   		for (var i = 0; i < data.length; i++) {
    		  console.log(data[i]);
    		  if(i == 0){
    			  aboutUsMenus += '<li class="active"><a href="#about_'+i+'" data-toggle="tab">'+data[i].name+'</a></li>';
    			  aboutUsContent += '<div id="about_'+i+'" class="tab-pane active">'+
                       '<h3>'+data[i].name+'</h3>'+
                       '<br>'+
                       '<div class="about-img">'+
                         '<img src="'+fileServer+data[i].image+'" alt="">'+
                       '</div>'+
                       '<br>'+
                       '<div class="about-info">'+
                       '<span>'+data[i].content+'</span>'+
                     '</div>'+
                   '</div>';
    		  }else{
    			  aboutUsMenus += '<li><a href="#about_'+i+'" data-toggle="tab">'+data[i].name+'</a></li>';
    			  aboutUsContent += '<div id="about_'+i+'" class="tab-pane">'+
	                  '<h3>'+data[i].name+'</h3>'+
	                  '<br>'+
	                  '<div class="about-img">'+
	                    '<img src="'+fileServer+data[i].image+'" alt="">'+
	                  '</div>'+
	                  '<br>'+
	                  '<div class="about-info">'+
	                  '<span>'+data[i].content+'</span>'+
	                '</div>'+
	              '</div>';
    		  }

		}
   		$("#aboutUsMenus").html(aboutUsMenus);
   		$("#aboutUsContent").html(aboutUsContent);
	})

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
