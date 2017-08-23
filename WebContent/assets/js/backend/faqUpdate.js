CKEDITOR.replace( 'answer' );

$("#cms_menus").addClass("navigation__sub--active navigation__sub--toggled");
$("#faq_menu").addClass("navigation__active");

$(document).ready(function(){
	$( "#faqUpdateForm" ).submit(function( event ) {
  		console.log( $( this ).serialize() );
  		event.preventDefault();
  		  		
  		var form = objectifyForm($( this ).serializeArray());
  		form.logo = $('.fileinput-preview img').attr("src");
  		form.answer = CKEDITOR.instances.answer.getData();
  		
  		var btn = $( "#faqUpdateForm button");
  		btn.html("Updating...");
  		btn.attr("disabled", "disabled");
  		
  		POST("AddUpdateFaq", form, function(data){
  			toastMessage(data);
  			btn.html("Save Update");
	  		btn.removeAttr("disabled");
	  		checkIfCheckedAll();
  		})
  		
	});
})

