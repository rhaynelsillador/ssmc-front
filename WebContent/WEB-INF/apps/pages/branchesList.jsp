<div class="sec branch">
  <div class="container">
    <div class="row text-center">
      <span class="header-span">Find <strong>SSMC</strong></span>
      <h3>CLINICS AND HOSPITALS</h3>
      <a href="#" class="btn btn-primary btn-branches">More Branches</a>
      <br>
      <div class="basic-tabination">
        <div class="col-md-3">
          <ul class="nav nav-pills nav-stacked wow fadeInLeft" id="clinicCities">
            <%-- <li class="active"><a href="#loc_1" data-toggle="tab"></a></li>
            <li><a href="#loc_2" data-toggle="tab"></a></li>
            <li><a href="#loc_3" data-toggle="tab"></a></li>
            <li><a href="#loc_3" data-toggle="tab"></a></li> --%>
          </ul>
        </div>
        <div class="col-md-9">
          <div class="tab-content tab-about wow fadeInRight" id="clinicCitiesContent">

          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script>

	POST("ClinicsAndHospitals", {}, function(data){
		var clinics = "";
		var clinicCitiesContent="";
		$.each(data.data, function(key, value){
			 console.log(value);
			 if(key == 0){
				 clinics += '<li class="active"><a href="#'+(value.dateAdded+""+value.id)+'" data-toggle="tab">'+value.name+'</a></li>';
				 clinicCitiesContent += '<div id="'+(value.dateAdded+""+value.id)+'" class="tab-pane active">';
			 }else{
				 clinics += '<li class=""><a href="#'+(value.dateAdded+""+value.id)+'" data-toggle="tab">'+value.name+'</a></li>';
				 clinicCitiesContent += '<div id="'+(value.dateAdded+""+value.id)+'" class="tab-pane">';
			 }
			 clinicCitiesContent += '<div><div class="branch-info">'+
             '<h4>'+value.name+'</h4>'+
             '<span>'+value.description+'</span>'+
             '<br>'+
             '<br>'+

           '</div>'+
           '<div class="branch-img">'+
             '<img src="'+fileServer+value.logo+'" style="width: 250px;" alt="">'+
           '</div>'+
           '<div class="clearfix"></div>'+
           '<br>'+
           '<div class="map-container">'+
             '<div id="map" style="width:100%;height:300px"><iframe width="100%" height="300" frameborder="0" style="border:0" src="'+value.map+'" allowfullscreen></iframe></div>'+
         	'</div></div>';
			 clinicCitiesContent += '</div>';
		});

		$("#clinicCities").html(clinics);
		$('#clinicCitiesContent').html(clinicCitiesContent)


		var cityListContent = "";
		var cityList = "";
		var counter = 0;


    if ($("body").hasClass("home")) {
      $(".map-container").remove();
    }

    $( ".ismobile .basic-tabination .nav li a" ).click(function() {
      $("#clinicCities").removeClass("tab-open");
    });

	})

	function initPagination(containerID, holder){
		$(function() {
			$("div.pagination_holder_MakatiCity").jPages({
		        containerID : "pagination_MakatiCity",
	            first       : "first",
	            previous    : "previous",
	            next        : "next",
	            last        : "last",
	            perPage 	: 1
			});
	    });
	}

  $( ".btn-branches" ).click(function() {
    $("#clinicCities").addClass("tab-open");
    event.preventDefault();
  });








</script>
