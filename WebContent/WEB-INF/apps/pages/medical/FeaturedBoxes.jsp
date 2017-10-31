<div class="sec info">
  <div class="container">
    <div class="row">
      <div class="col-sm-4 wow bounceInUp">
        <div class="info-box box-1">
          <img src="assets/img/icon-info1.png" class="icon-info" alt="">
          <h4></h4>
          <p></p>
          <div class="info-bg">
            <img src="assets/img/bg-info1.jpg" alt="">
          </div>
        </div>

      </div>
      <div class="col-sm-4 wow bounceInUp">
        <div class="info-box box-2">
          <h4></h4>
          <p></p>
          <a href="#" class="btn">CONTACT US</a>
          <div class="info-bg">
            <img src="assets/img/bg-info2.jpg" alt="">
          </div>
        </div>

      </div>
      <div class="col-sm-4 wow bounceInUp">
        <div class="info-box news">
          <%-- <img src="assets/img/icon-info2.png" class="icon-info" alt="">
          <h4>QUALIFIED DOCTORS</h4>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Dui </p>
          <div class="info-bg">
            <img src="assets/img/bg-info3.jpg" alt="">
          </div> --%>
          <!-- <h4 class="text-center">NEW & UPDATES</h4> -->
          <h4>NO UPDATES</h4>


          <!-- <div class="news-container">
          	<div>
              <div class="news-box">
                <div class="news-img">
                  <img src="assets/img/small1.jpg" alt="">
                </div>
                <div class="news-content">
                  <span><strong class="news-title">Employee Seminar</strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span>
                  <a href="#">Learn more</a>
                </div>
              </div><div class="news-box">
                <div class="news-img">
                  <img src="assets/img/small1.jpg" alt="">
                </div>
                <div class="news-content">
                  <span><strong class="news-title">Employee Seminar</strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span>
                  <a href="#">Learn more</a>
                </div>
              </div><div class="news-box">
                <div class="news-img">
                  <img src="assets/img/small1.jpg" alt="">
                </div>
                <div class="news-content">
                  <span><strong class="news-title">Employee Seminar</strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span>
                  <a href="#">Learn more</a>
                </div>
              </div><div class="news-box">
                <div class="news-img">
                  <img src="assets/img/small1.jpg" alt="">
                </div>
                <div class="news-content">
                  <span><strong class="news-title">Employee Seminar</strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span>
                  <a href="#">Learn more</a>
                </div>
              </div>
          	</div>
          </div> -->
        </div>

      </div>
    </div>
  </div>
</div>

<script>
	
	POST("FeaturedBoxes", {"page":"Medical"}, function(data){
		console.log("FeaturedBoxes L ", data);
		$.each(data, function(index, value){
    		$(".box-"+value.box+" > h4").html(value.name.toUpperCase());
    		$(".box-"+value.box+" > p").html(value.description);
    	})
	})
	

</script>