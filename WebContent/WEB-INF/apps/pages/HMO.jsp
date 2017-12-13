<!DOCTYPE html>
<html>
  <%@ include file="commons/Assets.jsp"%>
  <link rel="stylesheet" href="assets/css/custom/corporate.css">
  <body class="inner-page">
    <%@ include file="commons/SSMCHospitalsHeader.jsp"%>
    <%@ include file="commons/Preloader.jsp"%>
    <section>
      <div class="sec welcome welcome-common">
        <h1>Health Maintenance Organizations</h1>
        <span id="headerContent"></span>
        <div class="welcome-background" id="imageCarousel">
        </div>
      </div>
      <div class="sec branch">
	  <div class="container">
	    <div class="row text-center">
	      <span class="header-span">Find <strong>SSMC</strong></span>
	      <h3>Health Maintenance Organizations (HMO)</h3>
	      <a href="#" class="btn btn-primary btn-branches">More Branches</a>
	      <br>
	      <div class="basic-tabination">
	        <div class="col-md-3">
	          <ul class="nav nav-pills nav-stacked wow fadeInLeft" id="clinicCities">
	          </ul>
	        </div>
	        <div class="col-md-9">
	          <div class="tab-content tab-about wow fadeInRight" id="clinicCitiesContent">

	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
    </section>

    <%@ include file="commons/SSMCHospitalsFooter.jsp"%>
    <script type="text/javascript">
    	$(document).ready(function(){
          wow = new WOW({offset: 300});
          wow.init();
	        $(".blue .nav li a").click(function(){
	          $(".blue .nav li").removeClass("active");
	        });

	        POST("HeadersInformation", {"app":"HOSPITALS", "page":"HMO"}, function(data){
	        	if(data.data){
	        		$("#headerContent").html(data.data.content);
	        	}

	        });

	        POST("SystemImages", {"app":"HOSPITALS", "page":"HMO", "module":"HEADER"}, function(data){
	        	var imageCarousel = "";
	        	$.each(data.data, function(index, value){
	        		imageCarousel += '<div class="item"><img src="'+fileServer+value.image+'" alt=""></div>';
	        	})
	        	$("#imageCarousel").html(imageCarousel);
	        	initCarousel();
	        })

	       POST("HMOList", {}, function(data){
				var clinics = "";
				var clinicCitiesContent="";
				$.each(data.data, function(key, value){
					 console.log(value);
					 if(key == 0){
						 clinics += '<li class="active"><a href="#'+(value.dateAdded+""+value.id)+'" data-toggle="tab">'+value.name+'</a></li>';
						 clinicCitiesContent += '<div id="'+(value.dateAdded+""+value.id)+'" class="tab-pane active">';
					 }else{
						 clinics += '<li class=""><a href="#'+(value.dateAdded+""+value.id)+'" data-toggle="tab">'+value.name+'</a></li>';
						 clinicCitiesContent += '<div id="'+(value.dateAdded+""+value.id)+'" class="tab-pane">';
					 }
					 clinicCitiesContent += '<div><div class="branch-info">'+
		             '<h4>'+value.name+'</h4>'+
		             '<span>'+value.description+'</span>'+
		             '<br>'+
		             '<br>'+

		           '</div>'+
		           '<div class="branch-img">'+
		             '<img src="'+fileServer+value.logo+'" style="width: 250px;" alt="">'+
		           '</div>'+
		           '<div class="clearfix"></div>'+
		           '<br>';
		           if(value.map && value.map != ""){
		        	   clinicCitiesContent += '<div class="map-container">'+
			             '<div id="map" style="width:100%;height:300px"><iframe width="100%" height="300" frameborder="0" style="border:0" src="'+value.map+'" allowfullscreen></iframe></div>'+
				         	'</div></div>';

		           }
		           clinicCitiesContent += '</div></div>';
				});

				$("#clinicCities").html(clinics);
				$('#clinicCitiesContent').html(clinicCitiesContent)


				var cityListContent = "";
				var cityList = "";
				var counter = 0;


		    if ($("body").hasClass("home")) {
		      $(".map-container").remove();
		    }

		    $( ".ismobile .basic-tabination .nav li a" ).click(function() {
		      $("#clinicCities").removeClass("tab-open");
		    });

			})
      	});
    </script>
  </body>
</html>
