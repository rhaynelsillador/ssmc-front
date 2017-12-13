<!DOCTYPE html>
<html>
  <%@ include file="commons/Assets.jsp"%>
  <link rel="stylesheet" href="assets/css/custom/corporate.css">

  <body class="inner-page">
  	<%@ include file="commons/SSMCHospitalsHeader.jsp"%>
    <%@ include file="commons/Preloader.jsp"%>
    <section id="user_profile">
      <div class="container">
          <h3>Personal Information</h3>
            <div class="user-container">
            <form id="loginAccountInformationForm">
              <div class="form-group">
                <div class="row">
                  <div class="col-sm-4 col-xs-12">
                    <label for="exampleInputEmail1">Full name</label>
                    <input type="text" class="form-control" id="firstName" name="firstName" aria-describedby="" placeholder="First Name">
                  </div>
                  <div class="col-sm-4 col-xs-12">
                    <label for="exampleInputEmail1">&nbsp;</label>
                    <input type="text" class="form-control" id="middleName" name="middleName" aria-describedby="" placeholder="Middle Name">
                  </div>
                  <div class="col-sm-4 col-xs-12">
                    <label for="exampleInputEmail1">&nbsp;</label>
                    <input type="text" class="form-control" id="lastName" name="lastName" aria-describedby="" placeholder="Last Name">
                  </div>
                </div>
              </div>
              <div class="form-group">
                <div class="row">
                  <div class="col-sm-4 col-xs-12">
                    <label for="exampleInputEmail1">Birthday</label>
                    <input type="date" class="form-control" id="birthday" name="birthday" aria-describedby="" placeholder="Birthday">
                  </div>
                  <div class="col-sm-4 col-xs-12">
                    <label for="exampleInputEmail1">Email</label>
                    <input type="text" class="form-control" id="email" name="email" aria-describedby="" placeholder="Email">
                  </div>
                  <div class="col-sm-4 col-xs-12">
                    <label for="exampleInputEmail1">Phone</label>
                    <input type="number" class="form-control" id="number" name="number" aria-describedby="" placeholder="Phone" maxlength="11">
                  </div>
                </div>
              </div>
              <div class="form-group">
                <div class="row">
                  <div class="col-sm-4 col-xs-12">
                    <label for="exampleInputEmail1">Gender</label>
                    <div style="margin-top: 6px;">
                      <input type="radio" name="gender" value="MALE"> Male &nbsp;&nbsp;
                      <input type="radio" name="gender" value="FEMALE"> Female
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label for="exampleInputPassword1">Address</label>
                <input type="text" class="form-control" id="address" name="address" placeholder="Address">
              </div>
              <br>
              <div class="form-group hidden" id="informationMessage">
		          <div class="alert" role="alert"></div>
		      </div>
              <div class="form-group text-center">
                  <button type="submit" class="btn btn-primary">Save</button>
              </div>
            </form>
            </div>
            <br>
            <h3>Test Results</h3>
            <!-- <div class="user-container" >
            	<label>UNDER DEVELOPMENT</label>
            </div> -->
            <div class="user-container" >
              <div class="table-container">
                <table class="table table-striped" id="accountTestResultTable">
                  <thead>
                    <tr>
                      <th>Test Name</th>
                      <th>Date Examined</th>
                      <th>Date Released</th>
                      <th>Results</th>
                    </tr>
                  </thead>
                  <tbody>

                  </tbody>
                </table>
              </div>

            </div>

      </div>


    </section>
    <%@ include file="commons/SSMCHospitalsFooter.jsp"%>
    <script type="text/javascript">
    	var loginAccountInformationForm = $('#loginAccountInformationForm');
    	var accountid = '';
    	POST("LoginAccountInformation", {}, function(data){
    		console.log("LoginAccountInformation", data);
    		$.each(data, function(index, value){
  				if(index == "gender"){
  					$("input[value='"+value+"']").attr('checked', true);
  				}else if(index == "id"){
  					accountid = value;
  				}else
	  				$("#"+index).val(value);

    		})
      	});

      	$(document).ready(function(){
	        console.log("G!");
	        // preloader();
	        wow = new WOW({offset: 300});
	        wow.init();
	        $(".blue .nav li a").click(function(){
	          console.log("gg");
	          $(".blue .nav li").removeClass("active");
	        });

	        loadTestResult();

	        loginAccountInformationForm.submit(function(e){
	        	var form = objectifyForm($( this ).serializeArray());
	        	form.id = accountid;
				var btn = $( "#loginAccountInformationForm button");
				console.log("form", form);
				POST("AccountInformationUpdate", form, function(data){
		    		console.log("LoginAccountInformation", data);
		    		var informationMessage = $("#informationMessage");
		    		if(data.status == "SUCCESS"){
		    			informationMessage.find(".alert").addClass("alert-success");
		    			informationMessage.find(".alert").removeClass("alert-danger");
		    		}else{
		    			informationMessage.find(".alert").addClass("alert-danger");
		    			informationMessage.find(".alert").removeClass("alert-success");
		    		}
		    		informationMessage.removeClass("hidden");
		    		informationMessage.find(".alert").html(data.message);
		      	});
	        	e.preventDefault();
	        })
      	});

      	var loadTestResult = function(){
      		POST("AccountExamResult", {}, function(data){
      			var data = data.data;
      			var html = "";
      			for (var i = 0; i < data.length; i++) {
					console.log(data[i]);
					html += '<tr><td>'+data[i].name+'</td><td>'+moment(data[i].dateExamined).format("YYYY-MM-DD HH:mm:ss")+'</td>'+
						'<td>'+moment(data[i].dateEncoded).format("YYYY-MM-DD HH:mm:ss")+'</td>'+
	                    '<td><a href="'+fileServer+"upload/"+data[i].result+'" class="btn btn-primary" target="_blank"><i class="fa fa-download" aria-hidden="true"></i>&nbsp;Download</a></td></tr>';
				}
      			$("#accountTestResultTable tbody").html(html);
      		})
      	}

    </script>
  </body>
</html>
