<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
	<%@ include file="commons/Headers.jsp"%>
    <body>
        <!-- Page Loader -->
        <div id="page-loader">
            <div class="preloader preloader--xl preloader--light">
                <svg viewBox="25 25 50 50">
                    <circle cx="50" cy="50" r="20" />
                </svg>
            </div>
        </div>

        <!-- Header -->
        <%@ include file="commons/Navbar.jsp"%>

        <section id="main">
            
			<%@ include file="commons/MenuAside.jsp"%>
            <%@ include file="commons/Menu.jsp"%>

				<section id="content">
				   <div class="content__header">
				       <h2>Service</h2>
				
				       <div class="actions">
				           <a href="ServicesAdd"><i class="zmdi zmdi-plus"></i></a>
				       </div>
				   </div>
				
				   <div class="card">
				       <div class="card__header">
				           	<h2>${sessionScope.TRANSACTION}</h2>
				           	<c:if test="${sessionScope.hasApproved == false and sessionScope.TRANSACTION != 'ADD'}">
				           		<button class="btn btn-primary pull-right approved-fn" data-module="8" data-moduleId="${sessionScope.service.id}">Approve</button>
				       		</c:if>
				       </div>
				
				       <div class="card__body">
				     		<form role="form" id="serviceUpdateForm">
					           	<div class="row">
					               <div class="col-sm-12">
					                   <div class="input-group">
					                       <span class="input-group-addon"><i class="zmdi zmdi-battery-unknown"></i></span>
					                       <div class="form-group">
					                           <input type="text" class="form-control" placeholder="Name" value="${sessionScope.service.name}" name="name">
					                           <i class="form-group__bar"></i>
					                       </div>
					                   </div>
					                   <br/>
					                   <div class="input-group">
					                       <span class="input-group-addon"><i class="zmdi zmdi-battery-unknown"></i></span>
					                       <div class="form-group">
					                           <input type="text" class="form-control" placeholder="Title" value="${sessionScope.service.title}" name="title">
					                           <i class="form-group__bar"></i>
					                       </div>
					                   </div>
					                   <br/>
					                   <div class="input-group">
					                       <span class="input-group-addon"><i class="zmdi zmdi-battery-unknown"></i></span>
					                       <div class="form-group">
					                          <select class="form-control" name="type" id="serviceType">
					                          	<option value="CLINIC">Type 1</option>
					                          	<option value="BUSINESS">Type 2</option>
					                          </select>
					                           <i class="form-group__bar"></i>
					                       </div>
					                   </div>
					                   
					               </div>
					           </div>
					
					           <br/>
					
					           <h4>Content</h4>
					
					           <div class="row">
					               <div class="col-sm-12">
					                   <div class="form-group form-group--float">
				                           <textarea class="form-control" rows="20" name="content" id="serviceContent">${sessionScope.service.content}</textarea>
				                           <i class="form-group__bar"></i>
				                       </div>
					               </div>
									
					           </div>
					
					           <br/>
					           <button type="submit" class="btn btn-default">Save Update</button>
					   		</form>
				       </div>
				
				       <br/>
				       
				   </div>
				
			</section>
			
		<%@ include file="commons/Footer.jsp"%>
            
        </section>
		<%@ include file="commons/JsFiles.jsp"%>
        <!-- jQuery -->

	<script type="text/javascript">
		$("#cms_menus").addClass("navigation__sub--active navigation__sub--toggled");
	    $("#service_menu").addClass("navigation__active");
	    CKEDITOR.replace('serviceContent');
	    var serviceType = $('#serviceType');
	    
	    
	    $(document).ready(function(){
	    	serviceType.val('${sessionScope.service.type}');
	    	
	    	$( "#serviceUpdateForm" ).submit(function( event ) {
	      		console.log( $( this ).serialize() );
	      		event.preventDefault();
	      		  		
	      		var form = objectifyForm($( this ).serializeArray());
	      		form.content = CKEDITOR.instances.serviceContent.getData();
	      		
	      		var btn = $("#serviceUpdateForm button");
	      		btn.html("Updating...");
	      		btn.attr("disabled", "disabled");
	      		
	      		POST("ServicesAddUpdate", form, function(data){
	      			toastMessage(data);
	      			btn.html("Save Update");
	    	  		btn.removeAttr("disabled");
	      		})	
	    	});
	    })
	    
	</script>
        
</body>
</html>
