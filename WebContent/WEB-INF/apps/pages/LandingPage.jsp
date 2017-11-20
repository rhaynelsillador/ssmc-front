<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <link rel="shortcut icon" href="assets/favicon.ico" type="image/x-icon"/>
    <title>SSMC</title>
    <link rel="stylesheet" href="assets/sass/main.css">
  </head>
  <body class="landing">
    <header>
      <div class="wow fadeInDown" data-wow-duration="1500ms" data-wow-delay="">
        <div id="logo_container">
          <span class="logo-bottom">
            <img src="assets/img/logo_health.png" alt="" />
          </span>
          <span class="logo-top">
            <img src="assets/img/logo-ssmc.jpg" alt="" />
          </span>
        </div>
      </div>
    </header>
    <section>
      <div class="landing-container">
        <div class="corp-container wow slideInLeft" data-wow-duration="1500ms" data-wow-delay="500ms">
          <a href="SsmcHealthHospitals" id="hospitals">
            <div class="landing-content">
              <div class="landing-logo">
                <img src="assets/img/landing4.png" alt="">
              </div>
              <div>
                <h2>Hospitals Group</h2>
                <!-- <span id="businessContent"> -->
                <span>
                  Affordable Quality Healthcare in a hospital setting.</br></br>
                  <!-- SSMC - Paranaque City</br></br>
                  Cruz - Rabe Maternity and General Hospital-Taguig City -->
                </span>
              </div>
            </div>

            <div class="image"></div>
          </a>
        </div>
        <div class="med-container wow slideInRight" data-wow-duration="1500ms" data-wow-delay="500ms">
          <a href="SsmcHealthClinics" id="clinics">
            <div class="landing-content">
              <div class="landing-logo">
                <img src="assets/img/landing3.png" alt="">
              </div>
              <div>
                <h2>Clinics Group</h2>
                <!-- <span id="clinicContent"></span> -->
                <span>Efficient Diagnostics and Screening  Healthcare Services for Institutional (APEs, Pre-employment, Clinic Manning, etc. ), HMOs and Individuals</span>
              </div>
            </div>
            <div class="image"></div>
          </a>
        </div>
      </div>
    </section>
    <footer>
      <%-- <span>&reg; 2017, South Super Highway Medical Center</span> --%>
      <span>PREVENTIVE AND HEALING</span>
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

        preloader();
        resHeight();
        new WOW().init();

        POST("MainHeaderInfo", {}, function(data){
        	console.log("MainHeaderInfo : ", data);
        	for (var i = 0; i < data.info.length; i++) {
				console.log(data.info[i]);
				/* $("#"+data.info[i].type.toLowerCase()+"Title").html(data.info[i].title); */
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


      function resHeight(){
        var viewportHeight = $(window).height();
        $("section,.corporate,.medical").css("height",viewportHeight-50);
      }

      $( window ).resize(function() {
        resHeight();
      });
    </script>
  </body>
</html>
