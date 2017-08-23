function objectifyForm(formArray) {
  var returnArray = {};
  for (var i = 0; i < formArray.length; i++){
    returnArray[formArray[i]['name']] = formArray[i]['value'];
  }
  return returnArray;
}

function notify(message, type){
$.notify({
  message: message
},{
  type: type,
  allow_dismiss: false,
  label: 'Cancel',
  className: 'btn-xs btn-default',
  placement: {
      from: 'top',
      align: 'right'
  },
  delay: 2500,
  animate: {
          enter: 'animated fadeInUp',
          exit: 'animated fadeOutDown'
  },
  offset: {
      x: 30,
      y: 30
  }
});
}


var POST = function POST(url, form, cb){
	$.ajax( {
      	type: "POST",
      	contentType: "application/json",
      	dataType: "json",
      	url: url,
      	data: JSON.stringify(form),
      	success: function( data ) {
      		console.log("data :: ", data)
      		cb(data);
      	}
	});
}


var toastMessage = function toastMessage(data){
	if(data.status=="SUCCESS"){
		notify(data.message, "success");
	}else{
		notify(data.message, "danger");
	}
}

var confirmDelete = function confirmDelete(data){
	swal({
        title: "Are you sure?",
        text: data.text,
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "rgb(13, 123, 46)",
        confirmButtonText: "Yes, delete it!"
    }).then(function(){
    	POST(data.url, data.form, function(result){
    		toastMessage(result);
    		data.bootGrid.bootgrid('reload');
    	});
    });
}

var confirmation = function confirmation(data){
	swal({
        title: "Are you sure?",
        text: data.text,
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "rgb(13, 123, 46)",
        confirmButtonText: "Confirm"
    }).then(function(){
    	POST(data.url, data.form, function(result){
    		toastMessage(result);
    		data.bootGrid.bootgrid('reload');
    	});
    });
}

$(".roles").click(function(){
	checkIfCheckedAll();
})

function checkIfCheckedAll(){
	var isCheckedAll = true;
	$(".roles").each(function(){
		if(!($(this).is(':checked'))){
			isCheckedAll = false;
		}				
	})
	if(isCheckedAll){
		$("#controlStatusBtn").prop({
			  checked: true
		})
	}else{
		$("#controlStatusBtn").removeAttr("checked");
	}
}

$("#controlStatusBtn").click(function(e){
	if($("#controlStatusBtn").is(':checked')){
		$(".roles").each(function(){
			$(this).prop({
				  checked: true
			})
		})
	}else{
		$(".roles").each(function(){
			$(this).removeAttr("checked")
		})
	}
})

$(".approved-fn").click(function(e){
	var $this = $(this);
	var form = {
		"module" : $this.data("module"),
		"moduleId" : $this.data("moduleid"),
	}
	POST("approved", form, function(data){
		$this.remove();
	})
	
	
})
