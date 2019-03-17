<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% if(null==session.getAttribute("error_message")){%>
<h1><b>You are Not authorised to view this Page<b><h1><% }else{%>
<%=session.getAttribute("error_message") %>
<%} %>


<% session.invalidate(); %>

</body>
</html>