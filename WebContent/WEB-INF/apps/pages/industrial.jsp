<!DOCTYPE html>
<html>
  <%@ include file="commons/Assets.jsp"%>
  <link rel="stylesheet" href="assets/css/custom/corporate.css">

  <body>
  	<%@ include file="commons/SSMCHospitalsHeader.jsp"%>
    <%@ include file="commons/Preloader.jsp"%>
    <section id="faq">
      <div class="sec welcome welcome-common">
        <h1 id="headerTitle">Industrial Medicine</h1>
        <span id="headerContent"></span>
        <div class="welcome-background" id="imageCarousel">
        </div>
      </div>
      <div class="sec">
        <div class="wow fadeInUp">
          <div class="container">
            <div class="row" id="partnerList">
              
            </div>
          </div>
        </div>
      </div>
    </section>
    <%@ include file="commons/SSMCHospitalsFooter.jsp"%>
    <script type="text/javascript">
    	$("#menuFaq a").addClass("active");
      $(document).ready(function(){
        wow = new WOW({offset: 300});
        wow.init();
        $(".blue .nav li a").click(function(){
          $(".blue .nav li").removeClass("active");
        });
		
      	POST("SystemImages", {"app":"HOSPITALS", "page":"Industrial", "module":"HEADER"}, function(data){
           	var imageCarousel = "";
           	$.each(data.data, function(index, value){
           		imageCarousel += '<div class="item"><img src="'+fileServer+value.image+'" alt=""></div>';
           	})
           	$("#imageCarousel").html(imageCarousel);
           	initCarousel();
           })
        
      	POST("HeadersInformation", {"app" : "HOSPITALS", "page" : "Industrial"}, function(data){
           	if(data.data){
           		$("#headerContent").html("<p>"+data.data.content+"</p>");
           	}
       	})
        
      	POST("PartnerList", {}, function(data){
     		var html = "";
      		$.each(data, function(index, value){
      			var logo = value.logo;
      			if(value.logo == undefined || value.logo == ""){
      				logo = "upload/default.png";;
      			}
      			console.log("logo", logo);
      			html += '<div class="col-xs-3">';
      			html += '<a href="'+value.url+'" class="partner" target="_blank">';
   				html += '<span class="partner-img"><img src="'+fileServer+logo+'" alt=""></span>';
				html += '<span>'+value.name+'</span>';
				html += '</a>';
				html += '</div>';
      		})
     		$("#partnerList").html(html);
  	 	})
      });
		
     
    </script>
  </body>
</html>
