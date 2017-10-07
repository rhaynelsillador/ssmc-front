<!-- Modal -->
<div id="login_modal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="login-left">
        <img src="assets/img/login-img.png" alt="">
      </div>
      <div class="modal-body">

      	<div class="login-right">
          <h3>Login</h3>
          <form class="mc-form" id="loginForm">
            <div class="form-group">
              <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" name="email">
              <label for="exampleInputEmail1">Email address</label>
            </div>
            <div class="form-group">
              <input type="password" class="form-control" id="exampleInputPassword1" placeholder="" name="password">
              <label for="exampleInputPassword1">Password</label>
            </div>
            <div class="form-group hidden" id="loginErrorMessage">
	          <div class="alert alert-danger" role="alert"></div>
	        </div>
            <button type="submit" class="btn btn-submit">Submit</button>
            <br><br>
            <div class="text-center">
              <a href="#" style="color: #3465aa; font-size: 16px;">Not yet a member?</a>
            </div>
          </form>
      	</div>
      </div>
    </div>

  </div>
</div>

