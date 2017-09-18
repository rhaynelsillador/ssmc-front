<!DOCTYPE html>
<html>
  <%@ include file="commons/Assets.jsp"%>
  <body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-12" data-genuitec-path="/ssmc-front/WebContent/WEB-INF/apps/pages/contact1.jsp">
    <%@ include file="commons/CorporateHeader.jsp"%>
    <section data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-12" data-genuitec-path="/ssmc-front/WebContent/WEB-INF/apps/pages/contact1.jsp">
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
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"59876",secure:"59881"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></html>
