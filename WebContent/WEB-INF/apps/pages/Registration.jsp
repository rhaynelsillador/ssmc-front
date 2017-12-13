<!DOCTYPE html>
<html>
  <%@ include file="commons/Assets.jsp"%>
  <link rel="stylesheet" href="assets/css/custom/corporate.css">

  <%-- Owl Carousel --%>
  <link rel="stylesheet" href="assets/css/vendor/owl.carousel.min.css">

  <body class="inner-page">
    <%@ include file="commons/Preloader.jsp"%>
    <div class="reg-bg">
      <div class="welcome-carousel owl-carousel owl-theme">
        <div class="item"><img src="assets/img/banner-about.jpg" alt=""></div>
        <div class="item"><img src="assets/img/banner-service.jpg" alt=""></div>
        <div class="item"><img src="assets/img/banner-branch.jpg" alt=""></div>
        <div class="item"><img src="assets/img/banner-faq.jpg" alt=""></div>
        <div class="item"><img src="assets/img/banner-contact.jpg" alt=""></div>
      </div>
    </div>
    <div class="register">
      <img src="assets/img/logo.png" alt="">
      <form class="mc-form" id="registrationForm">
        <div class="form-group">
          <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" name="email" maxlength="75">
          <label for="exampleInputEmail1">Email address</label>
        </div>
        <div class="form-group">
          <input type="text" class="form-control" id="exampleInputEmail2" aria-describedby="emailHelp" placeholder="" name="number" maxlength="11">
          <label for="exampleInputEmail2">Number</label>
        </div>
        <div class="form-group">
          <input type="password" class="form-control" id="exampleInputPassword1" placeholder="" name="password">
          <label for="exampleInputPassword1">Password</label>
        </div>
        <div class="form-group">
          <input type="password" class="form-control" id="exampleInputPassword2" placeholder="" name="password1">
          <label for="exampleInputPassword2">Confirm Password</label>
        </div>
        <div class="form-group hidden" id="registrationErrorMessage">
          <div class="alert alert-danger" role="alert"></div>
        </div>
        <button type="submit" class="btn btn-submit">Submit</button>
        <br><br>
        <div class="text-center">
          <a href="#" class="btn-member" style="color: #3465aa; font-size: 16px;">Already a member?</a>
        </div>
      </form>
    </div>




    <script type="text/javascript">
    	$("#menuFaq a").addClass("active");
    	var registrationErrorMessage = $("#registrationErrorMessage");

      	$(document).ready(function(){
        	console.log("G!");
        	// preloader();
       		wow = new WOW({offset: 300});
        	wow.init();

	        $('.owl-carousel').owlCarousel({
	            loop:true,
	            nav:true,
	            items:1,
	            autoplay:true,
	            autoplayTimeout:5000,
	            autoplayHoverPause: true,
	        });

      	});

      	$(".mc-form .form-control").blur(function() {
	        console.log("ftgyh");
	        console.log($(this).val());
	        if($(this).val() == ''){
	          $(this).removeClass("mc-filled");
	        }else {
	          $(this).addClass("mc-filled");
	        }

      	});



      	$("#registrationForm").submit(function(e){
			var form = objectifyForm($( this ).serializeArray());
			var btn = $( "#registrationForm button");
	  		btn.attr("disabled", "disabled");
	  		registrationErrorMessage.addClass("hidden");
			POST("RegistrationSave", form, function(data){
		  		btn.removeAttr("disabled");
		  		if(data.status == "ERROR"){
		  			console.log();
		  			registrationErrorMessage.removeClass("hidden");
		  			$("#registrationErrorMessage > div").html(data.message);
		  		}else{
		  			location.href="SsmcHealthHospitals";
		  		}
			})
			e.preventDefault();
		})

    $(".btn-member").click(function(){
      event.preventDefault();
      history.back(1);
    });

    </script>
  </body>
</html>
