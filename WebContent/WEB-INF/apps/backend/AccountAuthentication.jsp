<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SSMC Login</title>
        <link href="assets/vendors/bower_components/animate.css/animate.min.css" rel="stylesheet">
        <link href="assets/vendors/bower_components/material-design-iconic-font/dist/css/material-design-iconic-font.min.css" rel="stylesheet">
		
        <link href="assets/css/app-1.min.css" rel="stylesheet">
        
        <script type="text/javascript" src="assets/vendors/bower_components/jquery/dist/jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/app.min.js"></script>
        
    </head>
    
    <body>
        <div class="login">

            <!-- Login -->
            <div class="login__block toggled" id="l-login">
                <div class="login__block__header">
                    <i class="zmdi zmdi-account-circle"></i>
                    Hi there! Please Sign in
                </div>

                <div class="login__block__body">
                	<form name="loginForm" method="POST">
	                    <div class="form-group form-group--float form-group--centered form-group--centered">
	                        <input type="text" class="form-control" name="username" id="loginUsername">
	                        <label>Username</label>
	                        <i class="form-group__bar"></i>
	                    </div>
	
	                    <div class="form-group form-group--float form-group--centered form-group--centered">
	                        <input type="password" class="form-control" name="password" id="loginPassword">
	                        <label>Password</label>
	                        <i class="form-group__bar"></i>
	                    </div>
						<input type='hidden' name='${_csrf.parameterName}' value="${_csrf.token}" />
	                    <button class="btn btn--light btn--icon m-t-15 submit-login-form" type="button"><i class="zmdi zmdi-long-arrow-right"></i></button>
	             	</form>
                </div>
       		</div>
        </div>
		
		
    </body>
    
    <script type="text/javascript">
    	
    	$(".submit-login-form").click(function(e){
    		var data = {
    				username : $("#loginUsername").val(),
    				password : $("#loginPassword").val()
    		}
    		
    		$.post("AccountAuthentication", data, function(data){
    			console.log(data);
    			if(data.status == "OK"){
    				window.location = "Accounts";
    			}
    		})
    		e.preventDefault();
    		console.log("asdsadsadsa", data);
    	})
    	
    </script>
</html>