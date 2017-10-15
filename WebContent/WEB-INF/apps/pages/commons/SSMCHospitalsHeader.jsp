<header>
  <div class="header-top">
    <div class="container">
      <div class="pull-left">
        <a href="#"><span class="h-icon"><i class="fa fa-fw fa-phone" aria-hidden="true"></i></span>+6398863555</a>&nbsp;&nbsp;
        <a href="#"><span class="h-icon" style="font-size: 10px;"><i class="fa fa-fw fa-envelope" aria-hidden="true"></i></span>support@ssmc.com</a>&nbsp;&nbsp;
        <a href="#" data-toggle="modal" data-target="#login_modal" id="loginMenu" class="hidden"><span class="h-icon"><i class="fa fa-fw fa-sign-in" aria-hidden="true"></i></span>Login</a>&nbsp;&nbsp;
        <a href="#"><span class="h-icon" style="font-size: 10px;"><i class="fa fa-fw fa-envelope" aria-hidden="true"></i></span>Register</a>&nbsp;&nbsp;
        <a href="#" id="logoutMenu" class="hidden"><span class="h-icon"><i class="fa fa-fw fa-power-off" aria-hidden="true"></i></span>Logout</a>
      </div>
      <div class="pull-right">
        <a href="#"><span class="h-icon hvr-radial-out"><i class="fa fa-facebook" aria-hidden="true"></i></span></a>
        <a href="#"><span class="h-icon hvr-radial-out"><i class="fa fa-twitter" aria-hidden="true"></i></span></a>
        <a href="#"><span class="h-icon hvr-radial-out"><i class="fa fa-youtube-play" aria-hidden="true"></i></span></a>
      </div>
    </div>
  </div>
  <div class="container">
    <div class="header-bot">
      <a class="logo pull-left" href="Welcome"><img src="assets/img/logo.png" alt=""></a>
      <div class="nav pull-right">
        <ul class="list-inline">
          <li id="menuCorporate"><a href="SsmcHealthHospitals">HOME</a></li>
          <li id="menuAbout"><a href="About">ABOUT</a></li>
          <li id="menuAServices"><a href="Services">SERVICES</a></li>
          <li id="menuBranches"><a href="Branches">HOSPITAS & CLINICS</a></li>
          <li id="menuFaq"><a href="Faq">FAQ</a></li>
          <li id="menuContact"><a href="ContactUs">CONTACT US</a></li>
        </ul>
      </div>
      <div class="clearfix"></div>
    </div>
  </div>
</header>


<script>
	var email = '${sessionScope.accountLoggedIn.email}';
	if(email == ""){
		$("#loginMenu").removeClass("hidden");
	}else{
		$("#logoutMenu").removeClass("hidden");
	}


	console.log(email == "" , email == undefined);

</script>
