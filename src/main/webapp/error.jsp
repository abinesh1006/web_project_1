<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Montserrat:500" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Titillium+Web:700,900" rel="stylesheet">
<link href="mystyle.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% if(null==session.getAttribute("error_message")){%>
<h1><b>You are Not authorised to view this Page<b><h1><% }else{%>
<%=session.getAttribute("error_message") %>
<%} %>



<div id="notfound">
<div class="notfound">
<div class="notfound-404">
<h1>404</h1>
</div>
<h2>Oops! This Page Could Not Be Found</h2>
<p>Sorry but the page you are looking for does not exist, have been removed. name changed or is temporarily unavailable</p>
<%=session.getAttribute("error_message") %>
<a href="#">Go To Homepage</a>
</div>
</div>

<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13" type="65eb9b0eec6271d603636b1e-text/javascript"></script>
<script type="65eb9b0eec6271d603636b1e-text/javascript">
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>
<script src="https://ajax.cloudflare.com/cdn-cgi/scripts/a2bd7673/cloudflare-static/rocket-loader.min.js" data-cf-settings="65eb9b0eec6271d603636b1e-|49" defer=""></script>

</body>
</html>