var app = angular.module("MyApp", []);
app.controller("MyCtrl", function ($scope){

    // Code to change theme of website using:
    //  Boostrap theme support dark and light theme, 
    //  AngularJS to change the value,
    //  LocalStorage to store the value.
	$scope.Theme = localStorage.getItem("UserThemeSetting")
	$scope.ChangeTheme = function(){
		$scope.Theme = $scope.Theme == 'dark' ? 'light' : 'dark'
		localStorage.setItem("UserThemeSetting", $scope.Theme)
	}


	$scope.Validation = function(){
		const forms = document.querySelectorAll('.needs-validation')

		Array.from(forms).forEach(form => {
			form.addEventListener('submit', event => {
				if (!form.checkValidity()) {
					event.preventDefault()
					event.stopPropagation()
				}
				form.classList.add('was-validated')
			}, false)
		})
	}
});