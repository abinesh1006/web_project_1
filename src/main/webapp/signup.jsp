	<div class="col-md-4 col-md-offset-2">
    <h3>Signup</h3>
    <form name="form" ng-submit="signupfun(vm);" role="form" action="Servlet1" method="post">
        <div class="form-group" ng-class="{ 'has-error': form.username.$dirty && form.username.$error.required || form.username.$invalid && form.username.$touched }">
            <label for="firstName">first name</label>
            <input type="text" name="firstName" id="firstName" class="form-control" ng-model="vm.firstName" required />
            <span ng-show="form.firstName.$dirty && form.firstName.$error.required" class="help-block">First name is required</span>
        </div>
        <div class="form-group" ng-class="{ 'has-error': form.username.$dirty && form.username.$error.required || form.username.$invalid && form.username.$touched }">
            <label for="lastName">last name</label>
            <input type="text" name="lastName" id="lastName" class="form-control" ng-model="vm.lastName" required />
            <span ng-show="form.lastName.$dirty && form.lastName.$error.required" class="help-block">last name is required</span>
        </div>
         <div class="form-group" ng-class="{ 'has-error': form.email.$dirty && form.email.$error.required || form.email.$invalid && form.email.$touched }">
            <label for="email">Email</label>
            <input type="email" name="email" id="email" class="form-control" ng-model="vm.email" required my-directive/>
             <span ng-show="form.email.$touched && form.email.$invalid && !form.email.$required" class="help-block">Enter Proper Email</span>
            <span ng-show="form.email.$dirty && form.email.$error.required" class="help-block">email is required</span>
        </div>
        <div class="form-group" ng-class="{ 'has-error': form.mobileNumber.$dirty && form.mobileNumber.$error.required || form.mobileNumber.$invalid && form.mobileNumber.$touched}" required>
            <label for="mobileNumber">MobileNumer</label>
            <input type="mobileNumber" name="mobileNumber" id="mobileNumber" class="form-control" ng-model="vm.mobileNumber" ng-minlength="10" ng-maxlength=12 required />
            <span ng-show="form.mobileNumber.$touched && form.mobileNumber.$error.minlength" class="help-inline">mobile should be 10 digits</span>
        </div>
        <div class="form-group" ng-class="{ 'has-error': form.password.$dirty && form.password.$error.required || form.password.$invalid && form.password.$touched}" required>
            
            <label for="password">Password</label><input type="password" name="password" id="password" class="form-control" ng-model="vm.password" ng-minlength="6" required />
            <span ng-show="form.password.$dirty && form.password.$error.required" class="help-block">Password is required</span>
        </div>
        <div class="form-actions">
            <button type="submit"  class="btn btn-primary">Register</button>
            <a href="#!/login" class="btn btn-link">Login</a>
        </div>
    </form>
</div> 