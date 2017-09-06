<!DOCTYPE html>
<html>
  <%@ include file="commons/Assets.jsp"%>
  <link rel="stylesheet" href="assets/css/custom/about.css">
  <body>
    <%@ include file="commons/CorporateHeader.jsp"%>
    <section>
      <div class="sec welcome">
        <h1 id="aboutUsTitle">About us</h1>
        <span id="aboutUsContent">We have the most advance medical <br /> technology and innovations</span>
        <br>
        <!-- <a href="#" class="btn btn-default">EXPLORE NOW</a>
        <a href="#" class="btn btn-primary">CONTACT US</a> -->
      </div>
      <div class="sec branch">
        <div class="container">
          <div class="row text-center">
            <br>
            <div class="basic-tabination">
              <div class="col-md-3">
                <ul class="nav nav-pills nav-stacked" id="aboutUsMenus">
                  <li class="active"><a href="#about_1" data-toggle="tab">Introduction</a></li>
                  <li><a href="#about_2" data-toggle="tab">Mission & Vision</a></li>
                  <li><a href="#about_3" data-toggle="tab">Certifications</a></li>
                </ul>
              </div>
              <div class="col-md-9">
                <div class="tab-content tab-about" id="aboutUsContent">
                  <div id="about_1" class="tab-pane active">
                      <h3>Introduction</h3>
                      <br>
                      <div class="about-img">
                        <img src="assets/img/banner.png" alt="">
                      </div>
                      <br>
                      <div class="about-info">
                      <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipisicing Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. <br><br> elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span>

                    </div>

                  </div>
                  <div id="about_2" class="tab-pane">
                      <h3>Mission & Vision</h3>
                      <br>
                      <div class="about-img">
                        <img src="assets/img/banner.png" alt="">
                      </div>
                      <br>
                      <div class="about-info">
                      <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span>

                    </div>

                  </div>
                  <div id="about_3" class="tab-pane">
                      <h3>Certifications</h3>
                      <br>
                      <div class="about-img">
                        <img src="assets/img/banner.png" alt="">
                      </div>
                      <br>
                      <div class="about-info">
                      <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span>

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
	
    <script type="text/javascript">
    $("#menuAbout a").addClass("active");
      $(document).ready(function(){
        console.log("G!");
        $(".blue .nav li a").click(function(){
          console.log("gg");
          $(".blue .nav li").removeClass("active");
        });
      });
     
	POST("AboutUsHeaderInfo", {}, function(data){
	 	$("#aboutUsTitle").html(data.title);
	 	$("#aboutUsContent").html(data.content);
	})
      
	POST("AboutUsInfo", {}, function(data){
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
      
    </script>
  </body>
</html>
