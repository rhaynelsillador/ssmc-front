CKEDITOR.replace( 'description' );

$("#administration_menus").addClass("navigation__sub--active navigation__sub--toggled");
$("#clinic_menu").addClass("navigation__active");

$("#input-id").fileinput({'showUpload':true, 'previewFileType':'any'});

$(document).ready(function(){
	
	$( "#clinicUpdateForm" ).submit(function( event ) {
		
		console.log();
		
  		console.log( $( this ).serialize() );
  		event.preventDefault();
  		  		
  		var form = objectifyForm($( this ).serializeArray());
  		form.logo = $("#clinicUpdateForm img").attr("src");
  		form.description = CKEDITOR.instances.description.getData();
  		
  		var btn = $( "#clinicUpdateForm button");
  		btn.html("Updating...");
  		btn.attr("disabled", "disabled");
  		
  		
  		POST("AddUpdateClinic", form, function(data){
  			toastMessage(data);
  			btn.html("Save Update");
	  		btn.removeAttr("disabled");
	  		checkIfCheckedAll();
  		})
	});
})