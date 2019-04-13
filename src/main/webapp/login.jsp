<div class="_forms_" id="_forms_">
<div class="container">
<div class="col-md-4 col-md-offset-1" >
	<h3>Login</h3>
	<%if(null!=session.getAttribute("login_messgae")){ %>
	<%=session.getAttribute("login_messgae") %>
	<%session.invalidate(); %>
	<%} %>
	<form name="form" ng-submit="vm.login()" role="form" action="Servlet1" method="post">
		<div class="form-group"
			ng-class="{ 'has-error': form.username.$dirty && form.username.$error.required || form.username.$invalid && form.username.$touched }">
			<label for="username">Username</label> <input type="email"
				name="username" id="username" class="form-control"
				ng-model="vm.username" required my-directive /> <span
				ng-show="form.username.$touched && form.username.$invalid && !form.username.$required"
				class="help-block">Enter Proper Email</span> <span
				ng-show="form.username.$dirty && form.username.$error.required"
				class="help-block">Username is required</span>
		</div>
		<div class="form-group"
			ng-class="{ 'has-error': form.password.$dirty && form.password.$error.required || form.password.$invalid && form.password.$touched}"
			required>
			<label for="password">Password</label> <input type="password"
				name="password" id="password" class="form-control"
				ng-model="vm.password" ng-minlength="6" required /> <span
				ng-show="form.password.$dirty && form.password.$error.required"
				class="help-block">Password is required</span> <span
				ng-show="form.password.$touched && form.password.$error.minlength"
				class="help-inline">Password must be more than 6 digit</span>

		</div>
		<input type="hidden" name="action" value="Login" />
		<div class="form-actions">
			<button type="submit" class="btn btn-primary">Login</button>
			<a href="#!/signup" class="btn btn-link">Register</a>
		</div>
	</form>
</div>
</div>
</div>
<!-- <style type="text/css">
  .css-form input.ng-invalid.ng-touched {
    background-color: #FA787E;
  }

  .css-form input.ng-valid.ng-touched {
    background-color: #78FA89;
  }
  .form-control
{
	outline: none;
    border-radius: 22px;
    border-top-left-radius: 22px;
    border-top-right-radius: 22px;
    border-bottom-right-radius: 22px;
    border-bottom-left-radius: 22px;
	
}
</style> -->