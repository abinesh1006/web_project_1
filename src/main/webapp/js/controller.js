/**
 * 
 */
var app = angular.module("myApp", ["ngRoute"]);
app.constant("baseUrl","http://localhost.8090");
app.config(function($routeProvider,$locationProvider) {
    $routeProvider
    .when("/", {
        templateUrl : "home.jsp"
    })
    .when("/login", {
        templateUrl : "auths/login.jsp",
        	controller: 'loginController'
       
    })
    .when("/signup", {
        templateUrl : "auths/signup.jsp",
        	controller: 'signUpController'
    })
     .when("survey", {
        templateUrl : "survey/survey.jsp",
        	controller: 'surveyController'
    })
    .when("/home", {
        templateUrl : "home.jsp"
    })
    .when("/profile", {
        templateUrl : "profile.jsp",
        	controller: 'profileController'
       
    })
    .when("/otp", {
        templateUrl : "auths/otp.jsp",
        	controller:'otpcontroller'
   
    })
    .when("/success", {
        templateUrl : "auths/success.jsp",
        	controller:'sController'
   
    })
      .when("/error", {
        templateUrl : "auth/error.jsp",
        	controller:'errController'
   
    })
    .when("/chatRoom",{
    	templateUrl : "chatRoom.jsp",
    		controller:'chatController'
    		
    });
    
});
 app.controller('loginController', function($scope) {
    $scope.username = "";
    $scope.password = "";
    
});
 
 app.controller('signUpController', function($scope) {
	    $scope.firstName = "";
	    $scope.lastName = "";
	    $scope.email = "";
	    $scope.mobile="";
	    $scope.password = "";
	    $scope.signupfun = function(info){
	    	console.log("fbh");

	    	$http.post('userCreation/',{"firstName":info.firstName,"email":info.email,"lastName":info.lastName,"mobile":info.mobile}).success(function(data){
	    	if (data == true) {
	    	getInfo();
	    	// Hide details insertion form
	    	$('#empForm').css('display', 'none');
	    	}
	    	});
	    	}
	});
 
 
 app.directive('myDirective', function() {
    return {
        require: 'ngModel',
        link: function(scope, element, attr, mCtrl) {
            function myValidation(value) {
                if (value.indexOf('.') >3) {
                    mCtrl.$setValidity('char.', true);
                } else {
                    mCtrl.$setValidity('char.', false);
                }
                return value;
            }
            mCtrl.$parsers.push(myValidation);
        }
    };
});