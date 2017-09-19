<!DOCTYPE html>
<html>
  <%@ include file="commons/Assets.jsp"%>

  <body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-16" data-genuitec-path="/ssmc-front/WebContent/WEB-INF/apps/pages/faq.jsp">
  	<%@ include file="commons/CorporateHeader.jsp"%>
    <section id="faq" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-16" data-genuitec-path="/ssmc-front/WebContent/WEB-INF/apps/pages/faq.jsp">
      <div class="sec welcome welcome-common">
        <div id="headerInfo"></div>
        <div class="welcome-background" id="imageCarousel">
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

        POST("SystemImages", {"app":"BUSINESS", "page":"Faq", "module":"HEADER"}, function(data){
        	var imageCarousel = "";
        	$.each(data.data, function(index, value){
        		imageCarousel += '<div class="item"><img src="'+fileServer+value.image+'" alt=""></div>';
        	})
        	$("#imageCarousel").html(imageCarousel);
        	initCarousel();
        })
        
        POST("HeadersInformation", {"app" : "BUSINESS", "page" : "Faq"}, function(data){
        	$("#headerInfo").html(data.data.content);
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
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"59876",secure:"59881"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></html>
