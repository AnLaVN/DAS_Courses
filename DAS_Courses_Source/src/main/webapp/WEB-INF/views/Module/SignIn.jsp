<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<body>



	<!-- Sign In form -->
	<div class="card m-auto my-5" style="max-width: 32rem;">
		<div class="card-header"><h5 class="card-title">Sign In</h5></div>
		<div class="card-body">
			<form class="mx-1 mx-sm-3 mx-md-5 my-4 needs-validation" novalidate ng-init="Validation()" action="${url}SignIn" method="post">
				<div class="form-floating mb-4">
					<input type="text" class="form-control form-control-lg" id="txtUsernameSI" name="username" placeholder="Username" required>
					<label for="txtUsernameSI" class="form-label">Username</label>
					<div class="invalid-feedback">Username invalid</div>
				</div>
				<div class="form-floating mb-4" ng-init="showPassSI">
					<input type="{{showPassSI?'text':'password'}}" class="form-control form-control-lg" id="txtPass" name="matkhau" placeholder="Password" required>
					<label for="txtPass" class="form-label">Password</label>
					<div class="invalid-feedback">Password invalid</div>
					<div class="form-check is-valid">
						<input type="checkbox" class="form-check-input" id="rdoShowPassSI">
						<label class="form-check-label" for="rdoShowPassSI" ng-click="showPassSI=!showPassSI">Show password</label>
					</div>
				</div>
				<div class="form-check mb-4">
					<input type="checkbox" class="form-check-input" id="rdoCheck" name="rdoCheck">
					<label class="form-check-label" for="rdoCheck">Remember me?</label>
				</div>
				<div class="mt-5">
					<button type="submit" class="btn btn-lg btn-primary w-100">Sign In</button>
				</div>
			</form>
		</div>
	</div>



</body>
</html>