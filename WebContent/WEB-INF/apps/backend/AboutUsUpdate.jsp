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
				       <h2>About Us</h2>
				
				       <div class="actions">
				           <a href="AboutUsAdd"><i class="zmdi zmdi-plus"></i></a>
				       </div>
				   </div>
				
				   <div class="card">
				       <div class="card__header">
				           	<h2>${sessionScope.TRANSACTION}</h2>
				           	<c:if test="${sessionScope.hasApproved == false }">
				           		<button class="btn btn-primary pull-right approved-fn" data-module="7" data-moduleId="${sessionScope.aboutUs.id}">Approve</button>
				       		</c:if>
				       </div>
				
				       <div class="card__body">
				     		<form role="form" id="aboutUsUpdateForm">
					           	<div class="row">
					               <div class="col-sm-12">
					                   <div class="input-group">
					                       <span class="input-group-addon"><i class="zmdi zmdi-battery-unknown"></i></span>
					                       <div class="form-group">
					                           <input type="text" class="form-control" placeholder="Name" value="${sessionScope.aboutUs.name}" name="name">
					                           <i class="form-group__bar"></i>
					                       </div>
					                   </div>
					                   <br/>
					                   <div class="input-group">
					                       <span class="input-group-addon"><i class="zmdi zmdi-battery-unknown"></i></span>
					                       <div class="form-group">
					                          <select class="form-control" name="type" id="aboutUsType">
					                          	<c:forEach items="${requestScope.type}" var="type">
					                          		<option value="${type}" <c:if test="${sessionScope.aboutUs.type}==${requestScope.type}">selected</c:if>>${type}</option>
					                          	</c:forEach>
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
				                           <textarea class="form-control" rows="20" name="content" id="aboutUsContent">${sessionScope.aboutUs.content}</textarea>
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
	    $("#about_us_menu").addClass("navigation__active");
	    CKEDITOR.replace('aboutUsContent');
	    var aboutUsType = $('#aboutUsType');
	    
	    
	    $(document).ready(function(){
	    	aboutUsType.val('${sessionScope.aboutUs.type}');
	    	
	    	$( "#aboutUsUpdateForm" ).submit(function( event ) {
	      		console.log( $( this ).serialize() );
	      		event.preventDefault();
	      		  		
	      		var form = objectifyForm($( this ).serializeArray());
	      		form.content = CKEDITOR.instances.aboutUsContent.getData();
	      		
	      		var btn = $("#aboutUsUpdateForm button");
	      		btn.html("Updating...");
	      		btn.attr("disabled", "disabled");
	      		
	      		POST("AboutUsUpdate", form, function(data){
	      			toastMessage(data);
	      			btn.html("Save Update");
	    	  		btn.removeAttr("disabled");
	      		})
	    	});
	    })
	    
	</script>
        
</body>
</html>
