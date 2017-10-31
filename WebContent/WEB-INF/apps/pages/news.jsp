<!DOCTYPE html>
<html>
  <%@ include file="commons/Assets.jsp"%>
  <link rel="stylesheet" href="assets/css/custom/corporate.css">

  <body>
  	<%@ include file="commons/SSMCHospitalsHeader.jsp"%>
    <%@ include file="commons/Preloader.jsp"%>
    <section id="faq">
      <%-- <div class="sec welcome welcome-common">
        <h1 id="headerTitle">Industrial Medicine</h1>
        <span id="headerContent"></span>
        <div class="welcome-background" id="imageCarousel">
        </div>
      </div> --%>
      <div class="sec">
        <%-- <div class="wow fadeInUp"> --%>
          <div class="container">
            <div class="main-news-img">
              <img src="assets/img/bg-contact.jpg" alt="">
            </div>

            <strong class="main-news-title">Bacon Lorem ipsum dolor sit amet</strong>
            <br>
            <span class="main-news-date">December 25, 2017</span>
            <br>
            <br>

            <p class="main-news-content">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. <br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
          </div>
        <%-- </div> --%>
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

      //   POST("SystemImages", {"app":"HOSPITALS", "page":"Faq", "module":"HEADER"}, function(data){
      //   	var imageCarousel = "";
      //   	$.each(data.data, function(index, value){
      //   		imageCarousel += '<div class="item"><img src="'+fileServer+value.image+'" alt=""></div>';
      //   	})
      //   	$("#imageCarousel").html(imageCarousel);
      //   	initCarousel();
      //   })
      //
      //   POST("HeadersInformation", {"app" : "HOSPITALS", "page" : "Faq"}, function(data){
      //   	if(data.data){
      //   		$("#headerContent").html("<p>"+data.data.content+"</p>");
      //   	}
      //   })
      //
      //   POST("FaqInformation", {"app" : "HOSPITALS"}, function(data){
      //   	console.log(data);
      //   	var faqBodyTitle = "";
      //   	var faqBodyContent = "";
      //   	$.each(data, function(index, value){
      //   		var isActive = "";
      //   		if(index == 0){
      //   			isActive = "active";
      //   		}
      //
      //   		faqBodyTitle += '<li '+isActive+'><a href="#faq_'+index+'" class="side" data-toggle="tab"><aside></aside><h4>'+value.title+'</h4></a></li>';
      //
      //   		faqBodyContent += '<div id="faq_'+index+'" class="tab-pane '+isActive+'"><h3>'+value.title+'</h3><h6>QUESTION</h6><div class="question-container"><span>'+value.question+'</span>'+
      //                 '<br><br><span class="question-ask"></span><br><span class="question-date"></span></div><br><h6>ANSWERS</h6>'+
      //               	'<div class="answer-container"><span>'+value.answer+'</span>'+
      //                 '<br><br><span class="answer-by"></span><br><span class="answer-position"></span></div></div>';
      //   	});
      //   	$("#faqBodyTitle").html(faqBodyTitle);
      //   	$("#faqBodyContent").html(faqBodyContent);
      //   })
      //
      // });

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
