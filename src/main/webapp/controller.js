/**
 * 
 */
var app = angular.module("myApp", ["ngRoute"]);
app.config(function($routeProvider) {
    $routeProvider
    .when("/", {
        templateUrl : "home.jsp"
    })
    .when("/login", {
        templateUrl : "login.jsp",
        	controller: 'loginController'
       
    })
    .when("/signup", {
        templateUrl : "signup.jsp",
        	controller: 'signUpController'
    })
    .when("/home", {
        templateUrl : "home.jsp"
    })
    .when("/otp", {
        templateUrl : "otp.jsp",
        	controller:'otpcontroller'
   
    })
    .when("/chatRoom",{
    	templateUrl : "chatRoom.html"
    		
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