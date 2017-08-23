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
				       <h2>Role</h2>
				   </div>
				
				   <div class="card">
				       <div class="card__header">
				           <h2>${sessionScope.ROLENAME}</h2>
				       </div>
				
				       <div class="card__body">
				     		<form role="form" id="roleUpdateForm">
					           		
				           		<c:forEach items="${requestScope.roles}" var="roles">
				           			<h4>${roles.module}</h4>
				           			 <div class="row">
						                   
										<c:forEach items="${roles.roles}" var="role">
											<div class="col-sm-4 col-md-3">	
												<p>${role.access}</p>
							                   <div class="form-group">
							                       	<div class="toggle-switch">
							                           	<input type="checkbox" class="toggle-switch__checkbox roles" data-id="${role.id}" data-module="${roles.module}" data-access="${role.access}" data-name="${role.name}"  <c:if test="${role.status}">checked</c:if>>
							                          	<i class="toggle-switch__helper"></i>
							                       	</div>
							                   	</div>
						               		</div>
							     		</c:forEach>
							     	
					          		</div>
						     	</c:forEach>
					               
									<br/><br/>
					               	<div class="row">
										<h4>Control:</h4>
						               	<div class="col-sm-4 col-md-3">
						                   <p id="controlStatus">Select All</p>
						                   <div class="form-group">
						                       <div class="toggle-switch">
						                           <input type="checkbox" class="toggle-switch__checkbox" id="controlStatusBtn" checked>
						                           <i class="toggle-switch__helper"></i>
						                       </div>
						                   </div>
						               	</div>
						           	</div>
					
					           <br/>
					           <br/>
					           <br/>
								
					           <button type="submit" class="btn btn-default">Save Update</button>
					   		</form>
				       </div>
				   </div>
				   
			</section>
			
		<%@ include file="commons/Footer.jsp"%>
            
        </section>
		<%@ include file="commons/JsFiles.jsp"%>
        <!-- jQuery -->

	<script type="text/javascript">
		$("#administration_menus").addClass("navigation__sub--active navigation__sub--toggled");
		$("#roles_menu").addClass("navigation__active");
		
		$(document).ready(function(){
			
			checkIfCheckedAll();
			
			$( "#roleUpdateForm" ).submit(function( event ) {
		  		event.preventDefault();
		  		var roles = [];
		  		$(".roles:checked").each(function(){
					roles.push($(this).data())
				})
				
		  		var btn = $( "#roleUpdateForm button");
		  		btn.html("Updating...");
		  		btn.attr("disabled", "disabled");
		  		
		  		POST("RoleSaveUpdates", roles, function(data){
		  			toastMessage(data);
		  			btn.html("Save Update");
			  		btn.removeAttr("disabled");
			  		checkIfCheckedAll();
		  		})
			});
		})
		
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
		
	</script>
        
</body>
</html>
