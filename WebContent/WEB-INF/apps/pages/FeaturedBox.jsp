<div class="sec info" id="featured-box-sec">
  <div class="container">
    <div class="row">
      <div class="col-sm-4 wow bounceInUp">
        <div class="info-box">
          <h4>CAREERS</h4>
          <div class="career-container">
            <div id="careers"></div>
          </div>
        </div>

      </div>
      	<div class="col-sm-4 wow bounceInUp">
        	<div class="info-box box-2">
          		<h4>DOCTOR'S DIRECTORY</h4>
          		<br>
          		<form id="doctorsDirectoryForm">
	          		<div class="form-group">
			            <label for="sel1">Select list:</label>
			            <select class="form-control" id="directoryId" name="directoryId"></select>
		          	</div>
		          	<div class="form-group">
			            <label for="usr">Search:</label>
			            <input type="text" class="form-control" id="name" name="name">
		          	</div>
	
	          		<button type="submit" class="btn">FIND</button>
				</form>
        	</div>
      	</div>
      <div class="col-sm-4 wow bounceInUp">
        <div class="info-box news">
         <h4 class="text-center" id="news-header">NEW & UPDATES</h4>
          <div class="news-container">
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
	$(document).ready(function(){
		
		POST("DirectoryServices", {}, function(data){
			var html = '';
			$.each(data, function(index, value){
				html += '<option value="'+value.id+'">'+value.name+'</option>';
			})
			$("#directoryId").html(html);
		})
		
		POST("ServicesInformation", {"app":"HOSPITALS", "num":3}, function(data){
			var html = "";
			$.each(data.data, function(index, value){
				html += '<div class="item">'+
	                '<h5>Medical Technologist</h5>'+
	                value.content2+
	              	'</div>';
			})
			$("#careers").html(html);
      		$("#careers").mCustomScrollbar();
		})


		POST("NewsAndUpdatePublished", {}, function(data){
			var html = "";
			$.each(data, function(index, value){
				html += '<div class="news-box">';
				html += '<div class="news-img">';
				html += '<img id="news-update-image-'+value.id+'">';
				html += '</div>';
				html += '<div class="news-content">';
				html += '<span><strong class="news-title">'+value.title+'</strong>'+value.news+'</span>';
				html += '<a href="News?news='+value.id+'&button=NEXT&news-title='+value.title+'">Learn more</a>';
				html += '</div></div>';
				POST("NewsAndUpdatePublishedImages/"+value.id, {}, function(imgData){
					if(imgData.length >= 1){
						$("#news-update-image-"+value.id).attr("src", fileServer+imgData[0].image);
					}
				})
	    	})
	    	if(html == ""){
	    		$("#news-header").html("NO UPDATES");
	    	}else{
	    		$(".news-container").html("<div>"+html+"</div>");
	    		ticker();
	    	}
		})
		
		$("#doctorsDirectoryForm").submit(function(e){
			e.preventDefault();
			$("#featuredBoxModal").modal("show");
			var form = objectifyForm($( this ).serializeArray());
			POST("DoctorsList", form, function(data){
				var html = "";
				$.each(data, function(index, value){
					var schedule = '<td>'+value.day+'</td><td>'+value.time+'</td>';
					if(value.day == "" || value.day == undefined){
						schedule = '<td colspan="2">'+value.other+'</td>';
					}
					html += '<tr><td>'+value.name+'</td>'+schedule+'<td>'+value.branch+'</td></tr><tr> ';
				})
				if(html!=""){
					$("#doctorsListTable > tbody").html(html);
				}else{
					$("#doctorsListTable").html('<caption>No doctor/s found!.</caption>');
				}
			})
		});
	})
	
	$('#featuredBoxModal').on('hidden.bs.modal', function (e) {
		$("#doctorsListTable").html('<caption>No doctor/s found!.</caption>');
	})
	
	function ticker(){
		$('.news-container').easyTicker({
	        direction: 'up',
	        easing: 'swing',
	        speed: 'slow',
	        interval: 3000,
	        height: 'auto',
	        visible: 3,
	        mousePause: 1,
	        controls: {
	        up: '',
	        down: '',
	        toggle: '',
	        playText: 'Play',
	        stopText: 'Stop'
	        }
	      });
	}



</script>
