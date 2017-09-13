<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>SSMC</title>
    <link rel="stylesheet" href="assets/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/custom/global.css">
    <link rel="stylesheet" href="assets/css/custom/landing.css">



  </head>
  <body>
    <header>
      <img src="assets/img/logo.png" alt="">
    </header>
    <section>
      <a class="corporate" href="Corporate">
        <div class="no-skew">
          <img src="assets/img/business-man.png" alt="">
          <div class="corp-content">
            <img class="icon-corp" src="assets/img/icon-corp.png" alt="">
            <h1>${ requestScope.business.title }</h1>
            <p>${ requestScope.business.content }</p>
          </div>
          </div>
      </a>
      <a class="medical" href="Medical">
        <div class="no-skew">
          <img src="assets/img/male-doctor.png" alt="">
          <div class="medical-content">
            <img src="assets/img/icon-medical.png" alt="" class="icon-medical">
            <h1>${ requestScope.clinic.title }</h1>
            <p>${ requestScope.clinic.content }</p>
          </div>
        </div>
      </a>
      <div class="clearfix"></div>
    </section>
    <footer>
      <span>Copyright (c) 2017. All Rights Reserved SSMC</span>
    </footer>

    <script  type="text/javascript" src="assets/js/jquery.min.js"></script>
    <script  type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function(){
        console.log("G!");
        var viewportHeight = $(window).height();
        $("section").css("height",viewportHeight);
      });
    </script>
  </body>
</html>
