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
				       <h2>Faq</h2>
				
				       <div class="actions">
				           <a href="FaqCreate"><i class="zmdi zmdi-plus"></i></a>
				       </div>
				   </div>
				
				   <div class="card">
				       <div class="card__header">
				           <h2>${sessionScope.TRANSACTION }</h2>
				       </div>
				
				       <div class="card__body">
				     		<form role="form" id="faqUpdateForm">
					           	<div class="row">
					               <div class="col-sm-12">
					                   <div class="input-group">
					                       <span class="input-group-addon"><i class="zmdi zmdi-battery-unknown"></i></span>
					                       <div class="form-group">
					                           <input type="text" class="form-control" placeholder="Question" value="${requestScope.faq.question}" name="question">
					                           <i class="form-group__bar"></i>
					                       </div>
					                   </div>
					               </div>
					           </div>
					
					           <br/>
					           <br/>
					           <br/>
					
					           <h4>Answer</h4>
					
					           <div class="row">
					               <div class="col-sm-12">
					                   <div class="form-group form-group--float">
				                           <textarea class="form-control" rows="20" name="answer" id="answer">${requestScope.faq.answer}</textarea>
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

	<script type="text/javascript" src="assets/js/backend/faqUpdate.js"></script>
        
</body>
</html>
