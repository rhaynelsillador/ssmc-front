<!DOCTYPE html>
<html>
  <%@ include file="commons/Assets.jsp"%>
  <body>
    <%@ include file="commons/CorporateHeader.jsp"%>
    <section>
      <div class="sec welcome">
        <h1>Contact us</h1>
        <span>We have the most advance medical <br /> technology and innovations</span>
        <br>
        <!-- <a href="#" class="btn btn-default">EXPLORE NOW</a>
        <a href="#" class="btn btn-primary">CONTACT US</a> -->
      </div>
      <%@ include file="commons/CorporateHeader.jsp"%>
    </section>
    <%@ include file="commons/CorporateFooter.jsp"%>

    <script  type="text/javascript" src="assets/js/jquery.min.js"></script>
    <script  type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function(){
        console.log("G!");
        $(".blue .nav li a").click(function(){
          console.log("gg");
          $(".blue .nav li").removeClass("active");
        });
      });
    </script>
  </body>
</html>
