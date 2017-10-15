<header>
      <div class="header-top">
        <div class="container">
          <div class="pull-left">
            <a href="#" class="phone-contact"><span class="h-icon"><i class="fa fa-fw fa-phone" aria-hidden="true"></i></span></a>&nbsp;&nbsp;
            <a href="#" class="email-contact"><span class="h-icon" style="font-size: 10px;"><i class="fa fa-fw fa-envelope" aria-hidden="true"></i></span></a>&nbsp;&nbsp;
            <a href="#" data-toggle="modal" data-target="#login_modal" id="loginMenu" class="hidden"><span class="h-icon"><i class="fa fa-fw fa-sign-in" aria-hidden="true"></i></span>Login</a>&nbsp;&nbsp;
            <a href="#"><span class="h-icon" style="font-size: 10px;"><i class="fa fa-fw fa-envelope" aria-hidden="true"></i></span>Register</a>&nbsp;&nbsp;
            <a href="#" id="logoutMenu" class="hidden"><span class="h-icon"><i class="fa fa-fw fa-power-off" aria-hidden="true"></i></span>Logout</a>
          </div>
          <div class="pull-right">
            <a href="#" class="facebook-contact"><span class="h-icon hvr-radial-out"><i class="fa fa-facebook" aria-hidden="true"></i></span></a>
            <a href="#" class="twitter-contact"><span class="h-icon hvr-radial-out"><i class="fa fa-twitter" aria-hidden="true"></i></span></a>
            <a href="#" class="youtube-contact"><span class="h-icon hvr-radial-out"><i class="fa fa-youtube-play" aria-hidden="true"></i></span></a>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="header-bot">
          <a class="mobile-menu" href="#"><i class="fa fa-bars" aria-hidden="true"></i></a>
          <a class="logo pull-left" href="Welcome"><img src="assets/img/logo.png" alt=""></a>
          <div class="nav pull-right">
            <ul class="list-inline">
              <li id="menuCorporate"><a href="SsmcHealthClinics">HOME</a></li>
              <li id="menuAbout"><a href="Medical-About">ABOUT</a></li>
              <li id="menuAServices"><a href="Medical-Services">SERVICES</a></li>
              <li id="menuBranches"><a href="Medical-Branches">HOSPITAS & CLINICS</a></li>
              <li id="menuFaq"><a href="Medical-Faq">FAQ</a></li>
              <li id="menuContact"><a href="Medical-ContactUs">CONTACT US</a></li>
            </ul>
          </div>
          <div class="clearfix"></div>
        </div>
      </div>
    </header>



    <%@ include file="../commons/LoginModal.jsp"%>

    <script>
    $(document).ready(function(){
    	POST("ContactInformationList", {}, function(data){
    		console.log(data);
    		$.each(data, function(index, value){
    			if(value.name == "facebook" || value.name == "youtube" || value.name == "twitter"){
    				$("."+value.name+"-contact").attr("href", value.value);
    				$("."+value.name+"-contact").attr("target", "_blank");
    				$("."+value.name+"-contact-footer").html(value.value);
    				$("."+value.name+"-contact-footer").attr("href", value.value);
    				$("."+value.name+"-contact-footer").attr("target", "_blank");

    			}else{
    				$("."+value.name+"-contact").append(value.value);
    			}
    		})
    	})
    })



    </script>
