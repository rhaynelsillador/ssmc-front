var fileServer = 'http://localhost/FileServer/';
//var fileServer = 'http://ssmcgroup.ph/FileServer/';

function objectifyForm(formArray) {
  var returnArray = {};
  for (var i = 0; i < formArray.length; i++){
    returnArray[formArray[i]['name']] = formArray[i]['value'];
  }
  return returnArray;
}

var tableConfig = {
    	ajax: true,
        post: function ()
        {
            return {
                id: "b0df282a-0d67-40e5-8558-c9e93b7befed",
                test: "test"
            };
        },
        css: {
            icon: 'table-bootgrid__icon zmdi',
            iconSearch: 'zmdi-search',
            iconColumns: 'zmdi-view-column',
            iconDown: 'zmdi-sort-amount-desc',
            iconRefresh: 'zmdi-refresh',
            iconUp: 'zmdi-sort-amount-asc',
            dropDownMenu: 'dropdown form-group--select',
            search: 'table-bootgrid__search',
            actions: 'table-bootgrid__actions',
            header: 'table-bootgrid__header',
            footer: 'table-bootgrid__footer',
            dropDownItem: 'table-bootgrid__label',
            table: 'table table-bootgrid',
            pagination: 'pagination table-bootgrid__pagination'
        },
        templates: {
            actionDropDown: "<span class=\"{{css.dropDownMenu}}\">" + "<a href='' data-toggle=\"dropdown\">{{ctx.content}}</a><ul class=\"{{css.dropDownMenuItems}}\" role=\"menu\"></ul></span>",
            search: "<div class=\"{{css.search}} form-group\"><span class=\"{{css.icon}} {{css.iconSearch}}\"></span><input type=\"text\" class=\"{{css.searchField}}\" placeholder=\"{{lbl.search}}\" /><i class='form-group__bar'></i></div>",
            header: "<div id=\"{{ctx.id}}\" class=\"{{css.header}}\"><p class=\"{{css.search}}\"></p><p class=\"{{css.actions}}\"></p></div>",
            actionDropDownCheckboxItem: "<li><div class='tabe-bootgrid__checkbox checkbox checkbox--dark'><label class=\"{{css.dropDownItem}}\"><input name=\"{{ctx.name}}\" type=\"checkbox\" value=\"1\" class=\"{{css.dropDownItemCheckbox}}\" {{ctx.checked}} /> {{ctx.label}}<i class='input-helper'></i></label></div></li>",
            footer: "<div id=\"{{ctx.id}}\" class=\"{{css.footer}}\"><div class=\"row\"><div class=\"col-sm-6\"><p class=\"{{css.pagination}}\"></p></div><div class=\"col-sm-6 table-bootgrid__showing hidden-xs\"><p class=\"{{css.infos}}\"></p></div></div></div>"
        }
	};


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

$(document).on("click", ".approved-fn", function(e){
	var $this = $(this);
	var form = {
		"module" : $this.data("module"),
		"moduleId" : $this.data("moduleid"),
	}
	POST("approved", form, function(data){
		$this.remove();
		if($this.data("reload") == true){
			getPendingApprovalList();
		}
	})
})

var datetimeformat = function datetimeformat(datetime){
	return moment(datetime).format("YYYY-MM-DD HH:mm:ss");
}

var dateformat = function dateformat(datetime){
	return moment(datetime).format("MMMM DD, YYYY");
}

var initCarousel = function initCarousel(){
	$('.welcome .owl-carousel').owlCarousel({
        loop:true,
        nav:true,
        items:1,
        autoplay:true,
        autoplayTimeout:5000,
        // autoplayHoverPause:true
    });

    $('.med-promo .owl-carousel').owlCarousel({
          loop:true,
          nav:true,
          items:1,
          autoplay:true,
          autoplayTimeout:8000,
          animateOut: 'fadeOut',
          animateIn: 'fadeIn',
          // autoplayHoverPause:true
      });
}

if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
 console.log("QQQ2Q3");
 $("html").addClass("ismobile");

}


// LOGIN FUNCTIONS //

$(document).ready(function(e){
	$(".mc-form .form-control").blur(function() {
        if($(this).val() == ''){
          $(this).removeClass("mc-filled");
        }else {
          $(this).addClass("mc-filled");
        }

  	});

	$("#loginForm").submit(function(e){
		var form = objectifyForm($( this ).serializeArray());
		var btn = $( "#loginForm button");
  		btn.attr("disabled", "disabled");

		POST("AccountLogin", form, function(data){
	  		btn.removeAttr("disabled");
	  		if(data.status == "ERROR"){
	  			$("#loginErrorMessage").removeClass("hidden");
	  			$("#loginErrorMessage > div").html(data.message);
	  		}else{
	  			location.href = "UserProfile";
	  		}
		})
		e.preventDefault();
	})


	$("#logoutMenu").click(function(e){
		POST("AccountLogout", {}, function(data){
	  		location.href = "SsmcHealthHospitals";
		})
		e.preventDefault();
	})

  $(".mobile-menu").click(function(){
    $(".nav.pull-right").slideToggle();
  });

})

var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
};

var initAdsCarousel = function(id){
	$("#"+id).owlCarousel({
        loop:true,
        nav:true,
        items:1,
        autoplay:true,
        autoplayTimeout:5000,
        // autoplayHoverPause:true
    });
}