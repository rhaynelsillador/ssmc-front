<div class="sec info">
  <div class="container">
    <div class="row">
      <div class="col-sm-4 wow slideInUp">
        <div class="info-box box-1">
          <img src="assets/img/icon-info1.png" class="icon-info" alt="">
          <h4></h4>
          <p></p>
          <div class="info-bg">
            <img src="assets/img/bg-info1.jpg" alt="">
          </div>
        </div>

      </div>
      <div class="col-sm-4 wow slideInUp">
        <div class="info-box box-2">
          <h4></h4>
          <p> </p>
          <a href="ContactUs" class="btn">CONTACT US</a>
          <div class="info-bg">
            <img src="assets/img/bg-info2.jpg" alt="">
          </div>
        </div>

      </div>
      <div class="col-sm-4 wow slideInUp">
        <div class="info-box qualified-doctors">
          <h4>NO UPDATES</h4>
          <div class="info-bg">
            <img src="assets/img/bg-info3.jpg" alt="">
          </div>
        </div>

      </div>
    </div>
  </div>
</div>

<script>
	
	POST("FeaturedBoxes", {"page":"Hospital"}, function(data){
		console.log("FeaturedBoxes L ", data);
		$.each(data, function(index, value){
    		$(".box-"+value.box+" > h4").html(value.name.toUpperCase());
    		$(".box-"+value.box+" > p").html(value.description);
    	})
	})
	

</script>