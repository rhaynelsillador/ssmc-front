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
				       <h2><c:if test = "${requestScope.users.username == null}">New Account</c:if><c:if test = "${requestScope.users.username != null}">${requestScope.users.username}</c:if></h2>
				
				       <div class="actions">
                        <a href="AccountAdd"><i class="zmdi zmdi-plus"></i></a>
                    	</div>
				   </div>
				
				   <div class="card">
			    		<ul class="tab-nav tab-nav--justified tab-nav--icon">
	                        <li class="active">
	                            <a class="col-sx-4" href="#personalInfo" data-toggle="tab" aria-expanded="true">
	                               <i class="zmdi zmdi-account"></i> Personal Information
	                            </a>
	                        </li>
	                        <li class="">
	                            <a class="col-xs-4" href="#roleAccess" data-toggle="tab" aria-expanded="false">
	                               <i class="zmdi zmdi-check-all"></i> Role Access
	                            </a>
	                        </li>
	                    </ul>
				       	<div class="card__body">
				     		<form role="form" id="userUpdateForm">
				     			<div class="tab-content">
                                	<div class="tab-pane fade in active" id="personalInfo">
							           	<div class="row">
							               <div class="col-sm-4">
							                   <div class="input-group">
							                       <span class="input-group-addon"><i class="zmdi zmdi-account"></i></span>
							                       <div class="form-group">
							                           <input type="text" class="form-control" placeholder="Username" value="${requestScope.users.username}" name="username" <c:if test="${sessionScope.TRANSACTION =='UPDATE'}">disabled</c:if>>
							                           <i class="form-group__bar"></i>
							                       </div>
							                   </div>
							                   <br/>
							                   <div class="input-group">
							                       <span class="input-group-addon"><i class="zmdi zmdi-account"></i></span>
							                       <div class="form-group">
							                           <input type="text" class="form-control" placeholder="First Name" value="${requestScope.users.firstName}" name=firstName>
							                           <i class="form-group__bar"></i>
							                       </div>
							                   </div>
							                   <br/>
							                   <div class="input-group">
							                       <span class="input-group-addon"><i class="zmdi zmdi-account"></i></span>
							                       <div class="form-group">
							                           <input type="text" class="form-control" placeholder="Last Name" value="${requestScope.users.lastName}" name="lastName">
							                           <i class="form-group__bar"></i>
							                       </div>
							                   </div>    
							                    <br/>                   
							               </div>
							
							               <div class="col-sm-4">
							               
							               		<div class="input-group">
							                       <span class="input-group-addon"><i class="zmdi zmdi-email"></i></span>
							                       <div class="form-group">
							                           <input type="text" class="form-control" placeholder="Email Address" value="${requestScope.users.email}" name="email">
							                           <i class="form-group__bar"></i>
							                       </div>
							                   </div>
							               	   <br/>
							                   <div class="input-group">
							                       <span class="input-group-addon"><i class="zmdi zmdi-smartphone-iphone"></i></span>
							                       <div class="form-group">
							                           <input type="text" class="form-control" placeholder="Mobile" value="${requestScope.users.mobile}" name="mobile">
							                           <i class="form-group__bar"></i>
							                       </div>
							                   </div>
											   <br/>
							                   <div class="input-group">
							                       <span class="input-group-addon"><i class="zmdi zmdi-phone"></i></span>
							                       <div class="form-group">
							                           <input type="text" class="form-control" placeholder="Phone" value="${requestScope.users.phone}" name="phone">
							                           <i class="form-group__bar"></i>
							                       </div>
							                   </div>
							               </div>
							
							               <div class="col-sm-4">
							               
							               		<div class="input-group">
							                       <span class="input-group-addon"><i class="zmdi zmdi-calendar-note"></i></span>
							                       <div class="form-group">
							                           <input type="text" class="form-control" placeholder="Birthday" value="${requestScope.users.birthday}" name="birthday">
							                           <i class="form-group__bar"></i>
							                       </div>
							                   </div>
							                   <br/>
							                   <div class="input-group">
							                       <span class="input-group-addon"><i class="zmdi zmdi-calendar-note"></i></span>
							                       <div class="form-group">
							                           <input type="text" class="form-control" placeholder="Date Last Login" value="${requestScope.users.dateLastLogin}" name="dateLastLogin" disabled="disabled" readonly="readonly">
							                           <i class="form-group__bar"></i>
							                       </div>
							                   </div>
							                   <br/>
							                   <div class="input-group">
							                       <span class="input-group-addon"><i class="zmdi zmdi-calendar-note"></i></span>
							                       <div class="form-group">
							                           <input type="text" class="form-control" placeholder="Date Created" value="${requestScope.users.dateCreated}" name="dateCreated" disabled="disabled" readonly="readonly">
							                           <i class="form-group__bar"></i>
							                       </div>
							                   </div>
							                   
							           		</div>
							           		<div class="col-md-12">
							                   <div class="input-group">
							                       <span class="input-group-addon"><i class="zmdi zmdi-pin"></i></span>
							                       <div class="form-group">
							                           <input type="text" class="form-control" placeholder="Address" value="${requestScope.users.address}" name="address">
							                           <i class="form-group__bar"></i>
							                       </div>
							                   </div>	
							           		</div>
										</div>
							           <br/>
							           <br/>
							           <br/>
										</div>
										<div class="tab-pane fade in" id="roleAccess">
					           				<div class="row">
					           					<div class="col-sm-4">
					           						<select class="form-control" id="roleName" id="roleName">
					           							<c:forEach items="${requestScope.role}" var="role">
					           								<option value="${role.id}">${role.name}</option>
					           							</c:forEach>
					           						</select>
					           					</div>
					           				</div>
					           				
					           				<div id="userDefaultRoles"></div>
					           				
						           			
					           
					           
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
										</div>
									</div>
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
		$("#accounts_menu").addClass("navigation__active");
		$(document).ready(function(){
			
			checkIfCheckedAll();
			
			$( "#userUpdateForm" ).submit(function( event ) {
		  		event.preventDefault();
		  		
		  		var roles = [];
		  		$(".roles:checked").each(function(){
					roles.push($(this).data())
				})
				
		  		var form = objectifyForm($( this ).serializeArray());
		  		form.id = "${requestScope.users.id}";
		  		form.roles = roles;
		  		
		  		var btn = $( "#userUpdateForm button");
		  		btn.html("Updating...");
		  		btn.attr("disabled", "disabled");
		  		
		  		POST("AddUpdateUser", form, function(data){
		  			toastMessage(data);
		  			btn.html("Save Update");
			  		btn.removeAttr("disabled");
			  		checkIfCheckedAll();
		  		})	  		
			});
			
		})
		
		getDefaultRoleAccess()	
		
		$("#roleName").change(function(){
			getDefaultRoleAccess();
		})
		
		function getDefaultRoleAccess(){
			var form = {
				name : $("#roleName :selected").text(),
				id:  $("#roleName :selected").val(),
			}
			POST("UserRoles", form, function(data){
	  			var userDefaultRoles = "";
	  			for (var i = 0; i < data.length; i++) {
	  				userDefaultRoles += '<h4>'+data[i].module+'</h4><div class="row">';
	  				for (var j = 0; j < data[i].roles.length; j++) {
	  					userDefaultRoles += '<div class="col-sm-4 col-md-3"><p>'+data[i].roles[j].access+'</p>';
	  					userDefaultRoles += '<div class="form-group">';
	  					userDefaultRoles += '<div class="toggle-switch">';
	  					userDefaultRoles += '<input type="checkbox" class="toggle-switch__checkbox roles" data-id="'+data[i].roles[j].id+'" data-module="'+data[i].module+'" data-access="'+data[i].roles[j].access+'" data-name="'+data[i].roles[j].name+'" '+(data[i].roles[j].status ? 'checked' : '')+'>';
	  					userDefaultRoles += '<i class="toggle-switch__helper"></i>';
	  					userDefaultRoles += '</div></div></div>';
					}
	  				userDefaultRoles += '</div>';
				}
	  			$("#userDefaultRoles").html(userDefaultRoles);
	  		})	
		}
		
		/* <c:forEach items="${requestScope.userRoles}" var="roles">
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
 	</c:forEach> */
		
	</script>
        
</body>
</html>
