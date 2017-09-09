<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <%@ include file="commons/Assets.jsp"%>
  <body>
    <%@ include file="commons/CorporateHeader.jsp"%>
    <section>
      <div class="sec welcome">
        <h1>Contact us</h1>
        <span>We have the most advance medical <br /> technology and innovations</span>
      </div>
      <%@ include file="ContactUsForm.jsp"%>
    </section>
    <%@ include file="commons/CorporateFooter.jsp"%>
	
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
