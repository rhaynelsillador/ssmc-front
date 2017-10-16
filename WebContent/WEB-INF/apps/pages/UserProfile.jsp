<!DOCTYPE html>
<html>
  <%@ include file="commons/Assets.jsp"%>
  <link rel="stylesheet" href="assets/css/custom/corporate.css">

  <body>
  	<%@ include file="commons/SSMCHospitalsHeader.jsp"%>
    <%@ include file="commons/Preloader.jsp"%>
    <section id="user_profile">
      <div class="container">
          <h3>Personal Information</h3>
            <div class="user-container">
            <form>
              <div class="form-group">
                <div class="row">
                  <div class="col-sm-4 col-xs-12">
                    <label for="exampleInputEmail1">Full name</label>
                    <input type="text" class="form-control" id="" aria-describedby="" placeholder="First Name">
                  </div>
                  <div class="col-sm-4 col-xs-12">
                    <label for="exampleInputEmail1">&nbsp;</label>
                    <input type="text" class="form-control" id="" aria-describedby="" placeholder="Middle Name">
                  </div>
                  <div class="col-sm-4 col-xs-12">
                    <label for="exampleInputEmail1">&nbsp;</label>
                    <input type="text" class="form-control" id="" aria-describedby="" placeholder="Last Name">
                  </div>
                </div>
              </div>
              <div class="form-group">
                <div class="row">
                  <div class="col-sm-4 col-xs-12">
                    <label for="exampleInputEmail1">Birthday</label>
                    <input type="date" class="form-control" id="" aria-describedby="" placeholder="">
                  </div>
                  <div class="col-sm-4 col-xs-12">
                    <label for="exampleInputEmail1">Age</label>
                    <input type="number" class="form-control" id="" aria-describedby="" placeholder="">
                  </div>
                  <div class="col-sm-4 col-xs-12">
                    <label for="exampleInputEmail1">Gender</label>
                    <div style="margin-top: 6px;">
                      <input type="radio" name="gender" value="male"> Male &nbsp;&nbsp;
                      <input type="radio" name="gender" value="female"> Female
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label for="exampleInputPassword1">Address</label>
                <input type="text" class="form-control" id="" placeholder="">
              </div>
              <br>
              <div class="form-group text-center">
                  <button type="submit" class="btn btn-primary">Save</button>
              </div>
            </form>
            </div>
            <br>
            <h3>Test Results</h3>
            <div class="user-container">
              <div class="table-container">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th>Test Name</th>
                      <th>Date Taken</th>
                      <th>Results</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>Sample test</td>
                      <td>10/10/2017 5:00 am</td>
                      <td><a href="#" class="btn btn-primary"><i class="fa fa-download" aria-hidden="true"></i>&nbsp;Download</a></td>
                    </tr>
                    <tr>
                      <td>Sample test</td>
                      <td>10/10/2017 5:00 am</td>
                      <td><a href="#" class="btn btn-primary"><i class="fa fa-download" aria-hidden="true"></i>&nbsp;Download</a></td>
                    </tr>
                    <tr>
                      <td>Sample test</td>
                      <td>10/10/2017 5:00 am</td>
                      <td><a href="#" class="btn btn-primary"><i class="fa fa-download" aria-hidden="true"></i>&nbsp;Download</a></td>
                    </tr>
                  </tbody>
                </table>
              </div>

            </div>

      </div>


    </section>
    <%@ include file="commons/CorporateFooter.jsp"%>
    <script type="text/javascript">
    	$("#menuFaq a").addClass("active");
      $(document).ready(function(){
        console.log("G!");
        // preloader();
        wow = new WOW({offset: 300});
        wow.init();
        $(".blue .nav li a").click(function(){
          console.log("gg");
          $(".blue .nav li").removeClass("active");
        });

        POST("SystemImages", {"app":"HOSPITALS", "page":"Faq", "module":"HEADER"}, function(data){
        	var imageCarousel = "";
        	$.each(data.data, function(index, value){
        		imageCarousel += '<div class="item"><img src="'+fileServer+value.image+'" alt=""></div>';
        	})
        	$("#imageCarousel").html(imageCarousel);
        	initCarousel();
        })

        POST("HeadersInformation", {"app" : "HOSPITALS", "page" : "Faq"}, function(data){
        	if(data.data){
        		$("#headerContent").html("<p>"+data.data.content+"</p>");
        	}
        })

        POST("FaqInformation", {"app" : "HOSPITALS"}, function(data){
        	console.log(data);
        	var faqBodyTitle = "";
        	var faqBodyContent = "";
        	$.each(data, function(index, value){
        		var isActive = "";
        		if(index == 0){
        			isActive = "active";
        		}

        		faqBodyTitle += '<li '+isActive+'><a href="#faq_'+index+'" class="side" data-toggle="tab"><aside></aside><h4>'+value.title+'</h4></a></li>';

        		faqBodyContent += '<div id="faq_'+index+'" class="tab-pane '+isActive+'"><h3>'+value.title+'</h3><h6>QUESTION</h6><div class="question-container"><span>'+value.question+'</span>'+
                      '<br><br><span class="question-ask"></span><br><span class="question-date"></span></div><br><h6>ANSWERS</h6>'+
                    	'<div class="answer-container"><span>'+value.answer+'</span>'+
                      '<br><br><span class="answer-by"></span><br><span class="answer-position"></span></div></div>';
        	});
        	$("#faqBodyTitle").html(faqBodyTitle);
        	$("#faqBodyContent").html(faqBodyContent);
        })

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
    </script>
  </body>
</html>
