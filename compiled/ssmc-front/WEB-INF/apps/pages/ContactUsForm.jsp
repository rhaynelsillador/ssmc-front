<div class="sec contact-us" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-0" data-genuitec-path="/ssmc-front/WebContent/WEB-INF/apps/pages/ContactUsForm.jsp">
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
                <select class="form-control" name="subject">
                  <option>Type of Inquiry</option>
                  <option>Type of Inquiry</option>
                  <option>Type of Inquiry</option>
                  <option>Type of Inquiry</option>
                </select>
              </div>
              <div class="col-md-6">
                <input type="text" class="form-control" name="message" value="" placeholder="Message">
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
		  		btn.removeAttr("disabled");
			})

			console.log(form);
			e.preventDefault();
		})
	});
</script>
