<div class="sec blue">
  <div class="container">
    <div class="row text-center">
      <span class="header-span">How We <strong>WORK</strong></span>
      <h3>MEDICAL SERVICES</h3>
      <br>
    </div>
    <div class="col-md-4 col-sm-3">
      <ul  class="nav nav-pills nav-service wow fadeInRightBig">
        <li class="active hidden">
          <a href="#service_0_2" data-toggle="tab" class="service-left" id="service0_2">
            <aside></aside>
            <h5></h5>
            <span></span>
          </a>
        </li>
        <li class="hidden">
          <a href="#service_1_2" data-toggle="tab" class="service-left" id="service2_2">
            <aside></aside>
            <h5></h5>
            <span></span>
          </a>
        </li>
        <li class="hidden">
          <a href="#service_2_2" data-toggle="tab" class="service-left" id="service4_2">
            <aside></aside>
            <h5></h5>
            <span></span>
          </a>
        </li>

      </ul>
    </div>
    <div class="col-md-4 col-sm-6">
      <div class="service-center wow fadeInUpBig">
        <div class="tab-content">
           <div id="service_0_2" class="tab-pane active">
            <div class="service-img">
              <img src="" alt="">
            </div>
            <span class="service-circle"></span>
            <div class="service-content">
              <h4></h4>
              <span></span>
            </div>
          </div>
          <div id="service_1_2" class="tab-pane">
            <div class="service-img">
              <img src="" alt="">
            </div>
            <span class="service-circle"></span>
            <div class="service-content">
              <h4></h4>
              <span></span>
            </div>
          </div>
          <div id="service_2_2" class="tab-pane">
            <div class="service-img">
              <img src="" alt="">
            </div>
            <span class="service-circle"></span>
            <div class="service-content">
              <h4></h4>
              <span></span>
            </div>
          </div>
          <div id="service_3_2" class="tab-pane">
            <div class="service-img">
              <img src="" alt="">
            </div>
            <span class="service-circle"></span>
            <div class="service-content">
              <h4></h4>
              <span></span>
            </div>
          </div>
          <div id="service_4_2" class="tab-pane">
            <div class="service-img">
              <img src="" alt="">
            </div>
            <span class="service-circle"></span>
            <div class="service-content">
              <h4></h4>
              <span></span>
            </div>
          </div>
          <div id="service_5_2" class="tab-pane">
            <div class="service-img">
              <img src="" alt="">
            </div>
            <span class="service-circle"></span>
            <div class="service-content">
              <h4></h4>
              <span></span>
            </div>
          </div>

        </div>
      </div>
    </div>
    <div class="col-md-4 col-sm-3">
      <ul  class="nav nav-pills nav-service wow fadeInLeftBig">
      	<li class="hidden">
          <a href="#service_3_2" data-toggle="tab" class="service-right" id="service1_2">
            <aside></aside>
            <h5></h5>
            <span></span>
          </a>
        </li>
        <li class="hidden">
          <a href="#service_4_2" data-toggle="tab" class="service-right" id="service3_2">
            <aside></aside>
            <h5></h5>
            <span></span>
          </a>
        </li>
        <li class="hidden">
          <a href="#service_5_2" data-toggle="tab" class="service-right" id="service5_2">
            <aside></aside>
            <h5></h5>
            <span></span>
          </a>
        </li>
      </ul>
    </div>
  </div>
</div>


<script>

	POST("ServicesInformation", {"app": "HOSPITALS", "num":2, "limit" : 6}, function(data){
		$.each(data.data, function(index, value){
			$("#service"+index+"_2").parent().removeClass("hidden");
			$("#service"+index+"_2 h5").html(value.title);
			$("#service"+index+"_2 span").html(value.content);

			$("#service_"+index+"_2 .service-content h4").html(value.title);
			$("#service_"+index+"_2 .service-content span").html(value.content2);

			$("#service_"+index+"_2 .service-img img").attr("src", fileServer+value.image);

		})
	})

</script>
