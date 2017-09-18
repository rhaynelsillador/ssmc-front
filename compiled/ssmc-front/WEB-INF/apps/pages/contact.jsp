<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <%@ include file="commons/Assets.jsp"%>
  <body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-11" data-genuitec-path="/ssmc-front/WebContent/WEB-INF/apps/pages/contact.jsp">
    <%@ include file="commons/CorporateHeader.jsp"%>
    <section data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-11" data-genuitec-path="/ssmc-front/WebContent/WEB-INF/apps/pages/contact.jsp">
      <div class="sec welcome welcome-common">
        <div id="headerInfo"></div>
        <div class="welcome-background" id="imageCarousel">
          <img src="assets/img/banner-contact.jpg" alt="">
        </div>
      </div>
      <%@ include file="ContactUsForm.jsp"%>
    </section>
    <%@ include file="commons/CorporateFooter.jsp"%>

    <script type="text/javascript">
      $("#menuContact a").addClass("active");
      $(document).ready(function(){
        console.log("G!");
        preloader();
        new WOW().init();
        $(".blue .nav li a").click(function(){
          console.log("gg");
          $(".blue .nav li").removeClass("active");
        });
		
        POST("SystemImages", {"app":"BUSINESS", "page":"ContactUs", "module":"HEADER"}, function(data){
        	var imageCarousel = "";
        	$.each(data.data, function(index, value){
        		imageCarousel += '<div class="item"><img src="'+fileServer+value.image+'" alt=""></div>';
        	})
        	$("#imageCarousel").html(imageCarousel);
        	initCarousel();
        })
        
        POST("HeadersInformation", {"app":"BUSINESS", "page":"ContactUs"}, function(data){
        	$("#headerInfo").html(data.data.content);
        });
        
        
        
        /* POST("HeadersInformation", {"app" : "BUSINESS", "page" : "ContactUs"}, function(data){
        	data = data.data;
        	$("#headerTitle").html(data.title);
        	$("#headerContent").html(data.content);
        }) */
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
