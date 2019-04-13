
<style>


.topleft {
  position: absolute;
  top: 0;
  left: 16px;
}


.middle {
  position: absolute;
  top: 30%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
}

hr {
  margin: auto;
  width: 40%;
}
</style>
<body>

  
  <div class="middle">
    <h1>COMING SOON</h1>
    <hr>
    <p id="demo" style="font-size:25px"></p>
  </div>
<header class="header" id="header">
		<!--header-start-->
	
		<div class="container">
		
			<figure class="logo animated fadeInDown delay-07s">
			</figure>
			<h1 class="animated fadeInDown delay-07s">Welcome To the new World</h1>
			<ul class="we-create animated fadeInUp delay-1s">
				<li>Everything starts with Small Steps.......</li>
			</ul>
			<a class="link animated fadeInUp delay-1s servicelink" href="#service">Get Started</a>
		</div>
	</header>
<script type="text/javascript">
// Set the date we're counting down to
var countDownDate = new Date("Apr 20, 2019 18:00:00").getTime();

// Update the count down every 1 second
var countdownfunction = setInterval(function() {

  // Get todays date and time
  var now = new Date().getTime();
  
  // Find the distance between now an the count down date
  var distance = countDownDate - now;
  
  // Time calculations for days, hours, minutes and seconds
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
  
  // Output the result in an element with id="demo"
  document.getElementById("demo").innerHTML = days + "d " + hours + "h "
  + minutes + "m " + seconds + "s ";
  
  // If the count down is over, write some text 
  if (distance < 0) {
    clearInterval(countdownfunction);
    document.getElementById("demo").innerHTML = "EXPIRED";
  }
}, 1000);
</script>
