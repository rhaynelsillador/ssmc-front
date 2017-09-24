<div class="sec branch">
  <div class="container">
    <div class="row text-center">
      <span class="header-span">Find <strong>SSMC</strong></span>
      <h3>CLINICS AND HOSPITALS</h3>
      <br>
      <div class="basic-tabination">
        <div class="col-md-3">
          <ul class="nav nav-pills nav-stacked wow fadeInLeft" id="clinicCities">
            <li class="active"><a href="#loc_1" data-toggle="tab">Quezon City</a></li>
            <li><a href="#loc_2" data-toggle="tab">Makati City</a></li>
            <li><a href="#loc_3" data-toggle="tab">Mandaluyong City</a></li>
            <li><a href="#loc_3" data-toggle="tab">Taguig City</a></li>
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
	
		var cityListContent = "";
		var cityList = "";
		var counter = 0;
		$.each(data, function(key, value){
			console.log(key);
			var active = "";
			if(counter == 0){
				active = "active";
			}
	
			cityListContent += '<div id="'+key.split(" ").join("")+'" class="tab-pane '+active+'"><ul id="pagination_'+key.split(" ").join("")+'">';
			cityList += '<li class="'+active+'"><a href="#'+key.split(" ").join("")+'" data-toggle="tab">'+key+'</a></li>';
			
			
	
			$.each(value, function(index, details){
				cityListContent +=  '<li><div class="branch-info">'+
	              '<h4>'+details.name+'</h4>'+
	              '<span>'+details.description+'</span>'+
	              '<br>'+
	              '<br>'+
	              '<span>Phone: '+details.phone+' '+
	              '<br>Email: '+details.email+'</span>'+
	            '</div>'+
	            '<div class="branch-img">'+
	              '<img src="'+fileServer+details.logo+'" style="width: 250px;" alt="">'+
	            '</div>'+
	            '<div class="clearfix"></div>'+
	            '<br>'+
	            '<div class="map-container">'+
	              '<div id="map" style="width:100%;height:300px"><iframe width="100%" height="300" frameborder="0" style="border:0" src="'+details.map+'" allowfullscreen></iframe></div>'+
	          	'</div></li>';
			})
			cityListContent += '</ul></div><div class="pagination_holder_'+key.split(" ").join("")+'"></div> ';
			counter++;
			
			
			setTimeout(() => {
				//initPagination("pagination_"+key.split(" ").join(""), 'pagination_holder_'+key.split(" ").join(""));
			}, 2000);
		
			
		})
		$('#clinicCities').html(cityList)
		$('#clinicCitiesContent').html(cityListContent)
		
		
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

</script>