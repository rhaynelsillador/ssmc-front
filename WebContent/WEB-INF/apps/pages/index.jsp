<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>SSMC</title>
    <link rel="stylesheet" href="assets/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/vendor/animate.css">
    <link rel="stylesheet" href="assets/css/custom/global.css">
    <link rel="stylesheet" href="assets/css/custom/landing.css">




  </head>
  <body>
    <header>
      <img class="wow bounceInDown" src="assets/img/logo.png" alt="">
    </header>
    <section>
      <div class="wow fadeInLeftBig">
        <a class="corporate" href="Corporate">
          <div class="no-skew">
            <img src="assets/img/business-man.png" alt="">
            <div class="corp-content">
              <img class="icon-corp" src="assets/img/icon-corp.png" alt="">
              <h1 id="businessTitle"></h1>
              <p id="businessContent"></p>
            </div>
            </div>
        </a>
      </div>
      <div class="wow fadeInRightBig">
        <a class="medical" href="Medical">
          <div class="no-skew">
            <img src="assets/img/male-doctor.png" alt="">
            <div class="medical-content">
              <img src="assets/img/icon-medical.png" alt="" class="icon-medical">
              <h1 id="clinicTitle"></h1>
              <p id="clinicContent"></p>
            </div>
          </div>
        </a>
      </div>
      <div class="clearfix"></div>
    </section>
    <footer>
      <span>Copyright (c) 2017. All Rights Reserved SSMC</span>
    </footer>
    <div id="preloader"></div>

    <script  type="text/javascript" src="assets/js/jquery.min.js"></script>
    <script  type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <script  type="text/javascript" src="assets/js/utils.js"></script>
    <%-- Wow js --%>
    <script src="assets/js/wow.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function(){
        console.log("G!");

        var viewportHeight = $(window).height();
        $("section,.corporate,.medical").css("height",viewportHeight);

        preloader();
        new WOW().init();

        POST("MainHeaderInfo", {}, function(data){
        	console.log("MainHeaderInfo : ", data);
        	for (var i = 0; i < data.info.length; i++) {
				console.log(data.info[i]);
				$("#"+data.info[i].type.toLowerCase()+"Title").html(data.info[i].title);
				$("#"+data.info[i].type.toLowerCase()+"Content").html(data.info[i].content);
			}
        })

        POST("MainHeaderImages", {}, function(data){
        	console.log("MainHeaderImages : ", data);
        	for (var i = 0; i < data.images.length; i++) {
				console.log(data.images[i]);
			}
        })

      });

      function preloader() {
        $("header,section,footer").hide()

        $(window).load(function(){
          $("header,section,footer").fadeIn();
          setTimeout(function(){ $('#preloader').fadeOut('slow'); }, 500);
          console.log("peace out");
        });

      }

      // $(".corporate").hover(
      //   function(){
      //     $(this).css("z-index","1");
      //     $(".medical").toggleClass("hvr-reverse").css("z-index","0");
      //   }
      // );
      //
      // $(".medical").hover(
      //   function(){
      //     $(this).css("z-index","1");
      //     $(".corporate").toggleClass("hvr-reverse").css("z-index","0");
      //   }
      // );
    </script>
  </body>
</html>
