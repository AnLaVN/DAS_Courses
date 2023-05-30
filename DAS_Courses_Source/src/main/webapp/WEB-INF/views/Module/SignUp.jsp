<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<body>



	<!-- Sign Up form -->
	<div class="card m-auto my-5" style="max-width: 32rem;">
		<div class="card-header"><h5 class="card-title">Sign Up</h5></div>
		<div class="card-body">
			<form class="mx-1 mx-sm-3 mx-md-4 my-4 needs-validation" novalidate name="formSU" action="${url}SignUp" method="post" enctype="multipart/form-data">
				<div class="form-floating mb-4">
					<input type="text" class="form-control form-control-lg" id="txtUsernameSU" name="username" placeholder="Username" required>
					<label for="txtUsernameSU" class="form-label">Username</label>
					<div class="invalid-feedback">Username invaild</div>
				</div>
				<div class="form-floating mb-4">
					<input type="text" class="form-control form-control-lg" id="txtFullnameSU" name="ten" placeholder="Fullname" required>
					<label for="txtFullnameSU" class="form-label">Fullname</label>
					<div class="invalid-feedback">Fullname invalid</div>
				</div>
				<div class="form-floating mb-4">
					<input type="email" class="form-control form-control-lg" id="txtEmailSU" name="email" placeholder="Email" required>
					<label for="txtEmailSU" class="form-label">Email</label>
					<div class="invalid-feedback">Email invalid</div>
				</div>
				<div class="form-floating mb-4" ng-init="showPassSU">
					<input type="{{showPassSU?'text':'password'}}" class="form-control form-control-lg {{formSU.matkhau.$valid?'':'is-invalid'}}"
					id="txtNPassSU" name="matkhau" placeholder="Password" required ng-model="NPassSU" ng-pattern="/^(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/">
					<label for="txtNPassSU" class="form-label">Password</label>
					<div class="form-check is-valid">
						<input type="checkbox" class="form-check-input" id="rdoShowPassSU">
						<label class="form-check-label" for="rdoShowPassSU" ng-click="showPassSU=!showPassSU">Show password</label>
					</div>
					<div class="invalid-feedback">Invalid Password</div>
				</div>
				<div class="form-floating mb-4">
					<input type="{{showPassSU?'text':'password'}}" class="form-control form-control-lg {{NPassSU!=CPassSU?'is-invalid':''}}"
					id="txtCPassSU" name="txtCPassSU" placeholder="Password" required ng-model="CPassSU">
					<label for="txtCPassSU" class="form-label">Confirm password</label>
					<div class="invalid-feedback">Confirm password invalid</div>
				</div>
				<div class="has-validation mb-4">
					<label for="inpThumbnail" class="form-label">Avatar</label>
					<input type="file" class="form-control form-control-lg" name="picAvatar" id="inpThumbnail" required>
					<div class="invalid-feedback">Avatar invalid</div>
				</div>
				<div class="mt-5">
					<button type="submit" class="btn btn-lg btn-primary w-100">Sign Up</button>
				</div>
			</form>
		</div>
	</div>



</body>
</html>