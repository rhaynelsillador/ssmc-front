<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <%@ include file="../commons/Assets.jsp"%>
  <%-- <link rel="stylesheet" href="assets/css/custom/corporate.css"> --%>
  <body class="inner-page">
    <%@ include file="../commons/SSMCHealthClinicsHeader.jsp"%>
    <%@ include file="../commons/Preloader.jsp"%>
    <section>
      <div class="sec welcome welcome-common">
        <h1 id="headerTitle">Contact Us</h1>
        <span id="headerContent"></span>
        <div class="welcome-background" id="imageCarousel">
          <img src="assets/img/banner-contact.jpg" alt="">
        </div>
      </div>
      <%@ include file="../ContactUsForm.jsp"%>
    </section>
    <%@ include file="../commons/SSMCHealthClinicFooter.jsp"%>

    <script type="text/javascript">
      $("#menuContact a").addClass("active");
      $(document).ready(function(){
        console.log("G!");
        // preloader();
        wow = new WOW({offset: 300});
        wow.init();
        $(".blue .nav li a").click(function(){
          console.log("gg");
          $(".blue .nav li").removeClass("active");
        });

        POST("SystemImages", {"app":"CLINIC", "page":"ContactUs", "module":"HEADER"}, function(data){
        	var imageCarousel = "";
        	$.each(data.data, function(index, value){
        		imageCarousel += '<div class="item"><img src="'+fileServer+value.image+'" alt=""></div>';
        	})
        	$("#imageCarousel").html(imageCarousel);
        	initCarousel();
        })

        // POST("HeadersInformation", {"app":"CLINIC", "page":"ContactUs"}, function(data){
        // 	$("#headerInfo").html(data.data.content);
        // });

        POST("HeadersInformation", {"app" : "CLINIC", "page" : "ContactUs"}, function(data){
        	if(data.data){
        		$("#headerContent").html("<p>"+data.data.content+"</p>");
        	}
        })



        /* POST("HeadersInformation", {"app" : "CLINIC", "page" : "ContactUs"}, function(data){
        	data = data.data;
        	$("#headerTitle").html(data.title);
        	$("#headerContent").html(data.content);
        }) */
      });
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
