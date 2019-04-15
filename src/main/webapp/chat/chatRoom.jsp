<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="bean.userBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<link href="../css/mystyle.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,800italic,700italic,600italic,400italic,300italic,800,700,600'
	rel='stylesheet' type='text/css'>

<link href="../css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="../css/style.css" rel="stylesheet" type="text/css">
<link href="../css/font-awesome.css" rel="stylesheet" type="text/css">
<link href="../css/responsive.css" rel="stylesheet" type="text/css">
<link href="../css/magnific-popup.css" rel="stylesheet" type="text/css">
<link href="../css/animate.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/jquery.1.8.3.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script type="text/javascript" src="../js/jquery-scrolltofixed.js"></script>
<script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../js/jquery.isotope.js"></script>
<script type="text/javascript" src="../js/wow.js"></script>
<script type="text/javascript" src="../js/classie.js"></script>
<script type="text/javascript" src="../js/magnific-popup.js"></script>
<script src="../js/contactform.js"></script>

</head>
<body>
	<nav class="main-nav-outer" id="test"> <!--main-nav-start-->
	<div class="container">
		<ul class="main-nav">
			<li><a href=".#!home">Home</a></li>
			<li><a href="#service" onclick="window.open('.#!home','_self');">Portfolios</a></li>
			<li><a href="#Portfolio">Services</a></li>
			<li class="small-logo"><a href="#div_check"
				onclick="window.open('#!profile','_self');"><img
					src="img/small-logo.png" alt="DP"></a></li>
			<li><a href="mailto:abineshsiva191@gmail.com"><span
					class="glyphicon glyphicon-envelope"></span> Mail Us</a></li>
			<li><a href="tel:95976332876"><span
					class="glyphicon glyphicon-phone-alt"></span> Call Us</a></li>

			<%if(null!=session.getAttribute("userSession")){ %>
			<li><a href="<%=request.getContextPath() %>/logout"><span
					class="glyphicon glyphicon-log-in"></span> Logout</a></li>
			<%}else{%>
			<li><a href="#div_check"
				onclick="window.open('.#!signup','_self');">Register</a></li>
			<li><a href="#div_check"
				onclick="window.open('.#!login','_self');">Login</a></li>

			<%} %>
		</ul>
		<a class="res-nav_click" href="#"><i class="fa fa-bars"></i></a>
	</div>
	</nav>
	<% if(null!=session.getAttribute("userSession")){
  userBean name= (userBean)session.getAttribute("login_user");
     request.setAttribute("name", name.getFirstName());
    }
else{
    response.sendRedirect(".#!/login");
    }
%>

	<div class="input-area">
		<textarea rows="1" cols="2"
			placeholder="Hi <%=request.getAttribute("name") %>, Say Something.."></textarea>
		<button id="button">Send</button>

		<div class="feed"></div>

		<script src='https://cdn.scaledrone.com/scaledrone.min.js'></script>
		<script>
  
  const CHANNEL_ID = '1ffLe1psyxTjtAdD';
  const drone = new Scaledrone(CHANNEL_ID);

  drone.on('open', error => {
    if (error) {
      return console.error(error);
    }});

  drone.on('close', event => console.log('Connection was closed', event));
  drone.on('error', error => console.error(error));

  const room = drone.subscribe('feed', {
    historyCount: 20 // ask for the 100 latest messages from history
  });

  room.on('history_message', ({data}) => {
    console.log(data);
    addFeedItemToTop(data);
  });

  room.on('data', data => {
    console.log(data);
    addFeedItemToTop(data);
  });

  //------------- DOM STUFF

  const DOM = {
    submitButton: document.querySelector('button'),
    textarea: document.querySelector('textarea'),
    feed: document.querySelector('.feed'),
  };

  DOM.submitButton.addEventListener('click', sendMessage);
	function sendMessage() {
    const value = "<%=request.getAttribute("name")%>:  "+DOM.textarea.value;
    if (!value) {
      return;
    }
    drone.publish({
      room: 'feed',
      
      message: {
        feedMessage: value,
  
      },
    });
    DOM.textarea.value = '';
  }

  function addFeedItemToTop(item) {
    DOM.feed.insertBefore(createFeedItem(item), DOM.feed.firstChild);
  }

 
  function createFeedItem(item) {
    const {feedMessage, color} = item;
    const el = document.createElement('div');
    el.appendChild(document.createTextNode(feedMessage));
    el.style.borderBottomColor = "#334425";
    el.className = 'feed-item';
    return el;
  }
  
</script>


</body>
</html>