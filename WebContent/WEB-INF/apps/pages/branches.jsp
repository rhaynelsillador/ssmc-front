<!DOCTYPE html>
<html>
  <%@ include file="commons/Assets.jsp"%>
  <body>
    <%@ include file="commons/CorporateHeader.jsp"%>
    <section>
      <div class="sec welcome">
        <h1 id="hospitalClinicHeaderTitle">Hospitals and Clinics</h1>
        <span id="hospitalClinicHeaderContent">We have the most advance medical <br /> technology and innovations</span>
        <br>
      </div>
      <div class="sec branch">
        <div class="container">
          <div class="row text-center">
            <br>
            <div class="basic-tabination">
              <div class="col-md-3">
                <ul class="nav nav-pills nav-stacked" id="cityList">
                  <li class="active"><a href="#loc_1" data-toggle="tab">Quezon City</a></li>
                  <li><a href="#loc_2" data-toggle="tab">Makati City</a></li>
                  <li><a href="#loc_3" data-toggle="tab">Mandaluyong City</a></li>
                  <li><a href="#loc_3" data-toggle="tab">Taguig City</a></li>
                </ul>
              </div>
              <div class="col-md-9">
                <div class="tab-content tab-about">
                  <div id="loc_1" class="tab-pane active">
                    <div class="branch-info">
                      <h4>General Medicine</h4>
                      <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span>
                      <br>
                      <br>
                      <span>Phone: 234-2223 <br>Email: ssmc@gmail.com</span>
                    </div>
                    <div class="branch-img">
                      <img src="assets/img/cross.png" style="width: 250px;" alt="">
                    </div>
                    <div class="clearfix"></div>
                    <br>
                    <div class="map-container">
                      <div id="map" style="width:100%;height:300px"></div>
                    </div>
                  </div>
                  <div id="loc_2" class="tab-pane">
                    <div class="branch-info">
                      <h4>General Medicine</h4>
                      <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span>
                      <br>
                      <br>
                      <span>Phone: 234-2223 <br>Email: ssmc@gmail.com</span>
                    </div>
                    <div class="branch-img">
                      <img src="assets/img/cross.png" style="width: 250px;" alt="">
                    </div>
                    <div class="clearfix"></div>
                    <br>
                    <div class="map-container">
                      <div id="map2" style="width:100%;height:300px"></div>
                    </div>
                  </div>
                  <div id="loc_3" class="tab-pane">
                    <div class="branch-info">
                      <h4>General Medicine</h4>
                      <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span>
                      <br>
                      <br>
                      <span>Phone: 234-2223 <br>Email: ssmc@gmail.com</span>
                    </div>
                    <div class="branch-img">
                      <img src="assets/img/cross.png" style="width: 250px;" alt="">
                    </div>
                    <div class="clearfix"></div>
                    <br>
                    <div class="map-container">
                      <div id="map3" style="width:100%;height:300px"></div>
                    </div>
                  </div>
                  <div id="loc_4" class="tab-pane">
                    <div class="branch-info">
                      <h4>General Medicine</h4>
                      <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span>
                      <br>
                      <br>
                      <span>Phone: 234-2223 <br>Email: ssmc@gmail.com</span>
                    </div>
                    <div class="branch-img">
                      <img src="assets/img/cross.png" style="width: 250px;" alt="">
                    </div>
                    <div class="clearfix"></div>
                    <br>
                    <div class="map-container">
                      <div id="map4" style="width:100%;height:300px"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <%@ include file="commons/CorporateFooter.jsp"%>
	
    <script src="https://maps.googleapis.com/maps/api/js?callback=myMap"></script>
    <script type="text/javascript">
    	$("#menuBranches a").addClass("active");
      	$(document).ready(function(){
	        console.log("G!");
	    	
	        $(".blue .nav li a").click(function(){
	          console.log("gg");
	          $(".blue .nav li").removeClass("active");
	        });
	        
	        POST("ClinicsHeaderInfo", {}, function(data){
	        	$("#hospitalClinicHeaderTitle").html(data.title);
	        	$("#hospitalClinicHeaderContent").html(data.content);
	        })
	        
	        POST("Cities", {}, function(data){
	        	console.log(data);
	        	var cityList = "";
	        	for (index = 0; index < data.length; ++index) {
	        	    console.log(data[index]);
	        	    if(index == 0){
	        	    	cityList += '<li class="active"><a href="#'+data[index].cityKey+'" data-toggle="tab">'+data[index].name+'</a></li>';
	        	    }else{
	        	    	cityList += '<li><a href="#'+data[index].cityKey+'" data-toggle="tab">'+data[index].name+'</a></li>';
	        	    }
	        	}
	        	$('#cityList').html(cityList)
	        })
	        
	        
	        
      	});
		
      	/* function myMap() {
          	var mapOptions = {
              center: new google.maps.LatLng(51.5, -0.12),
              zoom: 10,
              mapTypeId: google.maps.MapTypeId.ROADMAP
          	}
          
	      	var map = new google.maps.Map(document.getElementById("map"), mapOptions);
	      	var map2 = new google.maps.Map(document.getElementById("ma2p"), mapOptions);
	      	var map3 = new google.maps.Map(document.getElementById("map3"), mapOptions);
	      	var map4 = new google.maps.Map(document.getElementById("map4"), mapOptions);
      	} */
    </script>
  </body>
</html>
