<div class="sec contact-us">
  <div class="container">
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div class="contact-box wow bounceInUp">
          <h2>CONTACT US NOW!</h2>
          <form class="contact-form">
            <div class="row">
              <div class="col-md-6">
                <input type="text" class="form-control" name="fullName" value="" placeholder="Full name">
                <input type="email" class="form-control" name="email" value="" placeholder="E-mail">
                <input type="text" class="form-control" name="phone" value="" placeholder="Phone">
              </div>
              <div class="col-md-6">
                <textarea class="form-control" name="message" value="" placeholder="Message" rows="7" cols="7"></textarea>
              </div>
              <div class="col-md-12">
              	<div class="form-group" id="contactUsMessage">
		          
		      </div>
              </div>
              <div class="col-md-12">
                <button type="submit" class="contact-submit" name="button"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">
	$(document).ready(function(){
		$(".contact-form").submit(function(e){
			var form = objectifyForm($( this ).serializeArray());
			var btn = $( ".contact-form button");
	  		btn.attr("disabled", "disabled");
			POST("sendEmail", form, function(data){
				if(data.status == "ERROR"){
					btn.removeAttr("disabled");
					$("#contactUsMessage").html('<div class="alert alert-danger fade in alert-dismissable" style="margin-top:18px;">'+
						    '<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">�</a>'+
						    '<strong>Error!</strong> '+data.message+'.'+
						'</div>')
				}else{
			  		$("#contactUsMessage").html('<div class="alert alert-success fade in alert-dismissable" style="margin-top:18px;">'+
						    '<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">�</a>'+
						    '<strong>Success!</strong> '+data.message+'.'+
						'</div>')
				}
		  		
			})

			console.log(form);
			e.preventDefault();
		})
	});
</script>
