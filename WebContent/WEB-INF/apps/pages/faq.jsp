<!DOCTYPE html>
<html>
  <%@ include file="commons/Assets.jsp"%>

  <body>
  	<%@ include file="commons/CorporateHeader.jsp"%>
    <section id="faq">
      <div class="sec welcome welcome-common">
        <h1 id="headerTitle">Contact us</h1>
        <span id="headerContent">We have the most advance medical <br /> technology and innovations</span>
        <div class="welcome-background">
          <img src="assets/img/banner-faq.jpg" alt="">
        </div>
      </div>
      <div class="sec">
        <div class="container">
          <div class="row text-center">
            <br>
            <div class="big-tabination">
              <div class="col-md-4">
                <ul class="nav nav-pills nav-stacked wow fadeInRight" id="faqBodyTitle"></ul>
              </div>
              <div class="col-md-8">
                <div class="tab-content faq-content wow fadeInLeft"  id="faqBodyContent">

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <%@ include file="commons/CorporateFooter.jsp"%>
    <script type="text/javascript">
    	$("#menuFaq a").addClass("active");
      $(document).ready(function(){
        console.log("G!");
        preloader();
        new WOW().init();
        $(".blue .nav li a").click(function(){
          console.log("gg");
          $(".blue .nav li").removeClass("active");
        });

        POST("HeadersInformation", {"app" : "BUSINESS", "page" : "Faq"}, function(data){
        	data = data.data;
        	$("#headerTitle").html(data.title);
        	$("#headerContent").html(data.content);
        })

        POST("FaqInformation", {"app" : "BUSINESS"}, function(data){
        	console.log(data);
        	var faqBodyTitle = "";
        	var faqBodyContent = "";
        	$.each(data, function(index, value){
        		var isActive = "";
        		if(index == 0){
        			isActive = "active";
        		}

        		faqBodyTitle += '<li '+isActive+'><a href="#faq_'+index+'" class="side" data-toggle="tab"><aside></aside><h4>'+value.title+'</h4></a></li>';

        		faqBodyContent += '<div id="faq_'+index+'" class="tab-pane '+isActive+'"><h3>'+value.title+'</h3><h6>QUESTION</h6><div class="question-container"><span>'+value.question+'</span>'+
                      '<br><br><span class="question-ask"></span><br><span class="question-date"></span></div><br><h6>ANSWERS</h6>'+
                    	'<div class="answer-container"><span>'+value.answer+'</span>'+
                      '<br><br><span class="answer-by"></span><br><span class="answer-position"></span></div></div>';
        	});
        	$("#faqBodyTitle").html(faqBodyTitle);
        	$("#faqBodyContent").html(faqBodyContent);
        })

      });

      function preloader() {
        $("header,section,footer").hide()

        $(window).load(function(){
          $("header,section,footer").fadeIn();
          setTimeout(function(){ $('#preloader').fadeOut('slow'); }, 500);
          console.log("peace out");
        });

      }
    </script>
  </body>
</html>
