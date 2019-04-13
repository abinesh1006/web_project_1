<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.userBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js">
      </script>
      <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="mystyle.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OTP REGISTRATION PAGE</title>
</head>
<body>
<% session = request.getSession(false) ;%>
<% if(null==session.getAttribute("signup")){
	response.sendRedirect("error.jsp");  
    }
	
%>
<%@ include file="header.jsp" %>
<%=session.getAttribute("message") %>
	<div ng-app="otpapp" ng-controller="otpcontroller">
		<center>
			<form name="form" role="form" action="submit" method="post">
				<div class="form-group"
					ng-class="{ 'has-error': form.otp_user.$dirty && form.otp_user.$error.required || form.otp_user.$invalid && form.otp_user.$touched}">

					<label for="otp_user">Please enter the otp </label>
					<input type="number"
						pattern="\d+" name="otp_user" id="otp_user" class="form-control"
						ng-model="otp_user" ng-minlength="6" required /> <span
						ng-show="form.otp_user.$dirty && form.otp_user.$error.required"
						class="help-block">otp is required</span>
				</div>
				<input type="submit" value="Submit">
			</form>
		</center>
	</div>
	<script>
    
	var otpapp = angular.module("otpapp", []);
         otpapp.controller('otpcontroller', function($scope) {
            $scope.otp_user="";
             
        
         });
      </script>
	
</body>
</html>