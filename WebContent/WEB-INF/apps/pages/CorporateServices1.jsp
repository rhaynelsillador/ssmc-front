<div class="sec choose">
  <div class="container">
    <div class="choose row text-center">
      <span class="header-span">Why choose <strong>SSMC</strong></span>
      <h3>WE PROVIDE THE BEST SERVICE</h3>
      <br>
      <div class="big-tabination">
        <div class="col-md-4 col-sm-5">
          <ul class="nav nav-pills nav-stacked wow fadeInRight" id="corporateServicesTitle1">
          </ul>
        </div>
        <div class="col-md-8 col-sm-7">
          <div class="tab-content choose-content wow fadeInLeft"  id="corporateServicesContent1">
            <div id="choose_1" class="tab-pane active">
              <img src="assets/img/banner.png" alt="">
            </div>
            <div id="choose_2" class="tab-pane">
              <img src="assets/img/banner2.png" alt="">
            </div>
            <div id="choose_3" class="tab-pane">
              <img src="assets/img/banner.png" alt="">
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script>

	POST("ServicesInformation", {"app": "HOSPITALS", "num":1, "limit" : 3}, function(data){
		data = data.data;
		var corporateServicesTitle1 = "";
		var corporateServicesContent1 = "";
		$.each(data, function(index, value){
			var isActive = "";
			if(index == 0){
				isActive = "active";
			}
			corporateServicesTitle1 += '<li class="'+isActive+'">'+
				'<a href="#service_'+index+'" class="side" data-toggle="tab">'+
	            '<aside></aside>'+
	            '<h5>'+value.name+'</h5>'+
	            '<span>'+value.content+'</span>'+
	          	'</a>'+
	         '</li>';
	
	         corporateServicesContent1 += '<div id="service_'+index+'" class="tab-pane '+isActive+'">'+
	            '<img src="'+fileServer+value.image+'" alt="">'+
	            '<div>'+value.content2+'</div>'+
	            '</div>';
		})
		$("#corporateServicesTitle1").html(corporateServicesTitle1);
		$("#corporateServicesContent1").html(corporateServicesContent1);
	});
</script>
