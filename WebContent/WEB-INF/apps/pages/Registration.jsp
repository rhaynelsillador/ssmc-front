<!DOCTYPE html>
<html>
  <%@ include file="commons/Assets.jsp"%>
  <link rel="stylesheet" href="assets/css/custom/corporate.css">

  <%-- Owl Carousel --%>
  <link rel="stylesheet" href="assets/css/vendor/owl.carousel.min.css">

  <body>
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
      <form class="mc-form">
        <div class="form-group">
          <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="">
          <label for="exampleInputEmail1">Email address</label>
        </div>
        <div class="form-group">
          <input type="email" class="form-control" id="exampleInputEmail2" aria-describedby="emailHelp" placeholder="">
          <label for="exampleInputEmail2">Number</label>
        </div>
        <div class="form-group">
          <input type="password" class="form-control" id="exampleInputPassword1" placeholder="">
          <label for="exampleInputPassword1">Password</label>
        </div>
        <div class="form-group">
          <input type="password" class="form-control" id="exampleInputPassword2" placeholder="">
          <label for="exampleInputPassword2">Confirm Password</label>
        </div>
        <button type="submit" class="btn btn-submit">Submit</button>
        <br><br>
        <div class="text-center">
          <a href="#" style="color: #3465aa; font-size: 16px;">Already a member?</a>
        </div>
      </form>
    </div>




    <script type="text/javascript">
    	$("#menuFaq a").addClass("active");
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

      $(".mc-form .form-control").blur(function() {
        console.log("ftgyh");
        console.log($(this).val());
        if($(this).val() == ''){
          $(this).removeClass("mc-filled");
        }
        else {
          $(this).addClass("mc-filled");
        }

      });

    </script>
  </body>
</html>
