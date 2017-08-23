<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
	<%@ include file="commons/Headers.jsp"%>
	
	<script>
		
      	function initMap() {
      		console.log("MAP RUNNING....");
        	var uluru = {lat: -25.363, lng: 131.044};
        	var map = new google.maps.Map(document.getElementById('map'), {
          		zoom: 4,
          	center: uluru
        	});
        	var marker = new google.maps.Marker({
	          	position: uluru,
	          	map: map
	        });
      	}
    </script> 
	
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
				       <h2>${requestScope.title}</h2>
				
				       <div class="actions">
	                        <a href="ClinicAndHospitalAdd"><i class="zmdi zmdi-plus"></i></a>
	                    </div>
				   </div>
				
				   <div class="card">
				       <div class="card__header">
				          	<h2>${sessionScope.TRANSACTION}</h2>
				       </div>
				
				       <div class="card__body">
				     		<form role="form" id="clinicUpdateForm">
					           	<div class="row">
					           		<div class="col-md-2">
					           			<input id="avatar-2" name="avatar-2" type="file" class="file-loading">
					           			
							          	<!-- <div class="fileinput fileinput-new" data-provides="fileinput">
							               <div class="fileinput-preview" data-trigger="fileinput">
							               </div>
							
							               <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
							               <span class="btn btn-default btn-file">
							                   <span class="fileinput-new">Select Logo</span>
							                   <span class="fileinput-exists">Change</span>
							                   <input type="file" name="...">
							               </span>
							           </div> -->
							           <%-- <div class="fileinput fileinput-new" data-provides="fileinput">
										  <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
										    <img data-src="${requestScope.clinic.logo}" src="${requestScope.clinic.logo}" alt="...">
										  </div>
										  <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
										  <div>
										    <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input type="file" name="..."></span>
										    <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
										  </div>
										</div> --%>
					           	    </div>
					           	    <div class="col-sm-10">
					           	    	<div class="input-group">
					                       <span class="input-group-addon"><i class="zmdi zmdi-account"></i></span>
					                       <div class="form-group">
					                           <input type="text" class="form-control" placeholder="Full Name" value="${requestScope.clinic.name}" name="name">
					                           <i class="form-group__bar"></i>
					                       </div>
					                   </div>
					                   <br/>
					           	    </div>
					               <div class="col-sm-5">
					                   <div class="input-group">
					                       <span class="input-group-addon"><i class="zmdi zmdi-battery-unknown"></i></span>
					                       <div class="form-group">
					                          <select class="form-control" name="type" id="businessType">
					                          	<option value="CLINIC">Clinic</option>
					                          	<option value="HOSPITAL">Hospital</option>
					                          </select>
					                           <i class="form-group__bar"></i>
					                       </div>
					                   </div>
					                   <br/>
										<c:forEach items="${requestScope.clinic.clinicContacts}" var="clinicContact">
										    <c:choose>
										        <c:when test="${clinicContact.type == 'M'}">
										            <div class="input-group">
								                       <span class="input-group-addon"><i class="zmdi zmdi-smartphone-iphone"></i></span>
								                       <div class="form-group">
								                           <input type="text" class="form-control" placeholder="Contact Number" value="${clinicContact.info}" name="mobile">
								                           <i class="form-group__bar"></i>
								                       </div>
								                   </div>
								                   <br/>
										        </c:when>
										        <c:when test="${clinicContact.type == 'P'}">
										            <div class="input-group">
								                       <span class="input-group-addon"><i class="zmdi zmdi-local-phone"></i></span>
								                       <div class="form-group">
								                           <input type="text" class="form-control" placeholder="Contact Number" value="${clinicContact.info}" name="phone">
								                           <i class="form-group__bar"></i>
								                       </div>
								                   </div>
								                   <br/>
										        </c:when>
										        <c:otherwise>
										            <div class="input-group">
								                       <span class="input-group-addon"><i class="zmdi zmdi-email"></i></span>
								                       <div class="form-group">
								                           <input type="text" class="form-control" placeholder="Email Address" value="${clinicContact.info}" name="email">
								                           <i class="form-group__bar"></i>
								                       </div>
								                   </div>
								                   <br/>
										        </c:otherwise>
										    </c:choose>
										</c:forEach>
					               </div>
					
					               <div class="col-sm-5">
					               		<div class="input-group">
					                       <span class="input-group-addon"><i class="zmdi zmdi-pin"></i></span>
					                       <div class="form-group">
					                           <input type="text" class="form-control" placeholder="Address 1" value="${requestScope.clinic.address1}" name="address1">
					                           <i class="form-group__bar"></i>
					                       </div>
					                   </div>
					                   <br/>
					                   <div class="input-group">
					                       <span class="input-group-addon"><i class="zmdi zmdi-pin"></i></span>
					                       <div class="form-group">
					                           <input type="text" class="form-control" placeholder="Address 2" value="${requestScope.clinic.address2}" name="address2">
					                           <i class="form-group__bar"></i>
					                       </div>
					                   </div>
					                   <br/>
					                   <div class="input-group">
					                       <span class="input-group-addon"><i class="zmdi zmdi-pin"></i></span>
					                       <div class="form-group">
					                       		<div class="form-group">
								               		<select class="form-control select2" style="width: 100%" name="city">
								               			<option value="">Select City</option>
					                       				<c:forEach items="${requestScope.cities}" var="city">
								                           	<option value="${city.key}" <c:if test="${requestScope.clinic.city == city.key}">selected</c:if>>${city.value}</option>
								                       	</c:forEach>
								                 	</select>
								             	</div>
					                           	<i class="form-group__bar"></i>
					                       </div>
					                   </div>
					               </div>					               
					           </div>
					
					           <br/>
					           <br/>
					           <br/>
					
					           <h4>Clinic Description</h4>
					
					           <div class="row">
					               <div class="col-sm-12">
					                   
				                       <div class="form-group form-group--float">
				                           <textarea class="form-control" rows="20" name="description" id="description">${requestScope.clinic.description}</textarea>
				                           <i class="form-group__bar"></i>
				                       </div>
					               </div>
									
					           </div>
					
					           <br/>
					           <br/>
					           <br/>
					
					           <p>Map
					
					           <br/>
								<div class="row">
						           	<div class="col-md-12">
						           		<div class="input-group">
					                       <span class="input-group-addon"><i class="zmdi zmdi-pin"></i></span>
					                       <div class="form-group">
					                           <input type="text" class="form-control" placeholder="Map" name="map" id="map" value="${requestScope.clinic.map}">
					                           <i class="form-group__bar"></i>
					                       </div>
					                   </div>
					                   <br/>
					           	    	<iframe width="100%" height="450" frameborder="0" style="border:0" src="${requestScope.clinic.map}" allowfullscreen></iframe>
					           	   		
					           	   	</div>
					           	</div>
					           	<br/>
					           	<br/>
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

	<script type="text/javascript" src="assets/js/backend/clinicUpdate.js"></script>
    	
    <script type="text/javascript">
    console.log('${requestScope.clinic.type}');
    	$("#businessType").val('${requestScope.clinic.type}');
    	var btnCust = '';
    	//var btnCust = '<button type="button" class="btn btn-default" title="Add picture tags" ' + 
        //'onclick="alert(\'Call your custom code here.\')">' +
        //'<i class="glyphicon glyphicon-tag"></i>' +
        //'</button>'; 
    	$("#avatar-2").fileinput({
    	    overwriteInitial: true,
    	    maxFileSize: 1500,
    	    showClose: false,
    	    showCaption: false,
    	    showBrowse: false,
    	    browseOnZoneClick: true,
    	    removeLabel: '',
    	    removeIcon: '<i class="zmdi zmdi-close-circle-o"></i>',
    	    removeTitle: 'Cancel or reset changes',
    	    elErrorContainer: '#kv-avatar-errors-2',
    	    msgErrorClass: 'alert alert-block alert-danger',
    	    defaultPreviewContent: '<img src="${requestScope.clinic.logo}" alt="Your Avatar" style="width:160px"><h6 class="text-muted">Click to select</h6>',
    	    layoutTemplates: {main2: '{preview} ' +  btnCust + ' {remove} {browse}'},
    	    allowedFileExtensions: ["jpg", "png", "gif"]
    	});
    </script>
    
</body>
</html>
